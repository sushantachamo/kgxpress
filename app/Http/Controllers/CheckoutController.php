<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Category;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\InstamojoController;
use App\Http\Controllers\ClubPointController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\PublicSslCommerzPaymentController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AffiliateController;
use App\Http\Controllers\PaytmController;
use App\Order;
use App\BusinessSetting;
use App\Coupon;
use App\CouponUsage;
use App\User;
use App\Address;
use App\Product;
use Session;
use App\Utility\PayhereUtility;

class CheckoutController extends Controller
{

    public function __construct()
    {
        //
    }

    //check the selected payment gateway and redirect to that controller accordingly
    public function checkout(Request $request)
    {
        if ($request->payment_option != null) {

            $orderController = new OrderController; 
            
            $orderController->store($request);
            $request->session()->put('payment_type', 'cart_payment');
            
            
            if($request->session()->get('order_id') != null){
                if($request->payment_option == 'paypal'){
                    $paypal = new PaypalController;
                    return $paypal->getCheckout();
                }
                elseif ($request->payment_option == 'stripe') {
                    $stripe = new StripePaymentController;
                    return $stripe->stripe();
                }
                elseif ($request->payment_option == 'sslcommerz') {
                    $sslcommerz = new PublicSslCommerzPaymentController;
                    return $sslcommerz->index($request);
                }
                elseif ($request->payment_option == 'instamojo') {
                    $instamojo = new InstamojoController;
                    return $instamojo->pay($request);
                }
                elseif ($request->payment_option == 'razorpay') {
                    $razorpay = new RazorpayController;
                    return $razorpay->payWithRazorpay($request);
                }
                elseif ($request->payment_option == 'paystack') {
                    $paystack = new PaystackController;
                    return $paystack->redirectToGateway($request);
                }
                elseif ($request->payment_option == 'voguepay') {
                    $voguePay = new VoguePayController;
                    return $voguePay->customer_showForm();
                }
                elseif ($request->payment_option == 'twocheckout') {
                    $twocheckout = new TwoCheckoutController;
                    return $twocheckout->index($request);
                }
                elseif ($request->payment_option == 'payhere') {
                    $order = Order::findOrFail($request->session()->get('order_id'));

                    $order_id = $order->id;
                    $amount = $order->grand_total;
                    $first_name = json_decode($order->shipping_address)->name;
                    $last_name = 'X';
                    $phone = json_decode($order->shipping_address)->phone;
                    $email = json_decode($order->shipping_address)->email;
                    $address = json_decode($order->shipping_address)->address;
                    $city = json_decode($order->shipping_address)->city;

                    return PayhereUtility::create_checkout_form($order_id, $amount, $first_name, $last_name, $phone, $email, $address, $city);
                }
                elseif ($request->payment_option == 'paytm') {
                    $paytm = new PaytmController;
                    return $paytm->index();
                }
                elseif ($request->payment_option == 'cash_on_delivery') {
                    $request->session()->put('cart', collect([]));
                    // $request->session()->forget('order_id');
                    $request->session()->forget('delivery_info');
                    $request->session()->forget('coupon_id');
                    $request->session()->forget('coupon_discount');

                    flash(translate("Your order has been placed successfully"))->success();
                	return redirect()->route('order_confirmed');
                }
                elseif ($request->payment_option == 'wallet') {
                    $user = Auth::user();
                    $user->balance -= Order::findOrFail($request->session()->get('order_id'))->grand_total;
                    $user->save();
                    return $this->checkout_done($request->session()->get('order_id'), null);
                }
                else{
                    $order = Order::findOrFail($request->session()->get('order_id'));
                    $order->manual_payment = 1;
                    $order->save();

                    $request->session()->put('cart', collect([]));
                    // $request->session()->forget('order_id');
                    $request->session()->forget('delivery_info');
                    $request->session()->forget('coupon_id');
                    $request->session()->forget('coupon_discount');

                    flash(translate('Your order has been placed successfully. Please submit payment information from purchase history'))->success();
                	return redirect()->route('order_confirmed');
                }
            }
        }else {
            flash(translate('Select Payment Option.'))->warning();
            return back();
        }
    }

    //redirects to this method after a successfull checkout
    public function checkout_done($order_id, $payment)
    {
        $order = Order::findOrFail($order_id);
        $order->payment_status = 'paid';
        $order->payment_details = $payment;
        $order->save();

        if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
            $affiliateController = new AffiliateController;
            $affiliateController->processAffiliatePoints($order);
        }

        if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
            $clubpointController = new ClubPointController;
            $clubpointController->processClubPoints($order);
        }

        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() == null || !\App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
                $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if($orderDetail->product->user->user_type == 'seller'){
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100 + $orderDetail->tax + $orderDetail->shipping_cost;
                        $seller->save();
                    }
                }
            }
            else{
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if($orderDetail->product->user->user_type == 'seller'){
                        $commission_percentage = $orderDetail->product->category->commision_rate;
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100  + $orderDetail->tax + $orderDetail->shipping_cost;
                        $seller->save();
                    }
                }
            }
        }
        else {
            foreach ($order->orderDetails as $key => $orderDetail) {
                $orderDetail->payment_status = 'paid';
                $orderDetail->save();
                if($orderDetail->product->user->user_type == 'seller'){
                    $seller = $orderDetail->product->user->seller;
                    $seller->admin_to_pay = $seller->admin_to_pay + $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                    $seller->save();
                }
            }
        }

        $order->commission_calculated = 1;
        $order->save();

        Session::put('cart', collect([]));
        // Session::forget('order_id');
        Session::forget('payment_type');
        Session::forget('delivery_info');
        Session::forget('coupon_id');
        Session::forget('coupon_discount');

        flash(translate('Payment completed'))->success();
        return view('frontend.order_confirmed', compact('order'));
    }

    public function get_shipping_info(Request $request)
    {
        
        if(Session::has('cart') && count(Session::get('cart')) > 0){
            $categories = Category::all();
            return view('frontend.shipping_info', compact('categories'));
        }
        flash(translate('Your cart is empty'))->success();
        return back();
    }

    public function store_shipping_info(Request $request)
    {
        if (Auth::check()) {
            if($request->address_id == null){
                flash(translate("Please add shipping address"))->warning();
                return back();
            }
            $address = Address::findOrFail($request->address_id);
            $data['name'] = Auth::user()->name;
            $data['email'] = Auth::user()->email;
            $data['address'] = $address->address;
            $data['country'] = $address->country;
            $data['city'] = $address->city;
            $data['postal_code'] = $address->postal_code;
            $data['phone'] = $address->phone;
            $data['checkout_type'] = $request->checkout_type;
        }
        else {
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['address'] = $request->address;
            $data['country'] = $request->country;
            $data['city'] = $request->city;
            $data['postal_code'] = $request->postal_code;
            $data['phone'] = $request->phone;
            $data['checkout_type'] = $request->checkout_type;
        }

        $shipping_info = $data;
        $request->session()->put('shipping_info', $shipping_info);

        $subtotal = 0;
        $tax = 0;
        $shipping = 0;
        foreach (Session::get('cart') as $key => $cartItem){
            $subtotal += $cartItem['price']*$cartItem['quantity'];
            $tax += $cartItem['tax']*$cartItem['quantity'];
            $shipping += $cartItem['shipping']*$cartItem['quantity'];
        }

        $total = $subtotal + $tax + $shipping;

        if(Session::has('coupon_discount')){
                $total -= Session::get('coupon_discount');
        }

        return view('frontend.delivery_info');
        // return view('frontend.payment_select', compact('total'));
    }

    public function store_delivery_info(Request $request)
    {
        if(Session::has('cart') && count(Session::get('cart')) > 0){
            $cart = $request->session()->get('cart', collect([]));
            $cart = $cart->map(function ($object, $key) use ($request) {
                if(\App\Product::find($object['id'])->added_by == 'admin'){
                    if($request['shipping_type_admin'] == 'home_delivery'){
                        $object['shipping_type'] = 'home_delivery';
                    }
                    else{
                        $object['shipping_type'] = 'pickup_point';
                        $object['pickup_point'] = $request->pickup_point_id_admin;
                    }
                }
                else{
                    if($request['shipping_type_'.\App\Product::find($object['id'])->user_id] == 'home_delivery'){
                        $object['shipping_type'] = 'home_delivery';
                    }
                    else{
                        $object['shipping_type'] = 'pickup_point';
                        $object['pickup_point'] = $request['pickup_point_id_'.\App\Product::find($object['id'])->user_id];
                    }
                }
                return $object;
            });

            $request->session()->put('cart', $cart);

            $cart = $cart->map(function ($object, $key) use ($request) {
                $object['shipping'] = getShippingCost($key);
                return $object;
            });

            $request->session()->put('cart', $cart);

            $subtotal = 0;
            $tax = 0;
            $shipping = 0;
            foreach (Session::get('cart') as $key => $cartItem){
                $subtotal += $cartItem['price']*$cartItem['quantity'];
                $tax += $cartItem['tax']*$cartItem['quantity'];
                $shipping += $cartItem['shipping']*$cartItem['quantity'];
            }

            $total = $subtotal + $tax + $shipping;

            if(Session::has('coupon_discount')){
                    $total -= Session::get('coupon_discount');
            }

            //dd($total);
            /* 
                * Start ConnectIps API Payment
            */
            
            $carts = Session::get('cart');
            $product_name = null;
            $total = 0;
            foreach($carts as $cart_item) {
                $product_code = \App\Product::find($cart_item['id']);
                $product_name .=  $product_code['name'];
                $subtotal = ($product_code['purchase_price'] * $cart_item['quantity'] );
                $total = ($total + $subtotal);
                
            }
            $orders = Order::orderBy('id','DESC')->first();
            // dd($orders->code);

            $pfxCertPrivado = $_SERVER['DOCUMENT_ROOT']."/public/certificate/CREDITOR.pfx";     /* Server */
            // $pfxCertPrivado = public_path("certificate/CREDITOR.pfx");     /* localhost */
            $cert_password  = env('NCHL_CERTIFICATE_PASSWORD');
            if (!is_file($pfxCertPrivado)) {
                dd("Certificate not found !!" . $pfxCertPrivado);
                
            }
            $pfxContent = file_get_contents($pfxCertPrivado);
            if (!openssl_pkcs12_read($pfxContent, $x509certdata, $cert_password)) {
                dd("The certificate cannot be read !!");
            } 
            else {
                $CertPriv   = array();
                $CertPriv   = openssl_x509_parse(openssl_x509_read($x509certdata['cert']));
                $PrivateKey = $x509certdata['pkey'];
                $pub_key = openssl_pkey_get_public($x509certdata['cert']);
                $keyData = openssl_pkey_get_details($pub_key);
                $PublicKey  = $keyData['key'];
                //for connectips
                $merchatid = env('NCHL_MERCHANT_ID');
                $appid = env('NCHL_APP_ID');
                $appname = env('NCHL_APP_NAME');
                $txnid = date('Ymd-His');
                $txndate = date('d-m-Y');
                $txncrncy = "NPR";
                $txnamt = $total * 100; //in pasia
                $referenceid = "Refernced-".$txnid;
                $remarks = "Payment by Connect IPS - ".env('APP_NAME');
                $particular = $product_name;
                $token = "TOKEN";
                $string = "MERCHANTID=$merchatid,APPID=$appid,APPNAME=$appname,TXNID=$txnid,TXNDATE=$txndate,TXNCRNCY=$txncrncy,TXNAMT=$txnamt,REFERENCEID=$referenceid,REMARKS=$remarks,PARTICULARS=$particular,TOKEN=$token";
                if(openssl_sign($string, $signature , $PrivateKey , 'sha256WithRSAEncryption')) {
                    $hash =  base64_encode($signature);
                }
                $data = array(
                    "MERCHANTID" => $merchatid,
                    "APPID" => $appid,
                    "APPNAME" => $appname,
                    "TXNID" => $txnid,
                    "TXNDATE" => $txndate,
                    "TXNCRNCY" => $txncrncy,
                    "TXNAMT" => $txnamt,
                    "REFERENCEID" => $referenceid,
                    "REMARKS" => $remarks,
                    "PARTICULARS" => $particular,
                    "TOKEN" => $hash
                );
            }
            /* 
                * End ConnectIps API Payment
            */

            /* 
                * Start NIBL API Payment
            */

            /* 
                * End NIBL API Payment
            */

            return view('frontend.payment_select', compact('total','data', 'carts'));
        }
        else {
            flash(translate('Your Cart was empty'))->warning();
            return redirect()->route('home');
        }
    }

    public function get_payment_info(Request $request)
    {
        $subtotal = 0;
        $tax = 0;
        $shipping = 0;
        foreach (Session::get('cart') as $key => $cartItem){
            $subtotal += $cartItem['price']*$cartItem['quantity'];
            $tax += $cartItem['tax']*$cartItem['quantity'];
            $shipping += $cartItem['shipping']*$cartItem['quantity'];
        }

        $total = $subtotal + $tax + $shipping;

        if(Session::has('coupon_discount')){
                $total -= Session::get('coupon_discount');
        }

        return view('frontend.payment_select', compact('total'));
    }

    public function apply_coupon_code(Request $request){
        //dd($request->all());
        $coupon = Coupon::where('code', $request->code)->first();

        if($coupon != null){
            if(strtotime(date('d-m-Y')) >= $coupon->start_date && strtotime(date('d-m-Y')) <= $coupon->end_date){
                if(CouponUsage::where('user_id', Auth::user()->id)->where('coupon_id', $coupon->id)->first() == null){
                    $coupon_details = json_decode($coupon->details);

                    if ($coupon->type == 'cart_base')
                    {
                        $subtotal = 0;
                        $tax = 0;
                        $shipping = 0;
                        foreach (Session::get('cart') as $key => $cartItem)
                        {
                            $subtotal += $cartItem['price']*$cartItem['quantity'];
                            $tax += $cartItem['tax']*$cartItem['quantity'];
                            $shipping += $cartItem['shipping']*$cartItem['quantity'];
                        }
                        $sum = $subtotal+$tax+$shipping;

                        if ($sum > $coupon_details->min_buy) {
                            if ($coupon->discount_type == 'percent') {
                                $coupon_discount =  ($sum * $coupon->discount)/100;
                                if ($coupon_discount > $coupon_details->max_discount) {
                                    $coupon_discount = $coupon_details->max_discount;
                                }
                            }
                            elseif ($coupon->discount_type == 'amount') {
                                $coupon_discount = $coupon->discount;
                            }
                            $request->session()->put('coupon_id', $coupon->id);
                            $request->session()->put('coupon_discount', $coupon_discount);
                            flash(translate('Coupon has been applied'))->success();
                        }
                    }
                    elseif ($coupon->type == 'product_base')
                    {
                        $coupon_discount = 0;
                        foreach (Session::get('cart') as $key => $cartItem){
                            foreach ($coupon_details as $key => $coupon_detail) {
                                if($coupon_detail->product_id == $cartItem['id']){
                                    if ($coupon->discount_type == 'percent') {
                                        $coupon_discount += $cartItem['price']*$coupon->discount/100;
                                    }
                                    elseif ($coupon->discount_type == 'amount') {
                                        $coupon_discount += $coupon->discount;
                                    }
                                }
                            }
                        }
                        $request->session()->put('coupon_id', $coupon->id);
                        $request->session()->put('coupon_discount', $coupon_discount);
                        flash(translate('Coupon has been applied'))->success();
                    }
                }
                else{
                    flash(translate('You already used this coupon!'))->warning();
                }
            }
            else{
                flash(translate('Coupon expired!'))->warning();
            }
        }
        else {
            flash(translate('Invalid coupon!'))->warning();
        }
        return back();
    }

    public function remove_coupon_code(Request $request){
        $request->session()->forget('coupon_id');
        $request->session()->forget('coupon_discount');
        return back();
    }

    public function order_confirmed(){
        $order = Order::findOrFail(Session::get('order_id'));
        return view('frontend.order_confirmed', compact('order'));
    }
    //nibl Payment
    public function nibl_payment() {
        
        $carts = Session::get('cart');
        return view('nibl_payment.view_cart', compact('carts'));
    }
    public function nibl_payment_process (Request $request) {
        // dd("i am here");
        return view('nibl_payment.ipay-express-checkout.process');
    }
    public function nibl_payment_confirm(Request $request) {
        
        // dd($request);
        return view('nibl_payment.ipay-express-checkout.confirm');
    }
    public function nibl_payment_fail() {
        return view('nibl_payment.payment.fail');
    }
    public function connect_ips_confirm() {
        /* 
            * Start ConnectIps API Payment
        */
            
        $carts = Session::get('cart');
        $product_name = null;
        $total = 0;
        foreach($carts as $cart_item) {
            $product_code = \App\Product::find($cart_item['id']);
            $product_name .=  $product_code['name'];
            $subtotal = ($product_code['purchase_price'] * $cart_item['quantity'] );
            $total = ($total + $subtotal);
            
        }
        $orders = Order::orderBy('id','DESC')->first();

        $pfxCertPrivado = $_SERVER['DOCUMENT_ROOT']."/public/certificate/CREDITOR.pfx";     /* Server */
        // $pfxCertPrivado = public_path("certificate/CREDITOR.pfx");     /* localhost */
        $cert_password  = env('NCHL_CERTIFICATE_PASSWORD');
        if (!is_file($pfxCertPrivado)) {
            dd("Certificate not found !!" . $pfxCertPrivado);
            
        }
        $pfxContent = file_get_contents($pfxCertPrivado);
        if (!openssl_pkcs12_read($pfxContent, $x509certdata, $cert_password)) {
            dd("The certificate cannot be read !!");
        } 
        else {
            $CertPriv   = array();
            $CertPriv   = openssl_x509_parse(openssl_x509_read($x509certdata['cert']));
            $PrivateKey = $x509certdata['pkey'];
            $pub_key = openssl_pkey_get_public($x509certdata['cert']);
            $keyData = openssl_pkey_get_details($pub_key);
            $PublicKey  = $keyData['key'];
            //for connectips
            $merchatid = env('NCHL_MERCHANT_ID');
            $appid = env('NCHL_APP_ID');
            $appname = env('NCHL_APP_NAME');
            $txnid = date('Ymd-His');
            $txndate = date('d-m-Y');
            $txncrncy = "NPR";
            $txnamt = $total * 100; //in pasia
            $referenceid = "Refernced_".$txnid;
            $remarks = "Payment by Connect IPS - ".env('APP_NAME');
            $particular = $product_name;
            $token = "TOKEN";
            // dd($txnid);
            $string = "MERCHANTID=$merchatid,APPID=$appid,APPNAME=$appname,TXNID=$txnid,TXNDATE=$txndate,TXNCRNCY=$txncrncy,TXNAMT=$txnamt,REFERENCEID=$referenceid,REMARKS=$remarks,PARTICULARS=$particular,TOKEN=$token";
            if(openssl_sign($string, $signature , $PrivateKey , 'sha256WithRSAEncryption')) {
                $hash =  base64_encode($signature);
                // openssl_free_key($PrivateKey);
            }
            $data = array(
                "MERCHANTID" => $merchatid,
                "APPID" => $appid,
                "APPNAME" => $appname,
                "TXNID" => $txnid,
                "TXNDATE" => $txndate,
                "TXNCRNCY" => $txncrncy,
                "TXNAMT" => $txnamt,
                "REFERENCEID" => $referenceid,
                "REMARKS" => $remarks,
                "PARTICULARS" => $particular,
                "TOKEN" => $hash
            );
        }
        /* 
            * End ConnectIps API Payment
        */
        
        return view("connectips.confirm", compact('data'));
    }
    public function nibl_payment_success(Request $request) {
        $request->payment_option = "NIBL Payment";
        
        $orderController = new OrderController;
        // dd($request->session()->get('order_id'));
        $orderController->store($request);
        
        if($request->session()->get('order_id') != null) {
            if ($request->payment_option == 'NIBL Payment') {
                $request->session()->put('cart', collect([]));
                // $request->session()->forget('order_id');
                $request->session()->forget('delivery_info');
                $request->session()->forget('coupon_id');
                $request->session()->forget('coupon_discount');

                flash(translate("Your order has been placed successfully"))->success();
                $order = Order::findOrFail(Session::get('order_id'));
                return view('frontend.order_confirmed', compact('order'));
            // 	return redirect()->route('order_confirmed'); 
            }
        }
        return view('nibl_payment.payment.success');
    }
    //connect Ips Payment
    public function connect_ips_payment_success_fail(Request $request) {
        $carts = Session::get('cart');
        $product_name = null;
        $total = 0;
        foreach($carts as $cart_item) {
            $product_code = \App\Product::find($cart_item['id']);
            $product_name .=  $product_code['name'];
            $subtotal = ($product_code['purchase_price'] * $cart_item['quantity'] );
            $total = ($total + $subtotal);
        }
        $orders = Order::orderBy('id','DESC')->first();
        $pfxCertPrivado = $_SERVER['DOCUMENT_ROOT']."/public/certificate/CREDITOR.pfx";     /* Server */
            // $pfxCertPrivado = public_path("certificate/CREDITOR.pfx");     /* localhost */
        $cert_password  = env('NCHL_CERTIFICATE_PASSWORD');;
        if (!is_file($pfxCertPrivado)) {
            echo "Certificate not found !!" . $pfxCertPrivado;
        }
        $pfxContent = file_get_contents($pfxCertPrivado);
        if (!openssl_pkcs12_read($pfxContent, $x509certdata, $cert_password)) {
            echo "The certificate cannot be read !!";
        } 
        else {
            $CertPriv   = array();
            $CertPriv   = openssl_x509_parse(openssl_x509_read($x509certdata['cert']));
            $PrivateKey = $x509certdata['pkey'];
            $pub_key = openssl_pkey_get_public($x509certdata['cert']);
            $keyData = openssl_pkey_get_details($pub_key);
            $PublicKey  = $keyData['key'];
            
            //for connectips
            $merchatid = env('NCHL_MERCHANT_ID');
            $appid = env('NCHL_APP_ID');
            $txnid = date('Ymd-His');
            $txnamt = (int)$total * 100; //in pasia
            $referenceid = $txnid;
            $token = "TOKEN";
            $string = "MERCHANTID=$merchatid,APPID=$appid,REFERENCEID=$referenceid,TXNAMT=$txnamt";
            if(openssl_sign($string, $signature , $PrivateKey , 'sha256WithRSAEncryption')) {
                $hash =  base64_encode($signature);
                // openssl_free_key($PrivateKey);
            }
  
            $url = env('NCHL_VALIDATION_URL');
            $curl = curl_init($url);
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

            $headers = array(
            "Accept: application/json",
            "Authorization: Basic TUVSLTQ1MS1BUFAtMTpBYmNkQDEyMw==",
            "Content-Type: application/json",
            );
            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            $data = array(
                'merchantId' => "$merchatid",
                'appId' => "$appid",
                'referenceId' => $referenceid,
                'txnAmt' => $txnamt,
                'token' => "$hash" 
            );
            $payload = json_encode($data);
            // curl_setopt($curl, CURLOPT_POSTFIELDS,'{
            //     "merchantId": $merchatid,
            //     "appId": "MER-451-APP-1",
            //     "referenceId": 14,
            //     "txnAmt": 7500,
            //     "token": "aJ5/lUGrq4AqnfspO7udhB6jOQRD/PosRxEYOEQt/ydU+Udl/GAqrphnm8nwxsnE6s8aD7n6GZFVCoLf1QMmKt1JfReI/D0Qrk9wkgdy0ZE1B/63EjjLEF+3MGxMiOUKubecTLsBgMfi+lOtv0rnF+3OYdGJyEcJth7u/JdvnhA="
            // }');
            curl_setopt($curl, CURLOPT_POSTFIELDS, $payload);
            
            //for debug only!
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
            $resp = curl_exec($curl);
            
            if (curl_errno($curl)) { 
               dd(curl_error($curl)); 
            } 

            $resp = json_decode($resp);
            curl_close($curl);
            
            foreach($resp as $key => $value) {
                
                if ($key == "status" && $value == "SUCCESS") {
                    $request->payment_option = "ConnectIps";
                    $orderController = new OrderController;
                    $orderController->store($request);
                    if($request->session()->get('order_id') != null) {
                        if ($request->payment_option == 'ConnectIps') {
                        //   dd("asas");
                            $request->session()->put('cart', collect([]));
                            // $request->session()->forget('order_id');
                            $request->session()->forget('delivery_info');
                            $request->session()->forget('coupon_id');
                            $request->session()->forget('coupon_discount');
        
                            flash(translate("Your order has been placed successfully"))->success();
                            $order = Order::findOrFail(Session::get('order_id'));
                            return view('frontend.order_confirmed', compact('order'));
                        // 	return redirect()->route('order_confirmed'); 
                        }
                    }
                    flash(translate('Payment has been success'))->success();
                }
                else if($key == "status" && $value == "FAILED") {
                    
        // if(Session::has('cart') && count(Session::get('cart')) > 0){
        //     $categories = Category::all();
        // }
        flash(translate('Payment has been failed'))->warning();
                    return view('frontend.shipping_info', compact('categories'));

                    
                }
            }
        }
        return view('connectips.success', compact('resp'));
    }
   
}

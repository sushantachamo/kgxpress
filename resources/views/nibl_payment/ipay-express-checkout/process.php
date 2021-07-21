
<?php
	session_start();
	// include_once("../config.php");
	include_once("ipayExpAPI.php");
	// echo '<pre>' . print_r($_POST, TRUE) . '</pre>';

if($_POST) //Post Data received from product list page.
{
    $ItemTotalPrice = 0;
    foreach($_POST['item_name'] as $key=>$itmname)
    {
		
        $product_code 	= filter_var($_POST['item_code'][$key], FILTER_SANITIZE_STRING); 
		$results = \App\Product::find($product_code);
		
	
		// $results = $mysqli->query("SELECT product_name, product_desc, price FROM products WHERE product_code='$product_code' LIMIT 1");
		
		// $obj = $results->fetch_object();
		// item price X quantity
        // $subtotal = ($obj->price*$_POST['item_qty'][$key]);
		$subtotal = ($_POST['item_qty'][$key] * $results['purchase_price']);
		
        //total price
        // $ItemTotalPrice = $ItemTotalPrice + $subtotal;
        $ItemTotalPrice = $ItemTotalPrice + $subtotal;
		
		//create items for session
		$ipay_product['items'][] = array('itm_name'=>$results['name'],
											'itm_price'=>$results['purchase_price'],
											'itm_code'=>$_POST['item_code'][$key], 
											'itm_qty'=>$_POST['item_qty'][$key]
											);	
		
    }
	$GrandTotal = ($ItemTotalPrice );
	
	// die;  
	
	// Set up your API credentials & ipay end point
	$iPay_URL = 'https://ecom.nibl.com.np:30090/ipg/servlet_exppay';  // ipay end point
	// $iPay_URL = 'http://10.4.2.76:18090/ipg/servlet_exppay';  // ipay end point
	//$iPay_URL = 'http://192.168.1.4:22080/ipg_Takatack/servlet_exppay';  // ipay end point
	// $current_url = base64_encode($url="http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
	$stringurl = Route('checkout.nibl.payment.confirm');
	// $url="http://".$_SERVER['HTTP_HOST']."/nibl_payment/ipay-express-checkout/confirm.php";
	// echo asset("/ipay-express-checkout/confirm.php");
	// die;
	
	$sAction = 'SaleTxn';                    
	$_SESSION["ipay_in__action"] = $sAction;                 // Create invoice for sale transaction 'SaleTxn' or 'saleTxnGroup' / AddWallet / AddCard / SaleWalletTxn / ListCards /
	$_SESSION["ipay_in__cur"] = 'NPR';                       // currency
	$_SESSION["ipay_in__lang"] = 'eng';                      // language
	$_SESSION["ipay_in__ret_url"] = $stringurl; //Return URL for the confirmation page
	$_SESSION["ipay_in__mer_var1"] = '';                     
	$_SESSION["ipay_in__mer_var2"] = '';
	$_SESSION["ipay_in__mer_var3"] = '';
	$_SESSION["ipay_in__mer_var4"] = '';
	$_SESSION["ipay_in__item_list"] = '';//'seller001                item001                                              1.50        product 1                                                                                           1         |seller002                item002                                              2.85        product 2                                                                                           1         |';
	$mer_txn_id = rand(1000, 9999999);	
	$_SESSION["ipay_in__mer_ref_id"] = $mer_txn_id.'';          // merchant reference id
	$_SESSION["ipay_products"] = $ipay_product;              //create session array for later use
	$_SESSION["ipay_in__txn_amt"] =$GrandTotal;              //Grand total including all tax, insurance, shipping cost and discount
	
	/**
	* Create invoice for sale transaction
	*/
	$ipay= new MyIpay();
	
	if($sAction == 'SaleTxn') {
		$httpParsedResponseAr = $ipay->saleTxn();          // We need to execute the method to obtain uudi token
	}
	else if($sAction == "saleTxnGroup") 
		$httpParsedResponseAr = $ipay->saleTxnGroup();     // We need to execute the method to obtain uudi token
	// foreach($httpParsedResponseAr as $item)
	// {
	// 	echo $item. "\n";
	// }
	// die;
	// print_r('httpParsedResponseAr>>'.$httpParsedResponseAr);
	// print_r('ipay_out__txn_uuid>>'.$httpParsedResponseAr['ipay_out__txn_uuid']);
	// die;

	if(0 < sizeof((array)$httpParsedResponseAr['ipay_out__txn_uuid']))
	{
		//$ipayurl = $iPay_URL.'?TXN_UUID='.$httpParsedResponseAr['ipay_out__txn_uuid'].'';
		//header('Location: '.$ipayurl);
		
	?>
			<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<script type="text/javascript">
					function closethisasap() {
						document.forms["redirectpost"].submit();
					}
				</script>
			</head>
			<body onload="closethisasap();">
			<form name="redirectpost" method="post" action="<?php echo $iPay_URL; ?>">
				<?php
				 echo '<input type="hidden" name="TXN_UUID" value="' . $httpParsedResponseAr['ipay_out__txn_uuid'] . '"> ';
				?>
			</form>
			</body>
			</html>
    <?php
    exit;
		
	}
	else
	{
		//*********IF ERROR***************	
		echo '<div style="color:red"><b>Error : </b></div>';
		echo '<pre>';
		print_r($httpParsedResponseAr);
		echo '</pre>';
		//*********IF ERROR***************	
	}
	
}
else {
	echo "process end";
}

?>


<?php
    session_start();
    // include_once("config.php");
?>

@extends('frontend.layouts.app')

@section('content')

    <div id="page-content">
        <section class="slice-xs sct-color-2 border-bottom">
            <div class="container container-sm">
                <div class="row cols-delimited justify-content-center">
                    <div class="col">
                        <div class="icon-block icon-block--style-1-v5 text-center ">
                            <div class="block-icon c-gray-light mb-0">
                                <i class="la la-shopping-cart"></i>
                            </div>
                            <div class="block-content d-none d-md-block">
                                <h3 class="heading heading-sm strong-300 c-gray-light text-capitalize">{{ translate('1. My Cart')}}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="icon-block icon-block--style-1-v5 text-center ">
                            <div class="block-icon mb-0 c-gray-light">
                                <i class="la la-map-o"></i>
                            </div>
                            <div class="block-content d-none d-md-block">
                                <h3 class="heading heading-sm strong-300 c-gray-light text-capitalize">{{ translate('2. Shipping info')}}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="icon-block icon-block--style-1-v5 text-center ">
                            <div class="block-icon mb-0 c-gray-light">
                                <i class="la la-truck"></i>
                            </div>
                            <div class="block-content d-none d-md-block">
                                <h3 class="heading heading-sm strong-300 c-gray-light text-capitalize">{{ translate('3. Delivery info')}}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="icon-block icon-block--style-1-v5 text-center active">
                            <div class="block-icon mb-0">
                                <i class="la la-credit-card"></i>
                            </div>
                            <div class="block-content d-none d-md-block">
                                <h3 class="heading heading-sm strong-300 c-gray-light text-capitalize">{{ translate('4. Payment')}}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="icon-block icon-block--style-1-v5 text-center">
                            <div class="block-icon c-gray-light mb-0">
                                <i class="la la-check-circle"></i>
                            </div>
                            <div class="block-content d-none d-md-block">
                                <h3 class="heading heading-sm strong-300 c-gray-light text-capitalize">{{ translate('5. Confirmation')}}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-3 gry-bg">
            <div class="container">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-title px-4 py-3">
                                <h3 class="heading heading-5 strong-500">
                                    {{ translate('NIBL Payment Confirmation')}}
                                </h3>
                            </div>
                            <div class="card-body text-center">
                                @if($carts != NULL)
                                    <?php 
                                        // $current_url = base64_encode($url="http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
                                        $total = 0;
                                    ?>
                                    <form method="post" action="{{route('checkout.nibl.payment.process')}}">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-lg d-flex align-items-center justify-content-center">
                                                        <?php $cart_items = 0; ?>
                                                        @foreach ($carts as $cart_item)
                                                            <?php $product_code = \App\Product::find($cart_item['id']); ?>
                                                            
                                                            <?php
                                                                $subtotal = ($product_code['purchase_price'] * $cart_item['quantity'] );
                                                                $total = ($total + $subtotal);
                                                            ?>
                                                            <input type="hidden" name="item_name[{{$cart_items}}]" value="{{$product_code['name']}}" />
                                                            <input type="hidden" name="item_code[{{$cart_items}}]" value="{{$product_code['id']}}" />
                                                            <input type="hidden" name="item_desc[{{$cart_items}}]" value="{{$product_code['description']}}" />
                                                            <input type="hidden" name="item_qty[{{$cart_items}}]" value="{{$cart_item['quantity']}}" />
                                                            <?php $cart_items ++ ?>
                                                        @endforeach
                                                        <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/NIBL.jpg')}}" class="img-fluid"  style="height:150px;width:250px">  
                                                    </div>
                                                    <div class="col-lg d-flex align-items-center justify-content-center">
                                                        <input type="submit" class="btn btn-styled btn-base-1" value="Confirm Payment"/> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                @endif
                                    
                                </div>
                            </div>
                    </div>

                    <div class="col-lg-4 ml-lg-auto">
                        @include('frontend.partials.cart_summary')    
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@section('script')
    <script type="text/javascript">

        $(document).ready(function(){
          $(".online_payment").click(function(){
            $('#manual_payment_description').parent().addClass('d-none');
          });
        });

        function use_wallet(){
            $('input[name=payment_option]').val('wallet');
            if($('#agree_checkbox').is(":checked")){
                $('#checkout-form').submit();
            }else{
                showFrontendAlert('error','{{ translate('You need to agree with our policies') }}');
            }
        }
        function submitOrder(el){
            $(el).prop('disabled', true);
            if($('#agree_checkbox').is(":checked")){
                $('#checkout-form').submit();
            }else{
                showFrontendAlert('error','{{ translate('You need to agree with our policies') }}');
                $(el).prop('disabled', false);
            }
        }

        function toggleManualPaymentData(id){
            $('#manual_payment_description').parent().removeClass('d-none');
            $('#manual_payment_description').html($('#manual_payment_info_'+id).html());
        }
    </script>
@endsection
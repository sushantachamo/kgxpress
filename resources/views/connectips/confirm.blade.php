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
                                   {{ translate('ConnectIps Payment Confirmation')}} 
                                </h3>
                            </div>
                            <div class="card-body text-center">
                                <form action="https://uat.connectips.com:7443/connectipswebgw/loginpage" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-lg d-flex align-items-center justify-content-center">
                                                    <input type="hidden" name="MERCHANTID" id="MERCHANTID" value="{{$data['MERCHANTID']}}"/>
                                                    <input type="hidden" name="APPID" id="APPID" value="{{$data['APPID']}}"/>
                                                    <input type="hidden" name="APPNAME" id="APPNAME" value="{{$data['APPNAME']}}"/>
                                                    <input type="hidden" name="TXNID" id="TXNID" value="{{$data['TXNID']}}"/>  
                                                    <input type="hidden" name="TXNDATE" id="TXNDATE" value="{{$data['TXNDATE']}}"/>
                                                    <input type="hidden" name="TXNCRNCY" id="TXNCRNCY" value="{{$data['TXNCRNCY']}}"/>
                                                    <input type="hidden" name="TXNAMT" id="TXNAMT" value="{{$data['TXNAMT']}}"/>
                                                    <input type="hidden" name="REFERENCEID" id="REFERENCEID" value="{{$data['REFERENCEID']}}"/>
                                                    <input type="hidden" name="REMARKS" id="REMARKS" value="{{$data['REMARKS']}}"/>
                                                    <input type="hidden" name="PARTICULARS" id="PARTICULARS" value="{{$data['PARTICULARS']}}"/>
                                                    <input type="hidden" name="TOKEN" id="TOKEN" value="{{$data['TOKEN']}}"/>
                                                    <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/connectips.png')}}" class="img-fluid">                                                
                                                </div>
                                                <div class="col-lg d-flex align-items-center justify-content-center">
                                                    <input type="submit" class="btn btn-styled btn-base-1" value="Pay by ConnectIps">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
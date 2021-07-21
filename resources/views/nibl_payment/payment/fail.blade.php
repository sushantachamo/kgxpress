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
                        
                        <form action="" class="form-default" data-toggle="validator" role="form" method="POST" id="checkout-form">                            @csrf
                            <div class="card">
                                <div class="card-title px-4 py-3">
                                    <h3 class="heading heading-5 strong-500">
                                        {{ translate('Payment Failed')}} 
                                    </h3>
                                </div>
                                <div class="card-body text-center">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-lg text-left font-weight-normal text-capitalize">
                                                    <h4>
                                                        txn_status :
                                                        <small class="text-muted">Failed</small>
                                                    </h4>
                                                </div>
                                                <div class="col-lg d-flex justify-content-center">
                                                    <div class="block-icon c-gray-light mb-0">
                                                        <i class="la la-close" style="color:#e62e04;font-size:7em"></i>  
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    {{-- <div class="card mb-3 bg-gray text-left p-3 d-none">
                                        <div id="manual_payment_description">

                                        </div>
                                    </div> --}}
                                    
                                </div>
                            </div>
                            {{-- @foreach ($resp as $key => $value)
                                @if ($key == "status" && $value == "SUCCESS")
                                    <div class="pt-3">
                                        <input id="agree_checkbox" type="checkbox" required>
                                        <label for="agree_checkbox">{{ translate('I agree to the')}}</label>
                                        <a href="{{ route('terms') }}">{{ translate('terms and conditions')}}</a>,
                                        <a href="{{ route('returnpolicy') }}">{{ translate('return policy')}}</a> &
                                        <a href="{{ route('privacypolicy') }}">{{ translate('privacy policy')}}</a>
                                    </div>
                                @endif
                            @endforeach --}}
                            

                            <div class="row align-items-center pt-3">
                                <div class="col-6">
                                    <a href="{{ route('home') }}" class="link link--style-3">
                                        <i class="ion-android-arrow-back"></i>
                                        {{ translate('Return to shop')}}
                                    </a>
                                </div>
                                {{-- @foreach ($resp as $key => $value)
                                    @if ($key == "status" && $value == "SUCCESS")
                                        <div class="col-6 text-right">
                                            <input type="hidden" id="" name="payment_option" value="ConnectIps" class="online_payment" checked>
                                            <button type="button" onclick="submitOrder(this)" class="btn btn-styled btn-base-1">{{ translate('Complete Order')}}</button>
                                        </div>
                                    @endif
                                @endforeach --}}
                                
                            </div>
                        </form>
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
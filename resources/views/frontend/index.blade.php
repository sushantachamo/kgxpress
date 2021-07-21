@extends('frontend.layouts.app')

@section('content')

    <section class="home-banner-area mb-4">
        <div class="container-fluid">
            <div class="row no-gutters position-relative">
                @php
                    $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1 ))->get());
                    $num_feature_products = count(filter_products(\App\Product::where('published', 1)->where('featured', 1 ))->get());
                    $featured_categories = \App\Category::where('featured', 1)->get();
                @endphp
                <div class="@if($num_todays_deal > 0) col-lg-12 @else col-lg-12 @endif order-1 order-lg-0 @if(count($featured_categories) == 0) home-slider-full @endif">
                    <div class="home-slide">
                        <div class="home-slide">
                            <div class="slick-carousel" data-slick-arrows="true" data-slick-dots="false" data-slick-autoplay="true">
                                @foreach (\App\Slider::where('published', 1)->get() as $key => $slider)
                                    <div class="home-slide-item" style="height:100vh !important;">
                                        <a href="{{ $slider->link }}" target="_blank">
                                        <img class="d-block w-100 h-100 lazyload" src="{{ asset('frontend/images/placeholder-rect.jpg') }}" data-src="{{ asset($slider->photo) }}" alt="{{ env('APP_NAME')}} promo">
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <div class="banner-content-wrapper">
                        
                            <div class="container">
                                <div class="row">
                                    @if($num_todays_deal > 0)
                                    <div class="col-lg-6 d-none d-lg-block">
                                        <div class="flash-deal-box todays-deal-box bg-white h-100">
                                            <div class="title text-center p-2">
                                                <h3 class="heading-6 mb-0">
                                                    <span>{{ translate('Todays Deal') }}</span>
                                                </h3>
                                            </div>
                                            <div class="c-scrollbar c-height">
                                                @foreach (filter_products(\App\Product::where('published', 1)->where('todays_deal', '1'))->get() as $key => $product)
                                                    @if ($product != null)
                                                        <a href="{{ route('product', $product->slug) }}" class="d-block flash-deal-item">
                                                            <div class="row no-gutters align-items-center" >
                                                                <div class="img">
                                                                    <img class="lazyload img-fit" src="{{ my_asset('frontend/images/placeholder.jpg') }}" data-src="{{ my_asset($product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                                                </div>
                                                                <div class="price">
                                                                    <span class="d-block">{{ home_discounted_base_price($product->id) }}</span>
                                                                        @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                                            <del class="d-block">{{ home_base_price($product->id) }}</del>
                                                                        @endif
                                                                </div>
                                                            </div>
                                                        </a>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    @endif
                                    @if($num_feature_products > 0)
                                    <div class="col-lg-6 d-none d-lg-block">
                                        <div class="flash-deal-box todays-deal-box bg-white h-100">
                                            <div class="title text-center p-2">
                                                <h3 class="heading-6 mb-0">
                                                    <span>{{ translate('Featured Products') }}</span>
                                                     <!--<span class="badge badge-danger">{{ translate('Hot') }}</span> -->
                                                </h3>
                                            </div>
                                            <div class="c-scrollbar c-height">
                                                @foreach (filter_products(\App\Product::where('published', 1)->where('featured', '1'))->limit(6)->get() as $key => $product)
                                                    @if ($product != null)
                                                        <a href="{{ route('product', $product->slug) }}" class="d-block flash-deal-item">
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="img">
                                                                    <img class="lazyload img-fit" src="{{ my_asset('frontend/images/placeholder.jpg') }}" data-src="{{ my_asset($product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                                                </div>
                                                                <div class="price">
                                                                    <span class="d-block">{{ home_discounted_base_price($product->id) }}</span>
                                                                        @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                                            <del class="d-block">{{ home_base_price($product->id) }}</del>
                                                                        @endif
                                                                </div>
                                                            </div>
                                                        </a>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    @endif
                                </div>
                            </div>
                    </div>
                    <!-- banner content wrapper -->
                </div>
            </div>
        </div>
    </section>
    <!---->
    @foreach(\App\Category::all() as $key => $category)
    <?php 
        $products = \App\Product::where("category_id",$category->id)->get();
    ?>
    @if(count($products)!=0)
    <section class="mb-4">
        <div class="container">
            <div class="px-2 py-4 p-md-4 bg-white shadow-sm">
                <div class="section-title-1 clearfix">
                    <h3 class="heading-5 strong-700 mb-0 float-left">
                        <span class="mr-4">{{translate($category->name)}}</span>
                    </h3>

                </div>
                <div class="caorusel-box arrow-round gutters-5">
                    <div class="slick-carousel" data-slick-items="3" data-slick-lg-items="2"  data-slick-md-items="2" data-slick-sm-items="1" data-slick-xs-items="1" data-slick-rows="2">
                        <?php $count = 0 ?>
                        @foreach (\App\Product::all() as $product)
                            @if($category->id == $product->category_id)
                            <div class="caorusel-card my-1">
                                <div class="row no-gutters product-box-2 align-items-center">
                                    <div class="col-4">
                                        <div class="position-relative overflow-hidden h-100">
                                            <a href="{{ route('product', $product->slug) }}" class="d-block product-image h-100">
                                                <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                            </a>
                                            <div class="product-btns">
                                                <button class="btn add-wishlist" title="Add to Wishlist" onclick="addToWishList({{ $product->id }})">
                                                    <i class="la la-heart-o"></i>
                                                </button>
                                                <button class="btn add-compare" title="Add to Compare" onclick="addToCompare({{ $product->id }})">
                                                    <i class="la la-refresh"></i>
                                                </button>
                                                <button class="btn quick-view" title="Quick view" onclick="showAddToCartModal({{ $product->id }})">
                                                    <i class="la la-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8 border-left">
                                        <div class="p-3">
                                            <h2 class="product-title mb-0 p-0 text-truncate-2">
                                                <a href="{{ route('product', $product->slug) }}">{{ __($product->name) }}</a>
                                            </h2>
                                            <div class="star-rating star-rating-sm mb-2">
                                                {{ renderStarRating($product->rating) }}
                                            </div>
                                            <div class="clearfix">
                                                <div class="price-box float-left">
                                                    @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                        <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                                                    @endif
                                                    <span class="product-price strong-600">
                                                        {{ home_discounted_base_price($product->id) }}
                                                    </span>
                                                </div>
                                                <div class="float-right">
                                                    <button class="add-to-cart btn" title="Add to Cart" onclick="showAddToCartModal({{ $product->id }})">
                                                        <i class="la la-shopping-cart"></i>
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php $count++ ?>
                        @endif
                        <?php
                            if($count==6) {
                                $count=0;
                                break;
                            }
                        ?>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endif
    @endforeach
    
    
    
    
    
    
    
    
    <div id="section_featured">

    </div>

    <div id="section_best_selling">

    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title-1 clearfix">
                    <h3 class="heading-5 strong-700 mb-0 float-left">
                        <span class="mr-4">{{translate('Top 10 Brands')}}</span>
                    </h3>
                    <ul class="float-right inline-links">
                        <li>
                            <a href="{{ route('brands.all') }}" class="active">{{translate('View All Brands')}}</a>
                        </li>
                    </ul>
                </div>
                <div class="row gutters-5 brand-section">
                    @foreach (\App\Brand::where('top', 1)->get() as $brand)
                        <div class="mb-3 col-3">
                            <a href="{{ route('products.brand', $brand->slug) }}" class="brand-logo bg-white border d-block c-base-2 box-2 icon-anim pl-2">
                                <div class="row align-items-center no-gutters">
                                    <div class="col-12 text-center">
                                        <img src="{{asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($brand->logo) }}" alt="{{ __($brand->name) }}" class="img-fluid img lazyload">
                                    </div>
                                </div>
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div><!-- container -->
    </div><!-- row -->

    @if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1)
        @php
            $customer_products = \App\CustomerProduct::where('status', '1')->where('published', '1')->take(10)->get();
        @endphp
       @if (count($customer_products) > 0)
           <section class="mb-4">
               <div class="container">
                   <div class="px-2 py-4 p-md-4 bg-white shadow-sm">
                       <div class="section-title-1 clearfix">
                           <h3 class="heading-5 strong-700 mb-0 float-left">
                               <span class="mr-4">{{ translate('Classified Ads') }}</span>
                           </h3>
                           <ul class="inline-links float-right">
                               <li><a href="{{ route('customer.products') }}" class="active">{{ translate('View More') }}</a></li>
                           </ul>
                       </div>
                       <div class="caorusel-box arrow-round">
                           <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="5" data-slick-lg-items="4"  data-slick-md-items="3" data-slick-sm-items="2" data-slick-xs-items="2">
                               @foreach ($customer_products as $key => $customer_product)
                                   <div class="product-card-2 card card-product my-2 mx-1 mx-sm-2 shop-cards shop-tech">
                                       <div class="card-body p-0">
                                           <div class="card-image">
                                               <a href="{{ route('customer.product', $customer_product->slug) }}" class="d-block">
                                                   <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($customer_product->thumbnail_img) }}" alt="{{ __($customer_product->name) }}">
                                               </a>
                                           </div>

                                           <div class="p-sm-3 p-2">
                                               <div class="price-box">
                                                   <span class="product-price strong-600">{{ single_price($customer_product->unit_price) }}</span>
                                               </div>
                                               <h2 class="product-title p-0 text-truncate-1">
                                                   <a href="{{ route('customer.product', $customer_product->slug) }}">{{ __($customer_product->name) }}</a>
                                               </h2>
                                               <div>
                                                   @if($customer_product->conditon == 'new')
                                                       <span class="product-label label-hot">{{translate('new')}}</span>
                                                   @elseif($customer_product->conditon == 'used')
                                                       <span class="product-label label-hot">{{translate('Used')}}</span>
                                                   @endif
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               @endforeach
                           </div>
                       </div>
                   </div>
               </div>
           </section>
       @endif
   @endif

    <!--<div class="mb-4">-->
    <!--    <div class="container">-->
    <!--        <div class="row gutters-10">-->
    <!--            @foreach (\App\Banner::where('position', 2)->where('published', 1)->get() as $key => $banner)-->
    <!--                <div class="col-lg-{{ 12/count(\App\Banner::where('position', 2)->where('published', 1)->get()) }}">-->
    <!--                    <div class="media-banner mb-3 mb-lg-0">-->
    <!--                        <a href="{{ $banner->url }}" target="_blank" class="banner-container">-->
    <!--                            <img src="{{ asset('frontend/images/placeholder-rect.jpg') }}" data-src="{{ asset($banner->photo) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">-->
    <!--                        </a>-->
    <!--                    </div>-->
    <!--                </div>-->
    <!--            @endforeach-->
    <!--        </div>-->
    <!--    </div>-->
    <!--</div>-->

    <!--@if (\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)-->
    <!--<div id="section_best_sellers">-->

    <!--</div>-->
    <!--@endif-->

  <!--   @if(count(\App\Category::where('top', 1)->get()) != null && count(\App\Brand::where('top', 1)->get()) != null)
    <section class="mb-3">
        <div class="container">
            <div class="row gutters-10">
                <div class="col-lg-6">
                    <div class="section-title-1 clearfix">
                        <h3 class="heading-5 strong-700 mb-0 float-left">
                            <span class="mr-4">{{translate('Top 10 Catogories')}}</span>
                        </h3>
                        <ul class="float-right inline-links">
                            <li>
                                <a href="{{ route('categories.all') }}" class="active">{{translate('View All Catogories')}}</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row gutters-5">
                        @foreach (\App\Category::where('top', 1)->get() as $category)
                            <div class="mb-3 col-6">
                                <a href="{{ route('products.category', $category->slug) }}" class="bg-white border d-block c-base-2 box-2 icon-anim pl-2">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col-3 text-center">
                                            <img src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($category->banner) }}" alt="{{ __($category->name) }}" class="img-fluid img lazyload">
                                        </div>
                                        <div class="info col-7">
                                            <div class="name text-truncate pl-3 py-4">{{ __($category->name) }}</div>
                                        </div>
                                        <div class="col-2 text-center">
                                            <i class="la la-angle-right c-base-1"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="section-title-1 clearfix">
                        <h3 class="heading-5 strong-700 mb-0 float-left">
                            <span class="mr-4">{{translate('Top 10 Brands')}}</span>
                        </h3>
                        <ul class="float-right inline-links">
                            <li>
                                <a href="{{ route('brands.all') }}" class="active">{{translate('View All Brands')}}</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row gutters-5">
                        @foreach (\App\Brand::where('top', 1)->get() as $brand)
                            <div class="mb-3 col-6">
                                <a href="{{ route('products.brand', $brand->slug) }}" class="bg-white border d-block c-base-2 box-2 icon-anim pl-2">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col-3 text-center">
                                            <img src="{{asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($brand->logo) }}" alt="{{ __($brand->name) }}" class="img-fluid img lazyload">
                                        </div>
                                        <div class="info col-7">
                                            <div class="name text-truncate pl-3 py-4">{{ __($brand->name) }}</div>
                                        </div>
                                        <div class="col-2 text-center">
                                            <i class="la la-angle-right c-base-1"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endif -->
@endsection

@section('script')
    <script>
        $(document).ready(function(){

            
            $.post('{{ route('home.section.featured') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_featured').html(data);
                slickInit();
            });

            $.post('{{ route('home.section.best_selling') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_selling').html(data);
                slickInit();
            });

            $.post('{{ route('home.section.home_categories') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_home_categories').html(data);
                slickInit();
            });

            @if (\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
            $.post('{{ route('home.section.best_sellers') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_sellers').html(data);
                slickInit();
            });
            @endif
        });
    </script>
    
@endsection

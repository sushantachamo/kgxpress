<div class="logo-bar-area">
    <div class="container">
        <div class="row no-gutters align-items-center">
            <div class="col-lg-2 col-8">
                <div class="d-flex">
                    <div class="d-block d-lg-none mobile-menu-icon-box">
                        <!-- Navbar toggler  -->
                        <a href="" onclick="sideMenuOpen(this)">
                            <div class="hamburger-icon">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                    </div>

                    <!-- Brand/Logo -->
                    <a class="navbar-brand" href="{{ route('home') }}">
                        @php
                            $generalsetting = \App\GeneralSetting::first();
                        @endphp
                        @if($generalsetting->logo != null)
                            <img src="{{ my_asset($generalsetting->logo) }}" alt="{{ env('APP_NAME') }}">
                        @else
                            <img src="{{ my_asset('frontend/images/logo/logo.png') }}" alt="{{ env('APP_NAME') }}">
                        @endif
                    </a>

                    @if(Route::currentRouteName() != 'home' && Route::currentRouteName() != 'categories.all')
                        <div class="d-none category-menu-icon-box">
                            <div class="dropdown-toggle navbar-light category-menu-icon" id="category-menu-icon">
                                <span class="navbar-toggler-icon"></span>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
            <div class="col-lg-10 col-4 position-static">
                <div class="d-flex w-100">
                    <div class="search-box flex-grow-1 px-4">
                        <form action="{{ route('search') }}" method="GET">
                            <div class="d-flex position-relative">
                                <div class="d-lg-none search-box-back">
                                    <button class="" type="button"><i class="la la-long-arrow-left"></i></button>
                                </div>
                                <div class="w-100">
                                    <input type="text" aria-label="Search" id="search" name="q" class="w-100" placeholder="{{translate('I am shopping for...')}}" autocomplete="off">
                                </div>
                                <div class="form-group category-select d-none d-xl-block">
                                    <select class="form-control selectpicker" name="category">
                                        <option value="">{{translate('All Categories')}}</option>
                                        @foreach (\App\Category::all() as $key => $category)
                                        <option value="{{ $category->slug }}"
                                            @isset($category_id)
                                                @if ($category_id == $category->id)
                                                    selected
                                                @endif
                                            @endisset
                                            >{{ __($category->name) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <button class="d-none d-lg-block" type="submit">
                                    <i class="la la-search la-flip-horizontal"></i>
                                </button>
                                <div class="typed-search-box d-none">
                                    <div class="search-preloader">
                                        <div class="loader"><div></div><div></div><div></div></div>
                                    </div>
                                    <div class="search-nothing d-none">

                                    </div>
                                    <div id="search-content">

                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>

                    <div class="logo-bar-icons d-inline-block ml-auto">
                        <div class="d-inline-block d-lg-none">
                            <div class="nav-search-box">
                                <a href="#" class="nav-box-link">
                                    <i class="la la-search la-flip-horizontal d-inline-block nav-box-icon"></i>
                                </a>
                            </div>
                        </div>
                        <div class="d-none d-lg-inline-block">
                            <ul class="inline-links">
                                
                                @auth
                                <li>
                                    <a href="{{ route('dashboard') }}" class="top-bar-item">{{ translate('My Panel')}}</a>
                                </li>
                                <li>
                                    <a href="{{ route('logout') }}" class="top-bar-item">{{ translate('Logout')}}</a>
                                </li>
                                @else
                                <li>
                                    <a href="{{ route('user.login') }}" class="top-bar-item">{{ translate('Login')}}</a>
                                </li>
                                <li>
                                    <a href="{{ route('user.registration') }}" class="top-bar-item">{{ translate('Registration')}}</a>
                                </li>
                                @endauth
                            </ul>
                        </div>
                        
                        <div class="d-inline-block" data-hover="dropdown">
                            <div class="nav-cart-box dropdown" id="cart_items">
                                <a href="" class="nav-box-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="la la-shopping-cart d-inline-block nav-box-icon"></i>
                                    <span class="nav-box-text d-none d-xl-inline-block">{{translate('Cart')}}</span>
                                    @if(Session::has('cart'))
                                        <span class="nav-box-number">{{ count(Session::get('cart'))}}</span>
                                    @else
                                        <span class="nav-box-number">0</span>
                                    @endif
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right px-0">
                                    <li>
                                        <div class="dropdown-cart px-0">
                                            @if(Session::has('cart'))
                                                @if(count($cart = Session::get('cart')) > 0)
                                                    <div class="dc-header">
                                                        <h3 class="heading heading-6 strong-700">{{translate('Cart Items')}}</h3>
                                                    </div>
                                                    <div class="dropdown-cart-items c-scrollbar">
                                                        @php
                                                            $total = 0;
                                                        @endphp
                                                        @foreach($cart as $key => $cartItem)
                                                            @php
                                                                $product = \App\Product::find($cartItem['id']);
                                                                $total = $total + $cartItem['price']*$cartItem['quantity'];
                                                            @endphp
                                                            <div class="dc-item">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="dc-image">
                                                                        <a href="{{ route('product', $product->slug) }}">
                                                                            <img src="{{ my_asset('frontend/images/placeholder.jpg') }}" data-src="{{ my_asset($product->thumbnail_img) }}" class="img-fluid lazyload" alt="{{ __($product->name) }}">
                                                                        </a>
                                                                    </div>
                                                                    <div class="dc-content">
                                                                        <span class="d-block dc-product-name text-capitalize strong-600 mb-1">
                                                                            <a href="{{ route('product', $product->slug) }}">
                                                                                {{ __($product->name) }}
                                                                            </a>
                                                                        </span>

                                                                        <span class="dc-quantity">x{{ $cartItem['quantity'] }}</span>
                                                                        <span class="dc-price">{{ single_price($cartItem['price']*$cartItem['quantity']) }}</span>
                                                                    </div>
                                                                    <div class="dc-actions">
                                                                        <button onclick="removeFromCart({{ $key }})">
                                                                            <i class="la la-close"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                    <div class="dc-item py-3">
                                                        <span class="subtotal-text">{{translate('Subtotal')}}</span>
                                                        <span class="subtotal-amount">{{ single_price($total) }}</span>
                                                    </div>
                                                    <div class="py-2 text-center dc-btn">
                                                        <ul class="inline-links inline-links--style-3">
                                                            <li class="px-1">
                                                                <a href="{{ route('cart') }}" class="link link--style-1 text-capitalize btn btn-base-1 px-3 py-1">
                                                                    <i class="la la-shopping-cart"></i> {{translate('View cart')}}
                                                                </a>
                                                            </li>
                                                            @if (Auth::check())
                                                            <li class="px-1">
                                                                <a href="{{ route('checkout.shipping_info') }}" class="link link--style-1 text-capitalize btn btn-base-1 px-3 py-1 light-text">
                                                                    <i class="la la-mail-forward"></i> {{translate('Checkout')}}
                                                                </a>
                                                            </li>
                                                            @endif
                                                        </ul>
                                                    </div>
                                                @else
                                                    <div class="dc-header">
                                                        <h3 class="heading heading-6 strong-700">{{translate('Your Cart is empty')}}</h3>
                                                    </div>
                                                @endif
                                            @else
                                                <div class="dc-header">
                                                    <h3 class="heading heading-6 strong-700">{{translate('Your Cart is empty')}}</h3>
                                                </div>
                                            @endif
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="hover-category-menu" id="hover-category-menu">
        <div class="container">
            <div class="row no-gutters position-relative">
                <div class="col-lg-3 position-static">
                    <div class="category-sidebar" id="category-sidebar">
                        <div class="all-category">
                            <span>{{translate('CATEGORIES')}}</span>
                            <a href="{{ route('categories.all') }}" class="d-inline-block">{{ translate('See All') }} ></a>
                        </div>
                        <ul class="categories">
                            
                            @foreach (\App\Category::all() as $key => $category)
                                    @php
                                        $brands = array();
                                    @endphp

                                    <li class="category-nav-element" data-id="{{ $category->id }}">
                                        <a href="{{ route('products.category', $category->slug) }}">
                                            <span class="cat-name">{{ __($category->name) }}</span>
                                        </a>
                                        @if(count($category->subcategories)>0)
                                            <div class="sub-cat-menu c-scrollbar">
                                                <div class="c-preloader">
                                                    <i class="fa fa-spin fa-spinner"></i>
                                                </div>
                                            </div>
                                        @endif
                                    </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="category-sidebar" style="width: calc(100% - 18px);">
                <div class="slick-carousel caorusel-box" data-slick-items="4" style="padding: 0 32px;">
        
                    @foreach (\App\Category::all() as $key => $category)
                        @php
                        $brands = array();
                        @endphp
                        <div class="category-nav-element" data-id="{{ $category->id }}" style="flex: 1 0 auto;">
                        <a href="{{ route('products.category', $category->slug) }}" class="text-truncate d-flex justify-content-center align-items-center flex-column">
                            <span class="cat-name mt-2">{{ __($category->name) }}</span>
                        </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div> 
</div>
<!-- Navbar -->


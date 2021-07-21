@foreach (\App\HomeCategory::where('status', 1)->get() as $key => $homeCategory)
  @if ($homeCategory->category != null)
    <section class="mb-4">
      <div class="container">
        <div class="px-2 py-4 p-md-4 bg-white shadow-sm">
          <div class="section-title-1 clearfix">
            <h3 class="heading-5 strong-700 mb-0 float-lg-left">
              <span class="mr-4">{{ translate($homeCategory->category->name) }}</span>
            </h3>
            <ul class="inline-links float-lg-right nav mt-3 mb-2 m-lg-0">
              <li><a href="{{ route('products.category', $homeCategory->category->slug) }}" class="active">View More</a>
              </li>
            </ul>
          </div>
          <div class="caorusel-box arrow-round gutters-5">
            <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="5" data-slick-lg-items="4" data-slick-md-items="3" data-slick-sm-items="2" data-slick-xs-items="2">
              @php
              $filteredProducts = filter_products(\App\Product::where('published', 1)->where('category_id', $homeCategory->category->id))->latest()->limit(12)->get();
              // $qty = 0;
              // if($product->variant_product){
              // foreach ($product->stocks as $key => $stock) {
              // $qty += $stock->qty;
              // }
              // }
              // else {
              // $qty = $product->current_stock;
              // }
              @endphp
              @foreach ($filteredProducts as $key => $product)
                <div class="caorusel-card">
                  <div class="product-box-2 bg-white alt-box my-2">

                    <div class="position-relative overflow-hidden">
                      <a href="{{ route('product', $product->slug) }}" class="d-block product-image h-100 text-center">
                        <img class="img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                      </a>
                      <div class="product-btns clearfix">
                        <button class="btn add-wishlist" title="Add to Wishlist" onclick="addToWishList({{ $product->id }})" tabindex="0">
                          <i class="la la-heart-o"></i>
                        </button>
                        <button class="btn add-compare" title="Add to Compare" onclick="addToCompare({{ $product->id }})" tabindex="0">
                          <i class="la la-refresh"></i>
                        </button>
                        <button class="btn quick-view" title="Quick view" onclick="showAddToCartModal({{ $product->id }})" tabindex="0">
                          <i class="la la-eye"></i>
                        </button>
                      </div>
                    </div>
                    <div class="p-md-3 p-2">

                      <div class="price-box">
                        @if (home_base_price($product->id) != home_discounted_base_price($product->id))
                          <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                        @endif
                        <span class="product-price strong-600">{{ home_discounted_base_price($product->id) }}</span>
                      </div>
                      <div class="star-rating star-rating-sm mt-1">
                        {{ renderStarRating($product->rating) }}
                      </div>
                      <h2 class="product-title p-0">
                        <a href="{{ route('product', $product->slug) }}" class=" text-truncate">{{ __($product->name) }}</a>
                      </h2>
                      @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                        <div class="club-point mt-2 bg-soft-base-1 border-light-base-1 border">
                          {{ translate('Club Point') }}:
                          <span class="strong-700 float-right">{{ $product->earn_point }}</span>
                        </div>
                      @endif
                      <form id="{{ 'carousel-cart-form-' . $product->id }}">
                        @csrf
                        <input type="hidden" name="id" value="{{ $product->id }}">
                        <div class="product-quantity d-flex align-items-center">
                          <div class="input-group input-group--style-2 pr-3" style="width: 100%;">
                            <span class="input-group-btn">
                              <button class="btn btn-number" type="button" data-type="minus" data-field="quantity{{ $product->id }}" disabled="disabled">
                                <i class="la la-minus"></i>
                              </button>
                            </span>
                            <input type="text" name="quantity{{ $product->id }}" class="form-control input-number h-auto text-center" placeholder="1" value="1" min="1" max="10">
                            <span class="input-group-btn">
                              <button class="btn btn-number" type="button" data-type="plus" data-field="quantity{{ $product->id }}">
                                <i class="la la-plus"></i>
                              </button>
                            </span>
                          </div>
                          @if ($product->digital == 1)
                            <button type="button" class="btn btn-styled btn-alt-base-1 c-white btn-icon-left strong-700 hov-bounce hov-shaddow ml-2 add-to-cart"
                              onclick="addToCartFromCard('{{ '#carousel-cart-form-' . $product->id }}', 'quantity{{ $product->id }}')">
                              <i class="la la-shopping-cart"></i>
                              <span class="d-none d-md-inline-block"> {{ translate('Add to cart') }}</span>
                            </button>
                          @elseif($product->current_stock > 0)
                            <button type="button" class="btn btn-styled btn-alt-base-1 c-white btn-icon-left strong-700 hov-bounce hov-shaddow ml-2 add-to-cart"
                              onclick="addToCartFromCard('{{ '#carousel-cart-form-' . $product->id }}', 'quantity{{ $product->id }}')">
                              <i class="la la-shopping-cart"></i>
                              <span class="d-none d-md-inline-block"> {{ translate('Add to cart') }}</span>
                            </button>
                          @else
                            <button type="button" class="btn btn-styled btn-base-3 btn-icon-left strong-700" disabled>
                              <i class="la la-cart-arrow-down"></i> {{ translate('Out of Stock') }}
                            </button>
                          @endif
                          {{-- <div class="avialable-amount">(
                            <span id="available-quantity">qty</span> Available
                          </div> --}}
                        </div>
                      </form>
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
@endforeach
<script type="text/javascript">
  cartQuantityInitialize();

</script>

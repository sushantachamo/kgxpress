@extends('frontend.layouts.app')

@section('content')

<div class="py-4 gry-bg">
    <div class="mt-4">
        <div class="container">
            <div class="bg-white px-3 pt-3">
                <div class="row gutters-10">
                    @foreach (\App\Brand::all() as $brand)
                        <div class="col-xxl-2 col-lg-4 col-sm-6 text-center">
                            <a href="{{ route('products.brand', $brand->slug) }}" class="d-block p-3 mb-3 border rounded">
                                @if (!empty($brand->logo))
                                    <img src="{{ asset($brand->logo) }}" class="lazyload img-fit" height="50" alt="{{  translate($brand->name) }}">
                                @else
                                    <img src="{{ asset("default.png") }}" class="lazyload img-fit" height="50" alt="{{  translate($brand->name) }}">
                                @endif
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

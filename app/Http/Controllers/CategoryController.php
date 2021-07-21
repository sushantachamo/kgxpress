<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\HomeCategory;
use App\Product;
use App\Language;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sort_search =null;
        $categories = Category::orderBy('name', 'asc');
        if ($request->has('search')){
            $sort_search = $request->search;
            $categories = $categories->where('name', 'like', '%'.$sort_search.'%');
        }
        $categories = $categories->paginate(20);
        return view('categories.index', compact('categories', 'sort_search'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('categories.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $category = new Category;
        $category->name = $request->name;
        $category->meta_title = $request->meta_title;
        $category->meta_description = $request->meta_description;
        if ($request->slug != null) {
            $category->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        }
        else {
            $category->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->name)).'-'.Str::random(5);
        }
        if ($request->commision_rate != null) {
            $category->commision_rate = $request->commision_rate;
        }

        $data = openJSONFile('en');
        $data[$category->name] = $category->name;
        saveJSONFile('en', $data);

        if($request->hasFile('banner')){
            $category->banner = $request->file('banner')->store('uploads/categories/banner');
        }
        if($request->hasFile('icon')){
            $category->icon = $request->file('icon')->store('uploads/categories/icon');
        }

        $category->digital = $request->digital;
        if($category->save()){
            $category = Category::orderBy('id','desc')->first();
            $category = json_decode($category);
            if($category->banner != NULL) {
                if(file_get_contents(public_path($category->banner))) {
                    $file_extension = explode(".",$category->banner);
                    foreach($file_extension as $extension) {
                        if($extension == "jpg" || $extension == "jpge") {
                            $compress_image = $category->banner;
                            $source_image=imagecreatefromjpeg($category->banner);
                            imagejpeg($source_image,$compress_image,35); 
                        }
                        else if($extension == "png") {
                            $compress_image = $category->banner;
                            $source_image=imagecreatefrompng($category->banner);
                            imagepng($source_image,$compress_image,3);  
                        }
                    }
                }
            }
            if($category->icon != NULL) {
                if(file_get_contents(public_path($category->icon))) {
                    $file_extension = explode(".",$category->icon);
                    foreach($file_extension as $extension) {
                        if($extension == "jpg" || $extension == "jpge") {
                            $compress_image = $category->icon;
                            $source_image=imagecreatefromjpeg($category->icon);
                            imagejpeg($source_image,$compress_image,35); 
                        }
                        else if($extension == "png") {
                            $compress_image = $category->icon;
                            $source_image=imagecreatefrompng($category->icon);
                            imagepng($source_image,$compress_image,3);  
                        }
                    }
                }
            }
            flash(translate('Category has been inserted successfully'))->success();
            return redirect()->route('categories.index');
        }
        else{
            flash(translate('Something went wrong'))->error();
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::findOrFail(decrypt($id));
        return view('categories.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        foreach (Language::all() as $key => $language) {
            $data = openJSONFile($language->code);
            unset($data[$category->name]);
            $data[$request->name] = "";
            saveJSONFile($language->code, $data);
        }

        $category->name = $request->name;
        $category->meta_title = $request->meta_title;
        $category->meta_description = $request->meta_description;
        if ($request->slug != null) {
            $category->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        }
        else {
            $category->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->name)).'-'.Str::random(5);
        }

        if($request->hasFile('banner')){
            $category->banner = $request->file('banner')->store('uploads/categories/banner');
        }
        if($request->hasFile('icon')){
            $category->icon = $request->file('icon')->store('uploads/categories/icon');
        }
        if ($request->commision_rate != null) {
            $category->commision_rate = $request->commision_rate;
        }

        $category->digital = $request->digital;
        if($category->save()){
            $category = Category::where('id',$id)->get();
            $category = json_decode($category);
            foreach($category as $category_value) {
                if($category_value->banner != NULL) {
                    if(file_get_contents(public_path($category_value->banner))) {
                        $file_extension = explode(".",$category_value->banner);
                        foreach($file_extension as $extension) {
                            if($extension == "jpg" || $extension == "jpge") {
                                $compress_image = $category_value->banner;
                                $source_image=imagecreatefromjpeg($category_value->banner);
                                imagejpeg($source_image,$compress_image,35); 
                            }
                            else if($extension == "png") {
                                $compress_image = $category_value->banner;
                                $source_image=imagecreatefrompng($category_value->banner);
                                imagepng($source_image,$compress_image,3);  
                            }
                        }
                    }
                }
                if($category_value->icon != NULL) {
                    if(file_get_contents(public_path($category_value->icon))) {
                        $file_extension = explode(".",$category_value->icon);
                        foreach($file_extension as $extension) {
                            if($extension == "jpg" || $extension == "jpge") {
                                $compress_image = $category_value->icon;
                                $source_image=imagecreatefromjpeg($category_value->icon);
                                imagejpeg($source_image,$compress_image,35); 
                            }
                            else if($extension == "png") {
                                $compress_image = $category_value->icon;
                                $source_image=imagecreatefrompng($category_value->icon);
                                imagepng($source_image,$compress_image,3);  
                            }
                        }
                    }
                }
            }
            flash(translate('Category has been updated successfully'))->success();
            return redirect()->route('categories.index');
        }
        else{
            flash(translate('Something went wrong'))->error();
            return back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        foreach ($category->subcategories as $key => $subcategory) {
            foreach ($subcategory->subsubcategories as $key => $subsubcategory) {
                $subsubcategory->delete();
            }
            $subcategory->delete();
        }

        Product::where('category_id', $category->id)->delete();
        HomeCategory::where('category_id', $category->id)->delete();

        if(Category::destroy($id)){

            foreach (Language::all() as $key => $language) {
                $data = openJSONFile($language->code);
                unset($data[$category->name]);
                saveJSONFile($language->code, $data);
            }

            if($category->banner != null){
                unlink($category->banner);
            }
            if($category->icon != null){
                //unlink($category->icon);
                unlink($category->icon);
            }
            
            flash(translate('Category has been deleted successfully'))->success();
            return redirect()->route('categories.index');
        }
        else{
            flash(translate('Something went wrong'))->error();
            return back();
        }
    }

    public function updateFeatured(Request $request)
    {
        $category = Category::findOrFail($request->id);
        $category->featured = $request->status;
        if($category->save()){
            return 1;
        }
        return 0;
    }
}

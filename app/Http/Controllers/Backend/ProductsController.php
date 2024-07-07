<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\Brand;
use App\Models\ProductVariations;
use App\Models\Pro_category;
use App\Models\Pro_image;
use App\Models\Product;
use App\Models\Related_product;
use App\Models\Tax;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Imports\ProductsImport; // Import the Import class
use App\Models\Subcategory;
use Maatwebsite\Excel\Facades\Excel; // Import Excel facade for Excel handling
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class ProductsController extends Controller
{
    //Products page load
    public function getProductsPageLoad()
    {
        if (Session::has('LoggedIn')) {
            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $brandlist = Brand::where('is_publish', 1)->orderBy('name', 'asc')->get();
            $storeList = DB::table('users')
                ->select('users.id', 'users.store')
                ->where('users.role', '=', 2)
                ->where('users.status', '=', 1)
                ->orderBy('users.store', 'asc')
                ->get();
            $datalist = Product::all();

            $subcategorylist = Subcategory::all();

            return view('admin.backend.products', compact('user_session', 'datalist', 'brandlist', 'storeList', 'subcategorylist'));
        }
    }



    //Save data for Products
    public function saveProductsData(Request $request)
    {

        $res = array();

        $id = $request->input('RecordId');
        $title = $request->input('title');
        $slug = getSlug($request->input('slug'));
        // dd($slug);
        $category = $request->input('categories');
        $subcategory_id = $request->input('subcategory_id');
        $brand_id = $request->input('brand_id');
        $store_id = $request->input('store_id');
        $short_desc = $request->input('short_desc');
        $description = $request->input('description');

        if (!empty($request->f_thumbnail)) {
            $image = $request->file('f_thumbnail')->getClientOriginalName();
            $request->f_thumbnail->move(public_path('product_images'), $image);
            $thumbnail = $image; // Use the uploaded image name here
        } else {
            // Check if a product exists with the given ID first
            $product = Product::where('id', $id)->first();
            if ($product) {
                $thumbnail = $product->f_thumbnail;
            } else {
                // Handle the case where no product is found with the ID
                $thumbnail = null; // Or set a default value
            }
        }

        $data = array(
            'title' => $title,
            'slug' => $slug,
            'f_thumbnail' => $thumbnail,
            'category' => $category,
            'subcategory_id' => $subcategory_id,
            'short_desc' => $short_desc,
            'description' => $description,
            'brand_id' => $brand_id,
            'store_id' => $store_id,
            'price1' => $request->price1,
            'price2' => $request->price2,
            'price3' => $request->price3,
            'price4' => $request->price4,
            'price5' => $request->price5,
            'is_publish' => $request->is_publish,
        );

        if ($id == '') {
            $response = Product::create($data)->id;
            if ($response) {
                $res['id'] = $response;
                $res['msgType'] = 'success';
                $res['msg'] = __('New Data Added Successfully');

                return redirect()->route('backend.product', $res['id']);
            } else {
                $res['id'] = '';
                $res['msgType'] = 'error';
                $res['msg'] = __('Data insert failed');
            }
        } else {
            $response = Product::where('id', $id)->update($data);
            if ($response) {

                $res['id'] = $id;
                $res['msgType'] = 'success';
                $res['msg'] = __('Data Updated Successfully');
                return redirect()->route('backend.inventory', $res['id']);
            } else {
                $res['id'] = '';
                $res['msgType'] = 'error';
                $res['msg'] = __('Data update failed');
            }
        }
    }

    //Delete data for Products
    public function deleteProducts(Request $request)
    {
        $res = array();

        $id = $request->id;

        if (!empty($id)) {
            try {
                // Begin transaction
                DB::beginTransaction();

                // Delete related images and products
                Pro_image::where('product_id', $id)->delete();
                Related_product::where('product_id', $id)->delete();

                // Delete the product
                $response = Product::where('id', $id)->delete();

                // Commit transaction
                DB::commit();

                if ($response) {
                    $res['msgType'] = 'success';
                    $res['msg'] = __('Data Removed Successfully');
                    return back();
                } else {
                    $res['msgType'] = 'error';
                    $res['msg'] = __('Data remove failed');
                }
            } catch (\Exception $e) {
                // Rollback transaction in case of error
                DB::rollBack();
                $res['msgType'] = 'error';
                $res['msg'] = __('An error occurred: ') . $e->getMessage();
            }
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Invalid product ID');
        }
    }

    public function showImportForm()
    {
        if (Session::has('LoggedIn')) {
            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            return view('admin.backend.product_import', compact('user_session'));
        }
    }

    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,csv',
        ]);

        Excel::import(new ProductsImport(), $request->file('file'));

        return redirect()->back()->with('success', 'Products imported successfully.');
    }


    //has Product Slug
    public function hasProductSlug(Request $request)
    {
        $res = array();

        $slug = str_slug($request->slug);
        $count = Product::where('slug', $slug)->count();
        if ($count == 0) {
            $res['slug'] = $slug;
        } else {
            $incr = $count + 1;
            $res['slug'] = $slug . '-' . $incr;
        }

        return response()->json($res);
    }

    //get Product
    public function getProductPageData($id)
    {
        // dd($id);
        if (Session::has('LoggedIn')) {
            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $brandlist = Brand::where('is_publish', 1)->orderBy('name', 'asc')->get();
            $categorylist = Pro_category::where('is_publish', 1)->orderBy('name', 'asc')->get();
            $subcategorylist = Subcategory::all();
            $taxlist = Tax::orderBy('title', 'asc')->get();
            $unitlist = Attribute::orderBy('name', 'asc')->get();
            $datalist = Product::where('id', $id)->first();
            $storeList = DB::table('users')
                ->select('users.id', 'users.store')
                ->where('users.role', '=', 2)
                ->where('users.status', '=', 1)
                ->orderBy('users.store', 'asc')
                ->get();

            return view('admin.backend.product', compact('brandlist', 'categorylist', 'storeList', 'taxlist', 'storeList', 'unitlist', 'user_session', 'datalist', 'subcategorylist'));
        }
    }



    //get Price
    public function getPricePageData($id)
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $RecordId = Product::orderByDesc('id')->first()->id;
            $datalist = Product::where('id', $id)->first();
            return view('admin.backend.price', compact('user_session', 'RecordId', 'datalist'));
        }
    }

    //Save data for Price
    public function savePriceData(Request $request)
    {
        $res = array();

        $id = $request->input('RecordId');
        $cost_price = $request->input('cost_price');
        $sale_price = $request->input('sale_price');
        $old_price = $request->input('old_price');
        $start_date = date("Y-m-d");
        $end_date = $request->input('end_date');
        $is_discount = $request->input('is_discount');

        $validator_array = array(
            'sale_price' => $sale_price
        );

        $validator = Validator::make($validator_array, [
            'sale_price' => 'required'
        ]);

        $errors = $validator->errors();

        if ($errors->has('sale_price')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('sale_price');
            return response()->json($res);
        }

        if ($end_date == '') {
            $data = array(
                'cost_price' => $cost_price,
                'sale_price' => $sale_price,
                'old_price' => $old_price,
                'start_date' => NULL,
                'end_date' => NULL,
                'is_discount' => $is_discount
            );
        } else {
            $data = array(
                'cost_price' => $cost_price,
                'sale_price' => $sale_price,
                'old_price' => $old_price,
                'start_date' => $start_date,
                'end_date' => $end_date,
                'is_discount' => $is_discount
            );
        }

        $response = Product::where('id', $id)->update($data);
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('Data Updated Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data update failed');
        }

        return redirect()->route('backend.inventory', $id);
    }

    //get Inventory
    public function getInventoryPageData($id)
    {

        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $RecordId = Product::orderByDesc('id')->first()->id;
            $datalist = Product::where('id', $id)->first();
            return view('admin.backend.inventory', compact('user_session', 'RecordId', 'datalist'));
        }
    }

    //Save data for Inventory
    public function saveInventoryData(Request $request)
    {
        $res = array();

        $id = $request->input('RecordId');
        $is_stock = $request->input('is_stock');
        $stock_status_id = $request->input('stock_status_id');
        $sku = $request->input('sku');
        $stock_qty = $request->input('stock_qty');

        $data = array(
            'is_stock' => $is_stock,
            'stock_status_id' => $stock_status_id,
            'sku' => $sku,
            'stock_qty' => $stock_qty
        );

        $response = Product::where('id', $id)->update($data);
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('Data Updated Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data update failed');
        }

        return redirect()->route('backend.product-images', $id);
    }

    //get Product Images
    public function getProductImagesPageData($id)
    {

        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $RecordId = Product::orderByDesc('id')->first()->id;
            $datalist = Product::where('id', $id)->first();
            return view('admin.backend.product-images', compact('user_session', 'RecordId', 'datalist'));
        }
    }

    //Get data for Product Images Pagination
    public function getProductImagesTableData(Request $request)
    {

        $id = $request->id;

        if ($request->ajax()) {
            $imagelist = Pro_image::where('product_id', $id)->orderBy('id', 'desc')->paginate(15);

            return view('backend.partials.product_images_list', compact('imagelist'))->render();
        }
    }

    //Save data for Product Images
    public function saveProductImagesData(Request $request)
    {
        $product_id = $request->input('RecordId');
        $images = $request->file('product_images');

        if ($images) {


            foreach ($images as $product_images) {
                $imageName = $product_images->getClientOriginalName();
                $product_images->move(public_path('product_images'), $imageName);
                $imagePath = 'product_images/' . $imageName; // Adjust this based on your directory structure

                Pro_image::create(['thumbnail' => $imagePath, 'product_id' => $product_id, 'color' => 'm']);
            }
        }

        return redirect()->route('backend.variations', $product_id);
    }

    //Delete data for Product Images
    public function deleteProductImages(Request $request)
    {
        $res = array();

        $id = $request->id;

        if ($id != '') {
            $response = Pro_image::where('id', $id)->delete();
            if ($response) {
                $res['msgType'] = 'success';
                $res['msg'] = __('Data Removed Successfully');
            } else {
                $res['msgType'] = 'error';
                $res['msg'] = __('Data remove failed');
            }
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Invalid ID');
        }

        return response()->json($res);
    }

    //get Variations
    public function getVariationsPageData($id)
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();

            $RecordId = Product::orderByDesc('id')->first()->id;
            $datalist = Product::where('id', $id)->first();
            return view('admin.backend.variations', compact('user_session', 'RecordId', 'datalist'));
        }
    }

    //Save data for Variations
    public function saveVariationsData(Request $request)
    {
        $res = array();

        $id = $request->input('RecordId');
        $sizes = $request->input('variation_size');
        $colors = $request->input('variation_color');

        $product = Product::find($id);
        if (!$product) {
            $res['msgType'] = 'error';
            $res['msg'] = __('Product not found');
            return redirect()->route('backend.product-seo', $id)->with($res);
        }

        $mainSku = $product->sku;

        // Clear previous variations
        ProductVariations::where('product_id', $id)->delete();

        $variations = [];
        if (!empty($sizes) && !empty($colors)) {
            foreach ($sizes as $size) {
                foreach ($colors as $color) {
                    $sku = $mainSku . '-' . strtoupper($size) . '-' . strtoupper($color);
                    $variations[] = [
                        'product_id' => $id,
                        'size' => $size,
                        'color' => $color,
                        'sku' => $sku,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];

                    // Handle color images upload
                    if ($request->hasFile('color_images') && isset($request->file('color_images')[$color])) {
                        $image = $request->file('color_images')[$color];
                        $imageName = $image->getClientOriginalName();
                        $imagePath = 'product_images/' . $imageName;

                        // Move and store the image
                        $image->move(public_path('product_images'), $imageName);

                        // Create or update the product with color-specific details
                        $product->updateOrCreate(
                            [
                                'title' => $product->title,
                                'slug' => getSlug($product->slug . '-' . strtoupper($color)),
                            ],
                            [
                                'description' => $product->description,
                                'f_thumbnail' => $imageName,
                                'sku' => $sku,
                                'category' => $product->category,
                                'subcategory_id' => $product->subcategory_id,
                                'short_desc' => $product->short_desc,
                                'brand_id' => $product->brand_id,
                                'store_id' => $product->store_id,
                                'price1' => $product->price1,
                                'price2' => $product->price2,
                                'price3' => $product->price3,
                                'price4' => $product->price4,
                                'price5' => $product->price5,
                                'is_publish' => $product->is_publish,
                                'cost_price' => $product->cost_price,
                                'sale_price' => $product->sale_price,
                                'old_price' => $product->old_price,
                                'start_date' => $product->start_date,
                                'end_date' => $product->end_date,
                                'is_discount' => $product->is_discount,
                                'is_stock' => $product->is_stock,
                                'stock_status_id' => $product->stock_status_id,
                                'stock_qty' => $product->stock_qty,
                                'variation_size' => implode(',', $sizes),
                                'variation_color' => implode(',', $colors),
                            ]
                        );

                        // Save the product image path
                        Pro_image::create([
                            'product_id' => $product->id,
                            'color' => $color,
                            'thumbnail' => $imagePath,
                        ]);
                    }
                }
            }
        }



        // Insert all variations into ProductVariations table
        if (!empty($variations)) {
            ProductVariations::insert($variations);
            ProductVariations::create([
                'product_id' => $id,
                'size' => $mainSku,
                'color' => $mainSku,
                'sku' => $mainSku,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Update the product with variations data
        $data = [
            'variation_size' => implode(',', $sizes),
            'variation_color' => implode(',', $colors),
        ];

        $response = $product->update($data);


        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('Data Updated Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data update failed');
        }

        return redirect()->route('backend.product-seo', $id)->with($res);
    }


    //get Product SEO
    public function getProductSEOPageData($id)
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $RecordId = Product::orderByDesc('id')->first()->id;
            $datalist = Product::where('id', $id)->first();
            return view('admin.backend.product-seo', compact('user_session', 'RecordId', 'datalist'));
        }
    }

    //Save data for Product SEO
    public function saveProductSEOData(Request $request)
    {
        $res = array();

        $id = $request->input('RecordId');
        $og_title = $request->input('og_title');
        $og_image = $request->input('og_image');
        $og_description = $request->input('og_description');
        $og_keywords = $request->input('og_keywords');
        if (!empty($request->og_image)) {

            $image = $request->file('og_image')->getClientOriginalName();
            $request->og_image->move(public_path('og_image'), $image);
            $thumbnail = $_FILES['og_image']['name'];
        }
        if (empty($request->og_image)) {
            $thumbnail = Product::where('id', $id)->first()->og_image;
        }
        $data = array(
            'og_title' => $og_title,
            'og_image' => $thumbnail,
            'og_description' => $og_description,
            'og_keywords' => $og_keywords
        );

        $response = Product::where('id', $id)->update($data);
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('Data Updated Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data update failed');
        }
        return redirect()->route('backend.products');
    }

    //get Related Products
    public function getRelatedProductsPageData($id)
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $datalist = Product::where('id', $id)->first();

            $productlist = Product::all();



            return view('admin.backend.related-products', compact('datalist', 'productlist', 'user_session'));
        }
    }

    //Get data for Related Products Pagination
    public function getRelatedProductTableData(Request $request)
    {
        $search = $request->search;

        $products = Product::where('title', 'like', '%' . $search . '%')
            ->where('is_publish', 1)
            ->get(['id', 'title', 'f_thumbnail']); // Adjust as needed

        return response()->json($products);
    }


    //Save data for Related Products
    public function saveRelatedProductsData(Request $request)
    {
        $res = [];

        try {
            $product_id = $request->input('product_id');
            $related_item_ids = $request->input('related_item_id');

            // Ensure related_item_id is an array
            if (!is_array($related_item_ids)) {
                throw new \Exception('Invalid related_item_id format.');
            }

            $inserted = [];

            // Loop through each related_item_id and insert into database
            foreach ($related_item_ids as $related_item_id) {
                $data = [
                    'product_id' => $product_id,
                    'related_item_id' => $related_item_id
                ];

                $response = Related_product::create($data);
                if ($response) {
                    $inserted[] = $response;
                } else {
                    throw new \Exception('Failed to insert related product.');
                }
            }

            $res['msgType'] = 'success';
            $res['msg'] = __('New Data Added Successfully');
            $res['inserted'] = $inserted;
        } catch (\Exception $e) {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data insert failed: ') . $e->getMessage();
        }

        return response()->json($res);
    }



    //Delete data for Related Product
    public function deleteRelatedProduct(Request $request)
    {
        $res = [];

        try {
            $relatedProductId = $request->input('id');
            $relatedProduct = Related_product::find($relatedProductId);

            if ($relatedProduct) {
                $relatedProduct->delete();
                $res['msgType'] = 'success';
                $res['msg'] = __('Related product deleted successfully');
            } else {
                throw new \Exception('Related product not found');
            }
        } catch (\Exception $e) {
            $res['msgType'] = 'error';
            $res['msg'] = __('Failed to delete related product: ') . $e->getMessage();
        }

        return response()->json($res);
    }
}

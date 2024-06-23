<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\Brand;
use App\Models\Media_option;
use App\Models\Pro_category;
use App\Models\Pro_image;
use App\Models\Product;
use App\Models\Related_product;
use App\Models\Tax;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class ProductsController extends Controller
{
    //Products page load
    public function getProductsPageLoad()
    {

        $AllCount = Product::count();
        $PublishedCount = Product::where('is_publish', '=', 1)->count();
        $DraftCount = Product::where('is_publish', '=', 2)->count();


        $brandlist = Brand::where('is_publish', 1)->orderBy('name', 'asc')->get();
        $categorylist = Pro_category::where('is_publish', 1)->orderBy('name', 'asc')->get();

        $storeList = DB::table('users')
            ->select('users.id', 'users.store')
            ->where('users.role', '=', 2)
            ->where('users.status', '=', 1)
            ->orderBy('users.store', 'asc')
            ->get();

        $datalist = DB::table('products')

            ->join('pro_categories', 'products.cat_id', '=', 'pro_categories.id')
            ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
            ->join('users', 'products.user_id', '=', 'users.id')
            ->select('products.*', 'pro_categories.name as category_name', 'brands.name as brand_name', 'tp_status.status', 'languages.language_name', 'users.store')
            ->orderBy('products.id', 'desc')
            ->paginate(20);

        if (Session::has('LoggedIn')) {
            $user_session = User::where('id', Session::get('LoggedIn'))->first();

            return view('admin.backend.products', compact('AllCount', 'PublishedCount', 'DraftCount', 'user_session', 'categorylist', 'brandlist', 'storeList', 'datalist'));
        }
    }

    //Get data for Products Pagination
    public function getProductsTableData(Request $request)
    {

        $search = $request->search;
        $status = $request->status;
        $language_code = $request->language_code;
        $category_id = $request->category_id;
        $brand_id = $request->brand_id;
        $user_id = $request->store_id;

        if ($request->ajax()) {

            if ($search != '') {
                $datalist = DB::table('products')
                    ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
                    ->join('languages', 'products.lan', '=', 'languages.language_code')
                    ->join('pro_categories', 'products.cat_id', '=', 'pro_categories.id')
                    ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                    ->join('users', 'products.user_id', '=', 'users.id')
                    ->select('products.*', 'pro_categories.name as category_name', 'brands.name as brand_name', 'tp_status.status', 'languages.language_name', 'users.shop_name')
                    ->where(function ($query) use ($search) {
                        $query->where('products.title', 'like', '%' . $search . '%')
                            ->orWhere('pro_categories.name', 'like', '%' . $search . '%')
                            ->orWhere('brands.name', 'like', '%' . $search . '%')
                            ->orWhere('languages.language_name', 'like', '%' . $search . '%')
                            ->orWhere('cost_price', 'like', '%' . $search . '%');
                    })

                    ->where(function ($query) use ($status) {
                        $query->whereRaw("products.is_publish = '" . $status . "' OR '" . $status . "' = '0'");
                    })

                    ->where(function ($query) use ($category_id) {
                        $query->whereRaw("products.cat_id = '" . $category_id . "' OR '" . $category_id . "' = '0'");
                    })
                    ->where(function ($query) use ($brand_id) {
                        $query->whereRaw("products.brand_id = '" . $brand_id . "' OR '" . $brand_id . "' = 'all'");
                    })
                    ->where(function ($query) use ($user_id) {
                        $query->whereRaw("products.user_id = '" . $user_id . "' OR '" . $user_id . "' = '0'");
                    })
                    ->orderBy('products.id', 'desc')
                    ->paginate(20);
            } else {

                $datalist = DB::table('products')

                    ->join('pro_categories', 'products.cat_id', '=', 'pro_categories.id')
                    ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                    ->select('products.*', 'pro_categories.name as category_name', 'brands.name as brand_name', 'tp_status.status',  'users.store')
                    ->join('users', 'products.user_id', '=', 'users.id')
                    ->where(function ($query) use ($status) {
                        $query->whereRaw("products.is_publish = '" . $status . "' OR '" . $status . "' = '0'");
                    })

                    ->where(function ($query) use ($category_id) {
                        $query->whereRaw("products.cat_id = '" . $category_id . "' OR '" . $category_id . "' = '0'");
                    })
                    ->where(function ($query) use ($brand_id) {
                        $query->whereRaw("products.brand_id = '" . $brand_id . "' OR '" . $brand_id . "' = 'all'");
                    })
                    ->where(function ($query) use ($user_id) {
                        $query->whereRaw("products.user_id = '" . $user_id . "' OR '" . $user_id . "' = '0'");
                    })

                    ->orderBy('products.id', 'desc')
                    ->paginate(20);
            }

            return view('backend.partials.products_table', compact('datalist'))->render();
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
        $cat_id = $request->input('categories');
        $brand_id = $request->input('brand_id');
        $store_id = $request->input('store_id');
        $short_desc = $request->input('short_desc');
        $description = $request->input('description');

        if (!empty($request->f_thumbnail)) {

            $image = $request->file('f_thumbnail')->getClientOriginalName();
            $request->f_thumbnail->move(public_path('f_thumbnail'), $image);
        }

        $data = array(
            'title' => $title,
            'slug' => $slug,
            'f_thumbnail' => $_FILES['f_thumbnail']['name'],
            'cat_id' => $cat_id,
            'short_desc' => $short_desc,
            'description' => $description,
            'brand_id' => $brand_id,
            'store_id' => $store_id,
            'price' => $request->price
        );

        if ($id == '') {
            $response = Product::create($data)->id;
            if ($response) {
                $res['id'] = $response;
                $res['msgType'] = 'success';
                $res['msg'] = __('New Data Added Successfully');
            } else {
                $res['id'] = '';
                $res['msgType'] = 'error';
                $res['msg'] = __('Data insert failed');
            }
        }


        return response()->json($res);
    }

    //Delete data for Products
    public function deleteProducts(Request $request)
    {

        $res = array();

        $id = $request->id;

        if ($id != '') {
            Pro_image::where('product_id', $id)->delete();
            Related_product::where('product_id', $id)->delete();
            $response = Product::where('id', $id)->delete();
            if ($response) {
                $res['msgType'] = 'success';
                $res['msg'] = __('Data Removed Successfully');
            } else {
                $res['msgType'] = 'error';
                $res['msg'] = __('Data remove failed');
            }
        }

        return response()->json($res);
    }

    //Bulk Action for Products
    public function bulkActionProducts(Request $request)
    {

        $res = array();

        $idsStr = $request->ids;
        $idsArray = explode(',', $idsStr);

        $BulkAction = $request->BulkAction;

        if ($BulkAction == 'publish') {
            $response = Product::whereIn('id', $idsArray)->update(['is_publish' => 1]);
            if ($response) {
                $res['msgType'] = 'success';
                $res['msg'] = __('Data Updated Successfully');
            } else {
                $res['msgType'] = 'error';
                $res['msg'] = __('Data update failed');
            }
        } elseif ($BulkAction == 'draft') {

            $response = Product::whereIn('id', $idsArray)->update(['is_publish' => 2]);
            if ($response) {
                $res['msgType'] = 'success';
                $res['msg'] = __('Data Updated Successfully');
            } else {
                $res['msgType'] = 'error';
                $res['msg'] = __('Data update failed');
            }
        } elseif ($BulkAction == 'delete') {

            Pro_image::whereIn('product_id', $idsArray)->delete();
            Related_product::whereIn('product_id', $idsArray)->delete();

            $response = Product::whereIn('id', $idsArray)->delete();
            if ($response) {
                $res['msgType'] = 'success';
                $res['msg'] = __('Data Removed Successfully');
            } else {
                $res['msgType'] = 'error';
                $res['msg'] = __('Data remove failed');
            }
        }

        return response()->json($res);
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
    public function getProductPageData()
    {
        if (Session::has('LoggedIn')) {
            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $brandlist = Brand::where('is_publish', 1)->orderBy('name', 'asc')->get();
            $categorylist = Pro_category::where('is_publish', 1)->orderBy('name', 'asc')->get();

            $taxlist = Tax::orderBy('title', 'asc')->get();
            $unitlist = Attribute::orderBy('name', 'asc')->get();
            $media_datalist = Media_option::orderBy('id', 'desc')->paginate(28);

            $storeList = DB::table('users')
                ->select('users.id', 'users.store')
                ->where('users.role', '=', 2)
                ->where('users.status', '=', 1)
                ->orderBy('users.store', 'asc')
                ->get();

            return view('admin.backend.product', compact('brandlist', 'categorylist', 'storeList', 'taxlist', 'media_datalist', 'storeList', 'unitlist', 'user_session'));
        }
    }

    //Update data for Products
    public function updateProductsData(Request $request)
    {
        $res = array();

        $id = $request->input('RecordId');
        $title = $request->input('title');
        $slug = getSlug($request->input('slug'));
        $short_desc = $request->input('short_desc');
        $description = $request->input('description');
        $brand_id = $request->input('brand_id');
        $tax_id = $request->input('tax_id');
        $collection_id = $request->input('collection_id');
        $is_featured = $request->input('is_featured');

        $is_publish = $request->input('is_publish');
        $f_thumbnail = $request->input('f_thumbnail');
        $category_ids = $request->input('cat_id');
        $cat_id = $request->input('cat_id');
        $user_id = $request->input('storeid');
        $variation_size = $request->input('variation_size');
        $sale_price = $request->input('sale_price');

        $validator_array = array(
            'product_name' => $request->input('title'),
            'slug' => $slug,
            'featured_image' => $request->input('f_thumbnail'),
            'category' => $request->input('cat_id'),

            'status' => $request->input('is_publish'),
            'store' => $request->input('storeid'),
            'variation_size' => $request->input('variation_size'),
            'sale_price' => $request->input('sale_price')
        );

        $rId = $id == '' ? '' : ',' . $id;
        $validator = Validator::make($validator_array, [
            'product_name' => 'required',
            'slug' => 'required|max:191|unique:products,slug' . $rId,
            'featured_image' => 'required',

            'category' => 'required',
            'status' => 'required',
            'store' => 'required',
            'variation_size' => 'required',
            'sale_price' => 'required'
        ]);

        $errors = $validator->errors();

        if ($errors->has('product_name')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('product_name');
            return response()->json($res);
        }

        if ($errors->has('slug')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('slug');
            return response()->json($res);
        }



        if ($errors->has('category')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('category');
            return response()->json($res);
        }

        if ($errors->has('featured_image')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('featured_image');
            return response()->json($res);
        }

        if ($errors->has('status')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('status');
            return response()->json($res);
        }

        if ($errors->has('store')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('store');
            return response()->json($res);
        }

        if ($errors->has('variation_size')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('variation_size');
            return response()->json($res);
        }

        if ($errors->has('sale_price')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('sale_price');
            return response()->json($res);
        }

        $data = array(
            'title' => $title,
            'slug' => $slug,
            'f_thumbnail' => $f_thumbnail,
            'short_desc' => $short_desc,
            'description' => $description,
            'category_ids' => $category_ids,
            'cat_id' => $cat_id,
            'brand_id' => $brand_id,
            'tax_id' => $tax_id,
            'collection_id' => $collection_id,
            'is_featured' => $is_featured,
            'is_publish' => $is_publish,
            'user_id' => $user_id,
            'variation_size' => $variation_size,
            'sale_price' => $sale_price,

        );

        $response = Product::where('id', $id)->update($data);
        if ($response) {



            $res['msgType'] = 'success';
            $res['msg'] = __('Data Updated Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data update failed');
        }

        return response()->json($res);
    }

    //get Price
    public function getPricePageData()
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $RecordId = Product::orderByDesc('id')->first()->id;

            return view('admin.backend.price', compact('user_session','RecordId'));
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

        return response()->json($res);
    }

    //get Inventory
    public function getInventoryPageData()
    {

        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();
            $RecordId = Product::orderByDesc('id')->first()->id;
            return view('admin.backend.inventory', compact('user_session','RecordId'));
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

        return response()->json($res);
    }

    //get Product Images
    public function getProductImagesPageData()
    {

        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();

            return view('admin.backend.product-images', compact('user_session'));
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
        $res = array();

        $product_id = $request->input('product_id');
        $thumbnail = $request->input('thumbnail');
        $large_image = $request->input('large_image');

        $validator_array = array(
            'image' => $request->input('thumbnail')
        );

        $validator = Validator::make($validator_array, [
            'image' => 'required'
        ]);

        $errors = $validator->errors();

        if ($errors->has('image')) {
            $res['msgType'] = 'error';
            $res['msg'] = $errors->first('image');
            return response()->json($res);
        }

        $data = array(
            'product_id' => $product_id,
            'thumbnail' => $thumbnail,
            'large_image' => $large_image
        );

        $response = Pro_image::create($data);
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('New Data Added Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data insert failed');
        }

        return response()->json($res);
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
        }

        return response()->json($res);
    }

    //get Variations
    public function getVariationsPageData()
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();


            return view('admin.backend.variations', compact('user_session'));
        }
    }

    //Save data for Variations
    public function saveVariationsData(Request $request)
    {
        $res = array();

        $id = $request->input('RecordId');
        $sizes = $request->input('variation_size');
        $colors = $request->input('variation_color');

        $variation_size = NULL;
        $i = 0;
        if ($sizes != '') {
            foreach ($sizes as $key => $size) {
                if ($i++) {
                    $variation_size .= ',';
                }
                $variation_size .= $size;
            }
        }

        $variation_color = NULL;
        $f = 0;
        if ($colors != '') {
            foreach ($colors as $key => $color) {
                if ($f++) {
                    $variation_color .= ',';
                }
                $variation_color .= $color;
            }
        }
        $data = array(
            'variation_size' => $variation_size,
            'variation_color' => $variation_color
        );

        $response = Product::where('id', $id)->update($data);
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('Data Updated Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data update failed');
        }

        return response()->json($res);
    }

    //get Product SEO
    public function getProductSEOPageData()
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();


            return view('admin.backend.product-seo', compact('user_session'));
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

        $data = array(
            'og_title' => $og_title,
            'og_image' => $og_image,
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

        return response()->json($res);
    }

    //get Related Products
    public function getRelatedProductsPageData($id)
    {

        $datalist = Product::where('id', $id)->first();

        $productlist = DB::table('products')
            ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
            ->join('languages', 'products.lan', '=', 'languages.language_code')
            ->select('products.id', 'products.title', 'products.f_thumbnail', 'products.cost_price', 'products.sale_price', 'products.is_stock', 'products.is_publish', 'tp_status.status', 'languages.language_name')
            ->whereNotIn('products.id', [$id])
            ->where('products.is_publish', 1)
            ->orderBy('products.id', 'desc')
            ->paginate(20);

        $relateddatalist = DB::table('products')
            ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
            ->join('languages', 'products.lan', '=', 'languages.language_code')
            ->join('related_products', 'products.id', '=', 'related_products.related_item_id')
            ->select('related_products.id', 'products.title', 'products.f_thumbnail', 'products.is_publish', 'tp_status.status', 'languages.language_name')
            ->where('related_products.product_id', $id)
            ->where('products.is_publish', 1)
            ->orderBy('related_products.id', 'desc')
            ->paginate(20);

        return view('backend.related-products', compact('datalist', 'productlist', 'relateddatalist'));
    }

    //Get data for Products Pagination Related Products
    public function getProductListForRelatedTableData(Request $request)
    {

        $search = $request->search;
        $id = $request->product_id;

        if ($request->ajax()) {

            if ($search != '') {
                $productlist = DB::table('products')
                    ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
                    ->join('languages', 'products.lan', '=', 'languages.language_code')
                    ->select('products.id', 'products.title', 'products.f_thumbnail', 'products.cost_price', 'products.sale_price', 'products.is_stock', 'products.is_publish', 'tp_status.status', 'languages.language_name')
                    ->where(function ($query) use ($search) {
                        $query->where('title', 'like', '%' . $search . '%')
                            ->orWhere('cost_price', 'like', '%' . $search . '%');
                    })
                    ->whereNotIn('products.id', [$id])
                    ->where('products.is_publish', 1)
                    ->orderBy('products.id', 'desc')
                    ->paginate(20);
            } else {
                $productlist = DB::table('products')
                    ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
                    ->join('languages', 'products.lan', '=', 'languages.language_code')
                    ->select('products.id', 'products.title', 'products.f_thumbnail', 'products.cost_price', 'products.sale_price', 'products.is_stock', 'products.is_publish', 'tp_status.status', 'languages.language_name')
                    ->whereNotIn('products.id', [$id])
                    ->where('products.is_publish', 1)
                    ->orderBy('products.id', 'desc')
                    ->paginate(20);
            }

            return view('backend.partials.products_list_for_related_product', compact('productlist'))->render();
        }
    }

    //Get data for Related Products Pagination
    public function getRelatedProductTableData(Request $request)
    {

        $search = $request->search;
        $id = $request->product_id;

        if ($request->ajax()) {

            if ($search != '') {
                $relateddatalist = DB::table('products')
                    ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
                    ->join('languages', 'products.lan', '=', 'languages.language_code')
                    ->join('related_products', 'products.id', '=', 'related_products.related_item_id')
                    ->select('related_products.id', 'products.title', 'products.f_thumbnail', 'products.is_publish', 'tp_status.status', 'languages.language_name')
                    ->where(function ($query) use ($search) {
                        $query->where('title', 'like', '%' . $search . '%')
                            ->orWhere('languages.language_name', 'like', '%' . $search . '%');
                    })
                    ->where('related_products.product_id', $id)
                    ->where('products.is_publish', 1)
                    ->orderBy('related_products.id', 'desc')
                    ->paginate(20);
            } else {
                $relateddatalist = DB::table('products')
                    ->join('tp_status', 'products.is_publish', '=', 'tp_status.id')
                    ->join('languages', 'products.lan', '=', 'languages.language_code')
                    ->join('related_products', 'products.id', '=', 'related_products.related_item_id')
                    ->select('related_products.id', 'products.title', 'products.f_thumbnail', 'products.is_publish', 'tp_status.status', 'languages.language_name')
                    ->where('related_products.product_id', $id)
                    ->where('products.is_publish', 1)
                    ->orderBy('related_products.id', 'desc')
                    ->paginate(20);
            }

            return view('backend.partials.related_products_table', compact('relateddatalist'))->render();
        }
    }

    //Save data for Related Products
    public function saveRelatedProductsData(Request $request)
    {
        $res = array();

        $product_id = $request->input('product_id');
        $related_item_id = $request->input('related_item_id');

        $data = array(
            'product_id' => $product_id,
            'related_item_id' => $related_item_id
        );

        $response = Related_product::create($data);
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('New Data Added Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data insert failed');
        }

        return response()->json($res);
    }

    //Delete data for Related Product
    public function deleteRelatedProduct(Request $request)
    {
        $res = array();

        $id = $request->id;

        $response = Related_product::where('id', $id)->delete();
        if ($response) {
            $res['msgType'] = 'success';
            $res['msg'] = __('Data Removed Successfully');
        } else {
            $res['msgType'] = 'error';
            $res['msg'] = __('Data remove failed');
        }

        return response()->json($res);
    }
}

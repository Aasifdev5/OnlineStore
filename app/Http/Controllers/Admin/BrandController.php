<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CategoryRequest;
use App\Models\Brand;
use App\Models\Category;
use App\Models\User;
use App\Tools\Repositories\Crud;
use App\Traits\General;
use App\Traits\ImageSaveTrait;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class BrandController extends Controller
{
    use  ImageSaveTrait, General;

    protected $model;
    public function __construct(Brand $brand)
    {
        $this->model = new Crud($brand);
    }
    public function index()
    {
        if (Session::has('LoggedIn')) {


            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();

            $data['title'] = 'Manage Brands';
            $data['categories'] = $this->model->getOrderById('DESC', 25);
            return view('admin.brands.index', $data);
        }
    }

    public function create()
    {

        if (Session::has('LoggedIn')) {


            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();
            $data['title'] = 'Add Brands';
            return view('admin.brands.create', $data);
        }
    }

    public function store(Request $request)
    {
        if ($request->hasFile('image')) {

            // Handle new image upload
            $attribute = $request->file('image');
            $destination = 'category';

            // Generate unique filename
            $file_name = time() . '-' . Str::random(10) . '.' . $attribute->getClientOriginalExtension();
            // Move uploaded file to the destination directory
            $attribute->move(public_path('uploads/' . $destination), $file_name);
            // Update image path
            $image = 'uploads/' . $destination . '/' . $file_name;
        }

        $data = [
            'name' => $request->name,
            'is_feature' => $request->has('is_feature') ? 'yes' : 'no',

            'image' => $image,

        ];



        $this->model->create($data); // create new category
        return response()->json(['success' => true]);
    }

    public function edit($id)
    {

        if (Session::has('LoggedIn')) {
            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();
            $data['title'] = 'Edit Brands';
            $data['category'] = $this->model->getRecordByid($id);
            return view('admin.brands.edit', $data);
        }
    }

    public function update(Request $request, $id)
    {
        // Validate request data
        $this->validate($request, [
            'name' => 'required|string|max:255', // Replace with appropriate validation rules
        ]);

        $category = $this->model->getRecordByid($id);

        if (!$category) {
            return response()->json(['success' => false, 'message' => 'Category not found.'], 404);
        }

        // Update category data with sanitized input
        $category->name = $request->get('name'); // Use get() for better security
        $category->save();

        return response()->json(['success' => true, 'message' => 'Category updated successfully.']);
    }

    public function delete($id)
    {
        $category = Brand::where('id', $id)->first();

        if (!$category) {
            return response()->json(['success' => false, 'message' => 'brand not found.'], 404);
        }

        $category->delete();

        return response()->json(['success' => true]);
    }
}

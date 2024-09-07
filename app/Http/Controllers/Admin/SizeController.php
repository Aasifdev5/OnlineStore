<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CategoryRequest;
use App\Models\Size;
use App\Models\Category;
use App\Models\User;
use App\Tools\Repositories\Crud;
use App\Traits\General;
use App\Traits\ImageSaveTrait;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class SizeController extends Controller
{
    use  ImageSaveTrait, General;

    protected $model;
    public function __construct(Size $size)
    {
        $this->model = new Crud($size);
    }
    public function index()
    {
        if (Session::has('LoggedIn')) {


            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();

            $data['title'] = 'Manage Sizes';
            $data['categories'] = $this->model->getOrderById('DESC', 25);
            return view('admin.size.index', $data);
        }
    }

    public function create()
    {

        if (Session::has('LoggedIn')) {


            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();
            $data['title'] = 'Add Size';
            return view('admin.size.create', $data);
        }
    }

    public function store(Request $request)
    {


        $data = [
            'name' => $request->name,


        ];

        $this->model->create($data); // create new category
        return redirect()->route('size.index');
    }

    public function edit($id)
    {

        if (Session::has('LoggedIn')) {
            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();
            $data['title'] = 'Edit Size';
            $data['category'] = $this->model->getRecordByid($id);
            return view('admin.size.edit', $data);
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
            return response()->json(['success' => false, 'message' => 'size not found.'], 404);
        }

        // Update category data with sanitized input
        $category->name = $request->get('name'); // Use get() for better security
        $category->save();

        return response()->json(['success' => true, 'message' => 'size updated successfully.']);
    }

    public function delete($id)
    {
        $category = Size::where('id', $id)->first();

        if (!$category) {
            return response()->json(['success' => false, 'message' => 'size not found.'], 404);
        }

        $category->delete();

        return response()->json(['success' => true]);
    }
}

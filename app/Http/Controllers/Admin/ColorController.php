<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CategoryRequest;
use App\Models\Color;
use App\Models\Category;
use App\Models\User;
use App\Tools\Repositories\Crud;
use App\Traits\General;
use App\Traits\ImageSaveTrait;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class ColorController extends Controller
{
    use  ImageSaveTrait, General;

    protected $model;
    public function __construct(Color $color)
    {
        $this->model = new Crud($color);
    }
    public function index()
    {
        if (Session::has('LoggedIn')) {


            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();

            $data['title'] = 'Manage Colors';
            $data['categories'] = $this->model->getOrderById('DESC', 25);
            return view('admin.colors.index', $data);
        }
    }

    public function create()
    {

        if (Session::has('LoggedIn')) {


            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();
            $data['title'] = 'Add Color';
            return view('admin.colors.create', $data);
        }
    }

    public function store(Request $request)
    {


        $data = [
            'name' => $request->name,


        ];

        $this->model->create($data); // create new category
        return redirect()->route('colors.index');
    }

    public function edit($id)
    {

        if (Session::has('LoggedIn')) {
            $data['user_session'] = User::where('id', Session::get('LoggedIn'))->first();
            $data['title'] = 'Edit Color';
            $data['category'] = $this->model->getRecordByid($id);
            return view('admin.colors.edit', $data);
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
            return response()->json(['success' => false, 'message' => 'color not found.'], 404);
        }

        // Update category data with sanitized input
        $category->name = $request->get('name'); // Use get() for better security
        $category->save();

        return response()->json(['success' => true, 'message' => 'color updated successfully.']);
    }

    public function delete($id)
    {
        $category = Color::where('id', $id)->first();

        if (!$category) {
            return response()->json(['success' => false, 'message' => 'color not found.'], 404);
        }

        $category->delete();

        return response()->json(['success' => true]);
    }
}

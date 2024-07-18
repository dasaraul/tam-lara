<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    private $product;

    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    public function getProduct()
    {
        try {
            $products = $this->product->getProduct();
            if (isset($products) && !empty($products)) {
                return view('dashboard')->with(['products' => $products]);
            }
            return view('dashboard')->with(['products' => []]); // Jika tidak ada produk, lewatkan array kosong atau sesuaikan dengan logika Anda
        } catch (\Exception $ex) {
            Log::error('ProductController', ['getProduct' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }

    public function deleteProduct($id)
    {
        try {
            if (!$id) {
                return redirect()->back()->withErrors(['error' => "Id Is Required"]);
            }
            $result = $this->product->deleteProduct($id);
            if ($result) {
                return redirect()->back()->with(['status' => true, 'message' => 'Delete Success']);
            }
            return redirect()->back()->with(['status' => false, 'message' => 'Delete failed']);
        } catch (\Exception $ex) {
            Log::error('ProductController', ['deleteProduct' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }

    public function addProduct()
    {
        try {
            return view('product_add');
        } catch (\Exception $ex) {
            Log::error('ProductController', ['addProduct' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }

    public function addNewProduct(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'category' => 'required',
                'price' => 'required',
                'quantity' => 'required',
            ]);
            if ($validator->fails()) {
                $error = $validator->errors()->first();
                return redirect()->back()->withErrors(['error' => $error]);
            }
            $result = $this->product->addProduct($request->name, $request->category, $request->price, $request->quantity);
            if ($result) {
                return redirect('/dashboard');
            }
            return redirect()->back()->with(['status' => false, 'message' => 'Add Failed']);
        } catch (\Exception $ex) {
            Log::error('ProductController', ['addNewProduct' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }
}

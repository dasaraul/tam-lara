<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class DashboardController extends Controller
{
    public function index()
    {
        try {
            $users = User::all();
            $products = Product::all();
            return view('dashboard', compact('users', 'products'));
        } catch (\Exception $ex) {
            Log::error('DashboardController', ['index' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }

    public function profile()
    {
        try {
            $email_id = Auth::user()->email;
            $user = User::where('email', $email_id)->first();
            if ($user) {
                return view('profile', ['data' => $user]);
            }
        } catch (\Exception $ex) {
            Log::error('DashboardController', ['profile' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }

    public function profileUpdate(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'full_name' => 'required',
                'location' => 'required',
                'gender' => 'required',
            ]);

            if ($validator->fails()) {
                $error = $validator->errors()->first();
                return redirect()->back()->withErrors(['error' => $error]);
            }

            $email_id = Auth::user()->email;
            $user = User::where('email', $email_id)->first();

            if ($user) {
                $user->full_name = $request->full_name;
                $user->location = $request->location;
                $user->gender = $request->gender;
                $user->save();

                return redirect()->back()->with(['status' => true, 'message' => 'Update Success']);
            }

            return redirect()->back()->with(['status' => false, 'message' => 'User not found']);
        } catch (\Exception $ex) {
            Log::error('DashboardController', ['profileUpdate' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }

    // Metode untuk menghapus pengguna
    public function deleteUser($id)
    {
        try {
            $user = User::find($id);

            if (!$user) {
                return redirect()->back()->with(['status' => false, 'message' => 'User not found']);
            }

            $user->delete();

            return redirect()->back()->with(['status' => true, 'message' => 'User deleted successfully']);
        } catch (\Exception $ex) {
            Log::error('DashboardController', ['deleteUser' => $ex->getMessage(), 'line' => $ex->getLine()]);
            return view('error.500');
        }
    }
}


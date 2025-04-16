<?php
namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Laravel\Passport\HasApiTokens;


class UserController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'     => 'required|string|max:255',
            'email'    => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // Tạo token cho user sau khi đăng ký
        $tokenResult = $user->createToken('Personal Access Token');
        return response()->json([
            'token_type'   => 'Bearer',
            'access_token' => $tokenResult->accessToken,
            'user'         => $user,
        ]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required|email',
            'password' => 'required'
        ]);

        $response = Http::asForm()->post(config('services.passport.login_endpoint'), [
            'grant_type' => 'password',
            'client_id' => config('services.passport.client_id'),
            'client_secret' => config('services.passport.client_secret'),
            'username' => $request->username,
            'password' => $request->password,
            'scope' => '',
        ]);

        if ($response->successful()) {
            return response()->json($response->json(), 200);
        }

        return response()->json([
            'message' => 'Login failed',
            'details' => $response->json()
        ], $response->status());
    }

    public function me(Request $request)
    {
        return response()->json($request->user());
    }
}

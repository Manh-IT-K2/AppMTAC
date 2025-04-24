<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Laravel\Passport\HasApiTokens;
use Nyholm\Psr7\Factory\Psr17Factory;
use Laravel\Passport\Http\Controllers\AccessTokenController;

class UserController extends Controller
{
    // API function register
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

        return response()->json([
            'message' => 'Đăng ký thành công',
            'user'    => $user,
        ], 200);
    }

    // API function login
    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email',
                'password' => 'required'
            ]);

            // Create fake request to call internal AccessTokenController
            $serverRequest = (new Psr17Factory)->createServerRequest('POST', '/oauth/token')
                ->withParsedBody([
                    'grant_type' => 'password',
                    'client_id' => config('services.passport.client_id'),
                    'client_secret' => config('services.passport.client_secret'),
                    'username' => $request->email,
                    'password' => $request->password,
                    'scope' => '',
                ]);

            $tokenController = app()->make(AccessTokenController::class);
            $response = $tokenController->issueToken($serverRequest);

            // get content body
            $body = $response->getContent();
            $data = json_decode($body, true);

            return response()->json([
                'message' => 'Login success',
                'details' => $data
            ], $response->getStatusCode());
        } catch (\Exception $e) {
            Log::error('Exception in login', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'message' => 'Server Error',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API refresh token
    public function refreshToken(Request $request)
    {
        $refreshToken = $request->input('refresh_token');

        $serverRequest = (new Psr17Factory)->createServerRequest('POST', '/oauth/token')
            ->withParsedBody(
                [
                    'grant_type' => 'refresh_token',
                    'refresh_token' => $refreshToken,
                    'client_id' => env('PASSPORT_CLIENT_ID'),
                    'client_secret' => env('PASSPORT_CLIENT_SECRET'),
                    'scope' => '',
                ]
            );
        $tokenController = app()->make(AccessTokenController::class);
        $response = $tokenController->issueToken($serverRequest);

        // get content body
        $body = $response->getContent();
        $data = json_decode($body, true);
        
        if ($response->getStatusCode() === 200) {
            return response()->json($data);
        } else {
            return response()->json(['error' => 'Refresh token failed'], 400);
        }
        
    }

    //
    public function me(Request $request)
    {
        return response()->json($request->user());
    }

    // API function logout
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();

        return response()->json(['message' => 'Đăng xuất thành công']);
    }
}

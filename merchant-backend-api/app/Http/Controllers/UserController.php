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

    // API function to validate email format
    public function validateEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email'    => 'required|email|unique:users,email',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'is_valid' => false,
                'message' => 'Email không hợp lệ'
            ], 404);
        }

        return response()->json([
            'is_valid' => true,
            'message' => 'Email hợp lệ'
        ], 200);
    }

    // check password is strong
    private function isStrongPassword($password)
    {
        if (strlen($password) < 8) {
            return false;
        }

        if (!preg_match('/[A-Z]/', $password)) {
            return false;
        }

        if (!preg_match('/[a-z]/', $password)) {
            return false;
        }

        if (!preg_match('/[0-9]/', $password)) {
            return false;
        }

        if (!preg_match('/[\W]/', $password)) {
            return false;
        }

        $commonPasswords = [
            '123456',
            'password',
            '12345678',
            'qwerty',
            '123456789',
            '12345',
            '1234',
            '111111',
            '1234567',
            'dragon'
        ];
        if (in_array(strtolower($password), $commonPasswords)) {
            return false;
        }

        return true;
    }

    // API check password validate
    public function validatePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'is_strong' => false,
                'message' => 'Password phải có ít nhất 8 ký tự.'
            ], 422);
        }

        $password = $request->password;

        if (!$this->isStrongPassword($password)) {
            return response()->json([
                'is_strong' => false,
                'message' => 'Password phải chứa chữ hoa, chữ thường, số, ký tự đặc biệt và không quá đơn giản.'
            ], 422);
        }

        return response()->json([
            'is_strong' => true,
            'message' => 'Password đủ mạnh.'
        ], 200);
    }
}

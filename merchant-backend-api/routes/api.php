<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\ScheduleCollectionController;

Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::get('/me', [UserController::class, 'me']);
    Route::get('/schedule-today', [ScheduleCollectionController::class, 'index']);
});

Route::post('/logout', [UserController::class, 'logout'])->middleware('auth:api');

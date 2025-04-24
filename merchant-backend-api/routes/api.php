<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ScheduleCollectionController;

// register
Route::post('/register', [UserController::class, 'register']);

//login
Route::post('/login', [UserController::class, 'login']);

// refresh token
Route::post('/refresh-token', [UserController::class, 'refreshToken']);

// protect route
Route::middleware('auth:api')->group(function () {
    Route::get('/me', [UserController::class, 'me']);
    Route::post('/logout', [UserController::class, 'logout']);
    Route::get('/schedule-today', [ScheduleCollectionController::class, 'getScheduleCollectionToday']);
    Route::get('/schedule-arranged', [ScheduleCollectionController::class, 'getScheduleCollectionArranged']);
    Route::get('/schedule-notyet', [ScheduleCollectionController::class, 'getScheduleCollectionNotYet']);
    Route::delete('/schedule/{id}', [ScheduleCollectionController::class, 'deleteScheduleCollection']);

});

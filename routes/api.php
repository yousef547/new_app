<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\shipmentsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::group(['middleware' => ['api.auth', 'authUser']], function () {
    // Route::post('/home', [AuthController::class, 'home']);
    Route::post('/setShipments',[shipmentsController::class, 'setShipments']);
    Route::get('/getShipments',[shipmentsController::class, 'getShipments']);
    Route::post('/logout', [AuthController::class, 'logout']);
});


Route::post('/registerAdmin', [AuthController::class, 'registerAdmin']);
Route::group(['middleware' => ['api.auth', 'authAdmin']], function () {
    Route::post('/logoutAdmin', [AuthController::class, 'logout']);
});


Route::post('/registerDriver', [AuthController::class, 'registerDriver']);
Route::group(['middleware' => ['api.auth', 'authDriver']], function () {
    Route::get('/getAllShipments',[shipmentsController::class, "getAllShipments"]);
    Route::post('/logoutDriver', [AuthController::class, 'logout']);
});



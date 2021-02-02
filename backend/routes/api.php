<?php

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['namespace' => 'Api'], function () {

    Route::group(['namespace' => 'Auth'], function () {
        Route::post('register', 'RegisterController');
        Route::post('login', 'LoginController');
        Route::post('logout', 'LogoutController')->middleware('auth:api');
    });

    Route::group(['namespace' => 'Order'], function () {
        Route::middleware(['auth:api'])->group( function () {
            Route::get('orders', 'OrderController@index');
            Route::put('orders', 'OrderController@update');
            Route::patch('orders/{id}', 'OrderController@patch');
        });
    });

    Route::group(['namespace' => 'Contact'], function () {
        Route::get('communications', 'CommunicationController@index');

        Route::get('contacts', 'ContactController@index')->middleware('auth:api');
        Route::put('contacts', 'ContactController@update')->middleware('auth:api');
    });

});

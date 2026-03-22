<?php

use App\Http\Controllers\PingController;
use Illuminate\Support\Facades\Route;

Route::get('/', fn () => response()->json(['status' => 'ok']));
Route::get('/ping', [PingController::class, 'index']);

Route::get('/home', function () {
    return view('welcome');
});

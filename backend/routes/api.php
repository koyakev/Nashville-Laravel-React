<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SongController;

Route::get('/get_songs', [SongController::class, 'get_songs']);

Route::get('/get_song/{id}', [SongController::class, 'get_song']);

Route::get('/get_keys', [SongController::class, 'get_keys']);

Route::get('/get_family/{id}', [SongController::class, 'get_family']);
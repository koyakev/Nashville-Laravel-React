<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SongController;

Route::get('/get_songs', [SongController::class, 'get_songs']);
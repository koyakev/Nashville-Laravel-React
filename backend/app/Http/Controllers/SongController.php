<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Song;
use App\Models\Key;

class SongController extends Controller
{
    public function get_songs() {
        $songs = Song::all();
        return json_encode($songs);
    }

    public function get_song($id) {
        $song = Song::find($id);
        return json_encode($song);
    }

    public function get_keys() {
        $keys = Key::all();
        return json_encode($keys);
    }

    public function get_family($id) {
        $family = Key::find($id);
        return json_encode($family);
    }
}

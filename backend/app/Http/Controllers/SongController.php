<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Song;
use App\Models\Key;
use App\Models\Setlist;

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

    public function upcoming_sets() {
        $upcoming_sets = Setlist::upcoming_sets();
        return json_encode($upcoming_sets);
    }

    public function set($id) {
        $set = Setlist::set($id);
        return json_encode($set);
    }
}

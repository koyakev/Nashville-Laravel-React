<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setlist extends Model
{
    protected $fillable = ['songleader', 'songlist', 'date'];

    public static function upcoming_sets() {
        $data = Setlist::orderBy('date', 'desc')->get();

        return $data;
    }

    public static function set($id) {
        $data = Setlist::find($id);

        return $data;
    }
}

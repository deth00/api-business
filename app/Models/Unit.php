<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;
    protected $table = 'unit';
    protected $fillable = ['id','name','branch_id','del'];

    public function brname()
    {
        return $this->belongsTo('App\Models\Branch', 'branch_id', 'id');
    }
}

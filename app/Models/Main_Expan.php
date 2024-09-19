<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Main_Expan extends Model
{
    use HasFactory;
    protected $table = 'main_list_expan';
    protected $fillable = ['id','name','del'];
}

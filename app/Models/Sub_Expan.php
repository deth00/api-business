<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sub_Expan extends Model
{
    use HasFactory;
    protected $table = 'sub_list_expan';
    protected $fillable = ['id','name','del'];
}

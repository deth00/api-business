<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Main_Income extends Model
{
    use HasFactory;
    protected $table = 'main_list_income';
    protected $fillable = ['id','name','del'];
}

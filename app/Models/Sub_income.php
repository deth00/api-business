<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sub_Income extends Model
{
    use HasFactory;
    protected $table = 'sub_list_income';
    protected $fillable = ['id','name','main_id','del'];

    public function mainname()
    {
        return $this->belongsTo('App\Models\Main_Income', 'main_id', 'id');
    }
}

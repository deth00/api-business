<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report_income extends Model
{
    use HasFactory;
    protected $table = 'report_income';
    protected $fillable = ['id','plan_old','practice_old','plan_new','practice_new','main_id','sub_id','del'];
}

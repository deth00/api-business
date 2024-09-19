<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use App\Models\Department;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
    public function department()
    {
        return response([
            'data' => Department::where('del',1)->get()
        ],200);
    }
    public function create(Request $request)
    {
        $check = Department::where('name',$request->name)->first();
        if (empty($check->name)) {
            $dep = new Department();
            $dep->branch_id = $request->branch_id;
            $dep->name = $request->name;
            $dep->del = 1;
            $dep->save();
            return response()->json(['message'=>'ບັກທືກຂໍ້ມູນສຳເລັດ'],200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ສິດນີ້ມີແລ້ວ',
            ],401);
        }   
    }

    public function update(Request $request)
    {
        $dep = Department::find($request->id);
        $dep->branch_id = $request->branch_id;
        $dep->name = $request->name;
        $dep->del = 1;
        $dep->update();
        return response()->json(['message' => "ແກ້ໄຂຂໍ້ມູນສຳເລັດ"],200);
    }

    public function delete(Request $request)
    {
        $dep = Department::find($request->id);
        $dep->del = 0;
        $dep->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"],200);
    }
}

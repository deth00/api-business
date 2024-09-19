<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use App\Models\Sector;
use Illuminate\Http\Request;

class SectorController extends Controller
{
    public function sector()
    {
        return response([
            'data' => Sector::where('del',1)->get()
        ],200);
    }
    public function create(Request $request)
    {
        $check = Sector::where('name',$request->name)->first();
        if (empty($check->name)) {
            $sec = new Sector();
            $sec->branch_id = $request->branch_id;
            $sec->department_id = $request->department_id;
            $sec->name = $request->name;
            $sec->del = 1;
            $sec->save();
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
        $sec = Sector::find($request->id);
        $sec->branch_id = $request->branch_id;
        $sec->department_id = $request->department_id;
        $sec->name = $request->name;
        $sec->del = 1;
        $sec->update();
        return response()->json(['message' => "ແກ້ໄຂຂໍ້ມູນສຳເລັດ"],200);
    }

    public function delete(Request $request)
    {
        $sec = Sector::find($request->id);
        $sec->del = 0;
        $sec->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"],200);
    }
}

<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use App\Models\Year;
use Illuminate\Http\Request;

class YearController extends Controller
{
    public function index()
    {
        return response([
            'data' => Year::where('del', 1)->get()
        ], 200);
    }

    public function create(Request $request)
    {
        $check = Year::where('name', $request->name)->first();
        if (empty($check)) {
            $roles = new Year();
            $roles->name = $request->name;
            $roles->del = 1;
            $roles->save();
            return response()->json(['message' => 'ບັກທືກຂໍ້ມູນສຳເລັດ'], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ຂໍ້ມູນນີ້ມີແລ້ວ',
            ], 401);
        }
    }

    public function delete(Request $request)
    {
        $role = Year::find($request->id);
        $role->del = 0;
        $role->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"], 200);
    }
}

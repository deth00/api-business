<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;

class RoleController extends Controller
{

    public function role()
    {
        return response([
            'data' => Role::whereIn('del',[1,2])->get()
        ],200);
    }

    public function create(Request $request)
    {
        $check = Role::where('name',$request->name)->first();
        if (empty($check->name)) {
            $roles = new Role();
            $roles->name = $request->name;
            $roles->del = $request->del;
            $roles->save();
        return response()->json([
            'status' => true,
            'message' => "ເພິ່ມຂໍ້ມູນສຳເລັດ",
        ],200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ສິດນີ້ມີແລ້ວ',
            ],401);
        }   
    }

    public function update(Request $request)
    {
        $role = Role::find($request->id);
        $role->name = $request->name;
        $role->del = $request->del;
        $role->update();
        return response()->json(['message' => "ແກ້ໄຂຂໍ້ມູນສຳເລັດ"],200);
    }

    public function delete(Request $request)
    {
        $role = Role::find($request->id);
        $role->del = 0;
        $role->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"],200);
    }
}

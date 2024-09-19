<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use App\Http\Resources\UnitResource;
use App\Models\Branch;
use App\Models\Unit;
use Illuminate\Http\Request;

class BranchController extends Controller
{
    public function branch()
    {
        return response([
            'data' => Branch::where('del', 1)->get()
        ], 200);
    }

    public function create(Request $request)
    {
        $check = Branch::where('name', $request->name)->first();
        if (empty($check->name)) {
            $roles = new Branch();
            $roles->name = $request->name;
            $roles->del = 1;
            $roles->save();
            return response()->json(['status' => true, 'message' => 'ບັກທືກຂໍ້ມູນສຳເລັດ'], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ສິດນີ້ມີແລ້ວ',
            ], 401);
        }
    }

    public function update(Request $request)
    {
        $role = Branch::find($request->id);
        $role->name = $request->name;
        $role->del = 1;
        $role->update();
        return response()->json(['message' => "ແກ້ໄຂຂໍ້ມູນສຳເລັດ"], 200);
    }

    public function delete(Request $request)
    {
        $role = Branch::find($request->id);
        $role->del = 0;
        $role->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"], 200);
    }

    public function unit()
    {
        return response([
            'data' => UnitResource::collection(Unit::where('del', 1)->get())
        ], 200);
    }

    public function cre_unit(Request $request)
    {
        $check = Unit::where('name', $request->name)->where('branch_id', $request->br_id)->first();
        if (empty($check->name)) {
            $unit = new Unit();
            $unit->name = $request->name;
            $unit->branch_id = $request->br_id;
            $unit->del = 1;
            $unit->save();
            return response()->json(['status' => true, 'message' => 'ບັກທືກຂໍ້ມູນສຳເລັດ'], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ໜ່ວຍນີ້ມີໃນລະບົບແລ້ວ',
            ], 401);
        }
    }

    public function edit_unit(Request $request)
    {
        $unit = Unit::find($request->id);
        $unit->name = $request->name;
        $unit->branch_id = $request->br_id;
        $unit->del = 1;
        $unit->update();
        return response()->json(['message' => "ແກ້ໄຂຂໍ້ມູນສຳເລັດ"], 200);
    }

    public function del_unit(Request $request)
    {
        $unit = Unit::find($request->id);
        $unit->name = $request->name;
        $unit->branch_id = $request->br_id;
        $unit->del = 0;
        $unit->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"], 200);
    }

    public function Unit_By_id($id)
    {
        return response([
            'data' => UnitResource::collection(Unit::where('branch_id', $id)->get())
        ], 200);
    }
    public function unit_by_name($name)
    {
        return response([
            'data' => UnitResource::collection(Unit::where('name', 'like', '%' . $name . '%')->get())
        ], 200);
    }
    public function unit_by_n_b($name, $id)
    {
        return response([
            'data' => UnitResource::collection(Unit::where('name', 'like', '%' . $name . '%')->orwhere('branch_id', $id)->get())
        ], 200);
    }
}

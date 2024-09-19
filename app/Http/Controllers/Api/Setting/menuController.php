<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use App\Http\Resources\IncomeSubResource;
use App\Models\Main_Expan;
use App\Models\Main_Income;
use App\Models\Sub_Expan;
use App\Models\Sub_Income;
use Illuminate\Http\Request;

class menuController extends Controller
{
    public function income()
    {
        return response([
            'data' => Main_Income::where('del', 1)->get()
        ], 200);
    }

    public function creat_main_income(Request $request)
    {
        $check = Main_Income::where('name', $request->name)->first();
        if (empty($check)) {
            $main = new Main_Income();
            $main->name = $request->name;
            $main->del = 1;
            $main->save();
            return response()->json([
                'status' => 'true',
                'message' => 'ເພີ່ມຂໍ້ມູນສຳເລັດ'
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ຂໍ້ມູນນີ້ມີແລ້ວ',
            ], 401);
        }
    }

    public function update_income(Request $request)
    {
        $main = Main_Income::find($request->id);
        $main->name = $request->name;
        $main->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ແກ້ໄຂຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function delete_income(Request $request)
    {
        $main = Main_Income::find($request->id);
        $main->del = 0;
        $main->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ລົບຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function sub_income()
    {
        return response([
            'data' => IncomeSubResource::collection(Sub_Income::where('del', 1)->get())
        ]);
    }

    public function sub_by_id($ids)
    {
        return response([
            'data' => IncomeSubResource::collection(Sub_Income::where('main_id', $ids)->get())
        ]);
    }

    public function sub_income_create(Request $request)
    {
        $check = Sub_Income::where('name', $request->name)->first();
        if (empty($check)) {
            $sub = new Sub_Income();
            $sub->name = $request->name;
            $sub->main_id = $request->main_id;
            $sub->del = 1;
            $sub->save();
            return response()->json([
                'status' => 'true',
                'message' => 'ເພີ່ມຂໍ້ມູນສຳເລັດ'
            ], 200);
        } else {
            return response()->json([
                'status' => 'false',
                'message' => 'ເພີ່ມຂໍ້ມູນບໍ່ສຳເລັດ'
            ]);
        }
    }

    public function sub_income_update(Request $request)
    {
        $sub = Sub_Income::find($request->id);
        $sub->name = $request->name;
        $sub->main_id = $request->main_id;
        $sub->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ແກ້ໄຂຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function sub_income_delete(Request $request)
    {
        $sub = Sub_Income::find($request->id);
        $sub->del = 0;
        $sub->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ລົບຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function expan()
    {
        return response([
            'data' => Main_Expan::where('del', 1)->get()
        ], 200);
    }

    public function create_main_expan(Request $request)
    {
        $check = Main_Expan::where('name', $request->name)->first();
        if (empty($check)) {
            $expan = new Main_Expan();
            $expan->name = $request->name;
            $expan->del = 1;
            $expan->save();
            return response()->json([
                'status' => 'true',
                'message' => 'ບັນທຶກຂໍ້ມູນສຳເລັດ'
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ຂໍ້ມູນນີ້ມີແລ້ວ',
            ], 401);
        }
    }

    public function update_expan(Request $request)
    {
        $main = Main_Expan::find($request->id);
        $main->name = $request->name;
        $main->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ແກ້ໄຂຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function delete_expan(Request $request)
    {
        $main = Main_Expan::find($request->id);
        $main->del = 0;
        $main->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ລົບຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function sub_expan()
    {
        return response([
            'data' => Sub_Expan::where('del', 1)->get()
        ], 200);
    }

    public function sub_expan_create(Request $request)
    {
        $check = Sub_Expan::where('name', $request->name)->first();
        if (empty($check)) {
            $sub = new Sub_Expan();
            $sub->name = $request->name;
            $sub->del = 1;
            $sub->save();
            return response()->json([
                'status' => 'true',
                'message' => 'ບັນທຶກຂໍ້ມູນສຳເລັດ'
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'ຂໍ້ມູນນີ້ມີແລ້ວ',
            ], 401);
        }
        
    }

    public function sub_expan_update(Request $request)
    {
        $sub = Sub_Expan::find($request->id);
        $sub->name = $request->name;
        $sub->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ແກ້ໄຂຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

    public function sub_expan_delete(Request $request)
    {
        $sub = Sub_Expan::find($request->id);
        $sub->del = 0;
        $sub->update();
        return response()->json([
            'status' => 'true',
            'message' => 'ລົບຂໍ້ມູນສຳເລັດ'
        ], 200);
    }

}

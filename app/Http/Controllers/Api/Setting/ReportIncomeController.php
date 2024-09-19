<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use App\Models\Report_income;
use Illuminate\Http\Request;

class ReportIncomeController extends Controller
{
    public function report()
    {
        return response([
            'data' => Report_income::where('del', 1)->get()
        ], 200);
    }

    public function create_report_income(Request $request)
    {
        // if($request->isMethod('post'))
        // {
            $data = $request->input();
            foreach ($data['data'] as $key => $item) {
                $res = new Report_income();
                $res->plan_old = $item['plan_old'];
                $res->practice_old = $item['practice_old'];
                $res->plan_new = $item['plan_new'];
                $res->practice_new = $item['practice_new'];
                $res->main_id = $item['main_id'];
                $res->sub_id = $item['sub_id'];
                $res->save();
            }
        // }


        return response()->json([
            'status' => 'true',
            'message' => 'ເພີ່ມຂໍ້ມູນສຳເລັດ'
        ], 200);
    }
}

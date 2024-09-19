<?php

namespace App\Http\Controllers\Api\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Http\Resources\UserResource;

class UserController extends Controller
{
    public function apiUser()
    {
        $users = User::where('del',1)->get();
        return response()->json([
            'data' => UserResource::collection($users)
            // 'data' => User::select('name','phone','email')->where('del',1)->get()
        ],200);
    }

    public function register(Request $request)
    {
        try {
            $validate = Validator::make($request->all(),
            [
                'name' => 'required',
                'phone' => 'required|numeric',
                'email' => 'required',
                'password' => 'required|min:6',
                'branch_id' => 'required',
                'unit_id' => 'required',
                'role_id' => 'required'
            ]);
            if ($validate->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'validate error',
                    'error' => $validate->errors()
                ],400);   
            }
            $check = User::where('phone', $request->phone)->first();
            if (empty($check)) {
                $user = User::create([
                    'name' => $request->name,
                    'phone' => $request->phone,
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'branch_id' => $request->branch_id,
                    'unit_id' => $request->unit_id,
                    'role_id' => $request->role_id,
                ]); 
                return response()->json([
                    'status' => true,
                    'message' => "ເພິ່ມຂໍ້ມູນສຳເລັດ",
                    'token' => $user->createToken('API TOKEN')->plainTextToken
                ],200);
            }else{
                return response()->json([
                    'status' => false,
                    'message' => 'ເບີໂທລະສັບມີແລ້ວ',
                ],401);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage(),
            ],500);
        }
    }

    public function login(Request $request)
    {
        try {
            $validate = Validator::make($request->all(),
            [
                'phone' => 'required',
                'password' => 'required',
            ]);
            if ($validate->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'validate error',
                    'error' => $validate->errors()
                ],401);
            }
            if(!Auth::attempt($request->only(['phone', 'password'])))
            {
                return response()->json([
                    'status' => false,
                    'message' => 'phone & password dose not match with our record.',
                ],401);               
            }
            $user = User::where('phone', $request->phone)->where('del',1)->first();
            return response()->json([
                'status' => true,
                'message' => 'User Logged In successfullty',
                'token' => $user->createToken('API TOKEN')->plainTextToken
            ],200);            
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage(),
            ],500);
        }
    }

    public function edit(Request $request)
    {
        $user = User::find($request->id);
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->email = $request->email;
        $user->branch_id = $request->branch_id;
        $user->role_id = $request->role_id;
        $user->update();
        return response()->json(['message' => "ແກ້ໄຂຂໍ້ມູນສຳເລັດ"], 200);
    }

    public function delete(Request $request)
    {
        $user = User::find($request->id);
        $user->del = 0;
        $user->update();
        return response()->json(['message' => "ລົບຂໍ້ມູນສຳເລັດ"],200);
    }
}

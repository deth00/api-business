<?php

use App\Http\Controllers\Api\Setting\BranchController;
use App\Http\Controllers\Api\Setting\DepartmentController;
use App\Http\Controllers\Api\Setting\menuController;
use App\Http\Controllers\Api\Setting\ReportIncomeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Setting\UserController;
use App\Http\Controllers\Api\Setting\RoleController;
use App\Http\Controllers\Api\Setting\SectorController;
use App\Http\Controllers\Api\Setting\YearController;
use App\Models\Branch;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');
Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);
Route::post('/edit/user',[UserController::class,'edit']);
Route::get('/apiuser',[UserController::class, 'apiUser']);

Route::get('/role', [RoleController::class, 'role']);
Route::post('/role/create', [RoleController::class, 'create']);
Route::post('/role/update', [RoleController::class, 'update']);
Route::post('/role/delete', [RoleController::class, 'delete']);

Route::get('/department', [DepartmentController::class, 'department']);
Route::post('/department/create', [DepartmentController::class, 'create']);
Route::post('/department/update', [DepartmentController::class, 'update']);
Route::post('/department/delete', [DepartmentController::class, 'delete']);

Route::get('/sector', [SectorController::class, 'sector']);
Route::post('/sector/create', [SectorController::class, 'create']);
Route::post('/sector/update', [SectorController::class, 'update']);
Route::post('/sector/delete', [SectorController::class, 'delete']);

Route::get('/branch', [BranchController::class, 'branch']);
Route::post('/branch/create', [BranchController::class, 'create']);
Route::post('/branch/update', [BranchController::class, 'update']);
Route::post('/branch/delete', [BranchController::class, 'delete']);

Route::get('/unit', [BranchController::class, 'unit']);
Route::get('/unit/{id}', [BranchController::class, 'Unit_By_id']);
Route::get('/unit/search/{name}', [BranchController::class, 'unit_by_name']);
Route::post('/unit/create', [BranchController::class, 'cre_unit']);
Route::post('/unit/edit', [BranchController::class, 'edit_unit']);
Route::post('/unit/delete', [BranchController::class, 'del_unit']);

Route::get('/year', [YearController::class, 'index']);
Route::post('/year/create', [YearController::class, 'create']);
Route::post('/year/delete', [YearController::class, 'delete']);

Route::get('/income',[menuController::class, 'income']);
Route::post('/income/create',[menuController::class, 'creat_main_income']);
Route::post('/income/update',[menuController::class, 'update_income']);
Route::post('/income/delete',[menuController::class, 'delete_income']);

Route::get('/income/sub', [menuController::class, 'sub_income']);
Route::get('/income/sub/{id}', [menuController::class, 'sub_by_id']);
Route::post('/income/sub/create',[menuController::class, 'sub_income_create']);
Route::post('/income/sub/update',[menuController::class, 'sub_income_update']);
Route::post('/income/sub/delete',[menuController::class, 'sub_income_delete']);

Route::get('/expan',[menuController::class, 'expan']);
Route::post('/expan/create',[menuController::class, 'create_main_expan']);
Route::post('/expan/update',[menuController::class, 'update_expan']);
Route::post('/expan/delete',[menuController::class, 'delete_expan']);

Route::get('/expan/sub',[menuController::class, 'sub_expan']);
Route::post('/expan/sub/create',[menuController::class, 'sub_expan_create']);
Route::post('/expan/sub/update',[menuController::class, 'sub_expan_update']);
Route::post('/expan/sub/delete',[menuController::class, 'sub_expan_delete']);

Route::get('/report/income', [ReportIncomeController::class, 'report']);
Route::post('/report/income/create',[ReportIncomeController::class, 'create_report_income']);


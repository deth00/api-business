<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
          Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('code');
            $table->string('name');
            $table->string('phone')->unique();
            $table->string('email')->nullable();
            $table->string('password');
            $table->string('address')->nullable();
            $table->integer('branch_id')->nullable();
            $table->integer('emp_id')->nullable();
            $table->string('role_id')->default('6');//1 admin; 2 staff; 3 unit; 4 customer
            $table->string('image')->default();
            $table->rememberToken();
            $table->integer('del')->default('1');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};

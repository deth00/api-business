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
        Schema::create('report_income', function (Blueprint $table) {
            $table->id();
            $table->decimal('plan_old');
            $table->decimal('practice_old');
            $table->decimal('plan_new');
            $table->decimal('practice_new');
            $table->integer('main_id');
            $table->integer('sub_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('report_income');
    }
};

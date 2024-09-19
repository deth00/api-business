<?php

use Illuminate\Support\Facades\Route;
use App\Livewire\Admin\Setting\RoldComponent;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', RoldComponent::class)->name('rold');

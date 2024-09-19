<?php

namespace App\Livewire\Admin\Setting;

use App\Models\Branch;
use App\Models\Sector;
use Livewire\Component;
use App\Models\User;

class RoldComponent extends Component
{
    public function render()
    {
        $user = Sector::where('del',1)->get();
        dd($user);
        return view('livewire.admin.setting.rold-component');
    }
}

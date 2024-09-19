<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'phone' => $this->phone,
            'email' => $this->email,
            'adress' => $this->address,
            'branch' =>$this->brname->name,
            'unit' => $this->unname->name,
            'emp' =>$this->name,
            'role' => $this->rolename->name,

        ];
    }
}

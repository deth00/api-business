<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    // protected $table = 'users';

    protected $fillable = [
        'name',
        'phone',
        'email',
        'password',
        'branch_id',
        'unit_id',
        'emp_id',
        'role_id'
    ];

    public function rolename()
    {
        return $this->belongsTo('App\Models\Role', 'role_id', 'id');
    }
    public function brname()
    {
        return $this->belongsTo('App\Models\Branch', 'branch_id', 'id');
    }
    public function emname()
    {
        return $this->belongsTo('App\Models\Department', 'emp_id', 'id');
    }
    public function unname()
    {
        return $this->belongsTo('App\Models\Unit', 'unit_id', 'id');
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}

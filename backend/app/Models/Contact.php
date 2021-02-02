<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    use HasFactory;

    protected $fillable = [
        'order',
        'value',
        'com_type_id',
    ];

    protected $hidden = [
        'com_type_id',
        'user_id',
        'created_at',
        'updated_at',
    ];

    public function type()
    {
        return $this->hasOne(Communication::class, 'id', 'com_type_id');
    }

    public function user() {
        return $this->belongsTo(User::class, 'id', 'user_id');
    }

    public function updateCommTypeID($id) {
        $this->com_type_id = $id;
    }

}

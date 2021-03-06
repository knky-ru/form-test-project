<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory;
    use SoftDeletes;

    public const STATUSES = [
        'NEW' => 'NEW',
        'CAN' => 'CANCELED',
        'PRO' => 'IN PROGRESS',
        'DON' => 'DONE',
    ];

    protected $fillable = [
        'name',
        'status',
    ];

    protected $hidden = [
        'deleted_at',
        'updated_at',
    ];

}

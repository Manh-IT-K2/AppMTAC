<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Cost extends Model
{
    protected $table = 'costs';

    protected $fillable = [
        'schedule_collection_id',
        'category',
        'cost',
        'quantity',
        'total_money',
        'note',
        'status',
    ];

    public function scheduleCollection(): BelongsTo
    {
        return $this->belongsTo(ScheduleCollection::class, 'schedule_collection_id');
    }
}

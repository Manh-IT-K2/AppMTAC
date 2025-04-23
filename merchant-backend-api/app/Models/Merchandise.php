<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Merchandise extends Model
{
    protected $table = 'merchandises';

    protected $fillable = [
        'schedule_collection_id',
        'name_goods',
        'id_goods',
        'total_weight',
        'warehouse',
        'processing_owner',
    ];

    public function scheduleCollection(): BelongsTo
    {
        return $this->belongsTo(ScheduleCollection::class, 'schedule_collection_id');
    }
}

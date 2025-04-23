<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ImageScheduleCollection extends Model
{
    protected $table = 'img_schedule_collection';

    protected $fillable = ['schedule_collection_id', 'image_url'];

    public function schedule(): BelongsTo
    {
        return $this->belongsTo(ScheduleCollection::class, 'schedule_collection_id');
    }
}

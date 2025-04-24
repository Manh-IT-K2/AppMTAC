<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ScheduleCollection extends Model
{
    protected $table = 'schedule_collection';

    protected $fillable = [
        'id',
        'status',
        'collection_id',
        'name_business',
        'address_collection',
        'type_waste',
        'area_transit',
        'number_plate',
        'number_worker',
        'time_collection',
        'contact_person',
        'day_collection',
        'day_send_collection',
        'debt_status',
        'cost_transit',
    ];

    public function images(): HasMany
    {
        return $this->hasMany(ImageScheduleCollection::class, 'schedule_collection_id');
    }

    public function merchandises(): HasMany
    {
        return $this->hasMany(Merchandise::class, 'schedule_collection_id');
    }

    public function costs(): HasMany
    {
        return $this->hasMany(Cost::class, 'schedule_collection_id');
    }
}

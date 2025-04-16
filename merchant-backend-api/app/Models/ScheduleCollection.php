<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ScheduleCollection extends Model
{
    protected $table = 'schedule_collection';

    protected $fillable = [
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

    public function images()
    {
        return $this->hasMany(ImageScheduleCollection::class, 'schedule_collection_id');
    }
}

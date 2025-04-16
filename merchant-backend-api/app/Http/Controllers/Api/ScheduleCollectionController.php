<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ScheduleCollection;

class ScheduleCollectionController extends Controller
{
    public function index()
    {
        $schedules = ScheduleCollection::with('images')->get();

        $data = $schedules->map(function ($item) {
            return [
                'status' => (bool) $item->status,
                'collectionId' => $item->collection_id,
                'nameBusiness' => $item->name_business,
                'addressCollection' => $item->address_collection,
                'typeWaste' => $item->type_waste,
                'areaTransit' => $item->area_transit,
                'numberPlate' => $item->number_plate,
                'numberWorker' => $item->number_worker,
                'timeCollection' => $item->time_collection,
                'contactPerson' => $item->contact_person,
                'dayCollection' => $item->day_collection,
                'daySendCollection' => $item->day_send_collection,
                'debtStatus' => $item->debt_status,
                'costTransit' => $item->cost_transit,
                'image' => $item->images->pluck('image_url')->toArray(),
            ];
        });

        return response()->json([
            'status' => true,
            'data' => $data,
        ]);
    }
}

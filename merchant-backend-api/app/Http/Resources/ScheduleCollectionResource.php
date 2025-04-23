<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ScheduleCollectionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'status' => (bool) $this->status,
            'collectionId' => $this->collection_id,
            'nameBusiness' => $this->name_business,
            'addressCollection' => $this->address_collection,
            'typeWaste' => $this->type_waste,
            'areaTransit' => $this->area_transit,
            'numberPlate' => $this->number_plate,
            'numberWorker' => $this->number_worker,
            'timeCollection' => $this->time_collection,
            'contactPerson' => $this->contact_person,
            'dayCollection' => $this->day_collection,
            'daySendCollection' => $this->day_send_collection,
            'debtStatus' => $this->debt_status,
            'costTransit' => $this->cost_transit,
            'image' => $this->whenLoaded('images', fn () => $this->images->pluck('image_url')->toArray()),
            'merchandises' => $this->whenLoaded('merchandises', function () {
                return $this->merchandises->map(function ($m) {
                    return [
                        'id' => $m->id,
                        'nameGoods' => $m->name_goods,
                        'idGoods' => $m->id_goods,
                        'totalWeight' => $m->total_weight,
                        'warehouse' => $m->warehouse,
                        'processingOwner' => $m->processing_owner,
                    ];
                });
            }),
        ];
    }
}

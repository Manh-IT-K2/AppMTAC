<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ScheduleCollection;
use App\Models\ImageScheduleCollection;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;

class ScheduleCollectionController extends Controller
{

    // API get list ScheduleCollectionToday
    public function getScheduleCollectionToday(): JsonResponse
    {
        try {
            $today = Carbon::today()->toDateString();
            Log::info("Fetching schedule collections for today: " . $today);
            $schedules = ScheduleCollection::whereDate('day_collection', $today)
                ->get();

            if ($schedules->isEmpty()) {
                Log::warning("No schedule collections found for: " . $today);

                return response()->json([
                    'status' => false,
                    'message' => 'No schedule collections found for today.',
                    'date' => $today
                ], 200);
            }

            $data = $schedules->map(function ($item) {
                return [
                    'id' => $item->id,
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
            

            Log::info("Returning " . count($data) . " schedule collections for today.");

            return response()->json([
                'status' => true,
                'message' => "Schedule collection today:  $today",
                'data' => $data,
            ]);
        } catch (\Throwable $th) {
            Log::error('ScheduleCollectionToday: Error while retrieving data.', [
                'message' => $th->getMessage(),
                'trace' => $th->getTraceAsString(),
            ]);

            return response()->json([
                'status' => false,
                'message' => 'An error occured while retrieving the list schedule collection today.',
            ], 500);
        }
    }

    // API get list ScheduleCollectionArranged
    public function getScheduleCollectionArranged(): JsonResponse
    {
        try {
            $schedules = ScheduleCollection::whereNotNull('day_collection')
                ->orderBy('day_collection', 'asc')
                ->get();

            $data = $schedules->map(function ($item) {
                return [
                    'id' => $item->id,
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

            if ($data->isEmpty()) {
                Log::warning('ScheduleCollectionArranged: No schedule collections found.');
            }
            Log::info("Returning " . count($data) . " schedule collections for today.");
            return response()->json([
                'status' => true,
                'message' => 'Schedule collection list sorted by date',
                'data' => $data,
            ]);
        } catch (\Throwable $e) {
            Log::error('ScheduleCollectionArranged: Error while retrieving data.', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'status' => false,
                'message' => 'An occured while retrieving the list schedule collection arranged.',
            ], 500);
        }
    }

    // API get list ScheduleCollectionNotYet
    public function getScheduleCollectionNotYet(): JsonResponse
    {
        try {
            $schedules = ScheduleCollection::with('images')
                ->whereNull('day_collection')
                ->get();

            $data = $schedules->map(function ($item) {
                return [
                    'id' => $item->id,
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

            Log::debug('Fetched ' . $data->count() . ' schedule collections with null day_collection');

            return response()->json([
                'status' => true,
                'message' => "List Schedule Collection Not Yet",
                'data' => $data,
            ]);
        } catch (\Throwable $th) {
            Log::error('Error fetching schedule collections with null day_collection: ' . $th->getMessage());

            return response()->json([
                'status' => false,
                'message' => 'Error fetching data.',
            ], 500);
        }
    }

    // API delete schedule collection by Id
    public function deleteScheduleCollection($id)
    {
        $ScheduleCollection = ScheduleCollection::find($id);
        if (!$ScheduleCollection) {
            return response()->json([
                'message' => 'Schedule collection not found'
            ], 404);
        }
        ImageScheduleCollection::where('schedule_collection_id', $id)->delete();
        $ScheduleCollection->delete();
        return response()->json([
            'message' => 'Schedule collection and related images deleted successfully'
        ], 200);
    }
}

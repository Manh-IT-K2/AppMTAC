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

    // get list scheduleCollectionToday
    public function getScheduleCollectionToday(): JsonResponse
    {
        try {
            $today = Carbon::today()->toDateString();
            Log::info("Fetching schedule collections for today: " . $today);
            $schedules = ScheduleCollection::with('images')
                ->whereDate('day_collection', $today)
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
                    'collection_id' => $item->collection_id,
                    'name_business' => $item->name_business,
                    'address_collection' => $item->address_collection,
                    'type_waste' => $item->type_waste,
                    'area_transit' => $item->area_transit,
                    'number_plate' => $item->number_plate,
                    'number_worker' => $item->number_worker,
                    'time_collection' => $item->time_collection,
                    'contact_person' => $item->contact_person,
                    'day_collection' => $item->day_collection,
                    'day_send_collection' => $item->day_send_collection,
                    'debt_status' => $item->debt_status,
                    'cost_transit' => $item->cost_transit,
                    'image_url' => $item->images->pluck('image_url')->toArray(),
                ];
            });

            Log::info("Returning " . count($data) . " schedule collections for today.");

            return response()->json([
                'status' => true,
                'data' => $data,
                'date' => $today
            ]);
        } catch (\Throwable $th) {
            Log::error('ScheduleCollectionToday: Lỗi khi lấy dữ liệu.', [
                'message' => $th->getMessage(),
                'trace' => $th->getTraceAsString(),
            ]);

            return response()->json([
                'status' => false,
                'message' => 'Đã xảy ra lỗi khi lấy danh sách schedule collection.',
            ], 500);
        }
    }

    

    // delete schedule collection by Id
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

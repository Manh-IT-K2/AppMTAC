<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ScheduleCollection;
use App\Models\ImageScheduleCollection;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\ScheduleCollectionResource;


class ScheduleCollectionController extends Controller
{

    // API get list ScheduleCollectionToday
    public function getScheduleCollectionToday(): JsonResponse
    {
        try {
            $today = Carbon::today()->toDateString();
            $schedules = ScheduleCollection::with(['images', 'merchandises','costs'])
                ->whereDate('day_collection', $today)
                ->get();

            if ($schedules->isEmpty()) {
                return response()->json([
                    'status' => false,
                    'message' => 'No schedule collections found for today.',
                    'date' => $today
                ], 200);
            }

            return response()->json([
                'status' => true,
                'message' => "Schedule collection today: $today",
                'data' => ScheduleCollectionResource::collection($schedules),
            ]);
        } catch (\Throwable $th) {
            Log::error('Error: ' . $th->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Failed to fetch today’s schedule.',
            ], 500);
        }
    }


    // API get list ScheduleCollectionArranged
    public function getScheduleCollectionArranged(): JsonResponse
    {
        try {
            $schedules = ScheduleCollection::with(['images', 'merchandises', 'costs'])
                ->whereNotNull('day_collection')
                ->orderBy('day_collection', 'asc')
                ->get();

            return response()->json([
                'status' => true,
                'message' => 'Schedule collection list sorted by date',
                'data' => ScheduleCollectionResource::collection($schedules),
            ]);
        } catch (\Throwable $e) {
            Log::error('Error: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Failed to fetch arranged schedule.',
            ], 500);
        }
    }


    // API get list ScheduleCollectionNotYet
    public function getScheduleCollectionNotYet(): JsonResponse
    {
        try {
            $schedules = ScheduleCollection::with(['images', 'merchandises', 'costs'])
                ->whereNull('day_collection')
                ->get();

            return response()->json([
                'status' => true,
                'message' => "List Schedule Collection Not Yet",
                'data' => ScheduleCollectionResource::collection($schedules),
            ]);
        } catch (\Throwable $th) {
            Log::error('Error: ' . $th->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Failed to fetch not yet scheduled collections.',
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

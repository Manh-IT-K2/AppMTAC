<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ScheduleCollection;
use App\Models\ImageScheduleCollection;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\ScheduleCollectionResource;
use App\Models\Cost;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class ScheduleCollectionController extends Controller
{

    // API get list ScheduleCollectionToday
    public function getScheduleCollectionToday(): JsonResponse
    {
        try {
            $today = Carbon::today()->toDateString();
            $schedules = ScheduleCollection::with(['images', 'merchandises', 'costs'])
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
            ], 200);
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
            ], 200);
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
        try {

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
        } catch (\Throwable $th) {
            Log::error('Error: ' . $th->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Error when deleting.',
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    // API create cost for schedule collection
    public function addCostScheduleCollection(Request $request)
    {
        try {
            $validated = $request->validate([
                'schedule_collection_id' => 'required|integer',
                'category' => 'required|string|max:255',
                'cost' => 'required|string|max:255',
                'quantity' => 'required|string|max:255',
                'total_money' => 'required|string|max:255',
                'note' => 'required|string|max:255',
                'status' => 'required|string|max:255',
            ]);

            $cost = Cost::create([
                'schedule_collection_id' => $validated['schedule_collection_id'],
                'category' => $validated['category'],
                'cost' => $validated['cost'],
                'quantity' => $validated['quantity'],
                'total_money' => $validated['total_money'],
                'note' => $validated['note'],
                'status' => $validated['status'],
            ]);

            return response()->json([
                'message' => 'Cost added successfully!',
                'data' => $cost
            ], 200);
        } catch (ValidationException $ve) {
            Log::error('Validation Error: ' . json_encode($ve->errors()));
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'errors' => $ve->errors(),
            ], 422);
        } catch (\Throwable $th) {
            Log::error('Error: ' . $th->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'An error occurred while adding the cost.',
                'error' => $th->getMessage(),
            ], 500);
        }
    }
}

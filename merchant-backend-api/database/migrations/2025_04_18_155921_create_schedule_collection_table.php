<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('schedule_collection', function (Blueprint $table) {
            $table->id();
            $table->string('status');
            $table->unsignedBigInteger('collection_id');
            $table->string('name_business');
            $table->string('address_collection');
            $table->string('type_waste');
            $table->string('area_transit');
            $table->string('number_plate');
            $table->integer('number_worker');
            $table->time('time_collection')->nullable();
            $table->string('contact_person');
            $table->date('day_collection');
            $table->date('day_send_collection');
            $table->string('debt_status');
            $table->decimal('cost_transit', 10, 2);
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('schedule_collection');
    }
};

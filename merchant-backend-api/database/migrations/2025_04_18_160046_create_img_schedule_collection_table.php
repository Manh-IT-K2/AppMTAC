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
        Schema::create('img_schedule_collection', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('schedule_collection_id');
            $table->string('image_url');
            $table->timestamps();

            // Thiết lập khóa ngoại
            $table->foreign('schedule_collection_id')
                ->references('id')->on('schedule_collection')
                ->onDelete('cascade');
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('img_schedule_collection');
    }
};

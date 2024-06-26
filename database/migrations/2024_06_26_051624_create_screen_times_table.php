<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScreenTimesTable extends Migration
{
    public function up()
    {
        Schema::create('screen_times', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('url');
            $table->integer('time_spent'); // Time spent in milliseconds
            $table->timestamps();

        });
    }

    public function down()
    {
        Schema::dropIfExists('screen_times');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('recurrents_data', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('fingerprints_id');
            $table->string('action_id', 50);
            $table->string('site_id', 10);
            $table->string('geo', 3)->nullable();
            $table->timestamp('registered_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamps(0);
            $table->index('fingerprints_id');
            $table->index('site_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('recurrents_data');
    }
};

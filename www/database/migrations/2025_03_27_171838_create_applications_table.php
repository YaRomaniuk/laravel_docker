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
        Schema::create('applications', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('fingerprints_id');
            $table->string('action_id', 50);
            $table->string('site_id', 10);
            $table->string('geo', 3)->nullable();
            $table->char('phone_hash', 32);
            $table->char('ident_code_hash', 32);
            $table->char('email_hash', 32);
            $table->string('language', 10);
            $table->string('birthday', 10);
            $table->string('region', 50);
            $table->string('city', 50);
            $table->string('utm_source', 255)->nullable();
            $table->string('utm_campaign', 255)->nullable();
            $table->string('credit_type', 50);
            $table->mediumInteger('credit_sum', false, true)->default(0);
            $table->smallInteger('credit_days', false, true)->default(0);
            $table->string('ip', 50);
            $table->string('user_agent', 255);
            $table->timestamp('visited_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('unregistred_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamps(0);
            $table->index('visit_id');
            $table->index('phone_hash');
            $table->index('ident_code_hash');
            $table->index('email_hash');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('applications');
    }
};

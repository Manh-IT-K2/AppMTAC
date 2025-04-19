<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();
       // Passport::route();
        // Định nghĩa tuổi thọ cho Personal Access Token và Access Token
        //Passport::routes();

        // Đặt thời gian sống cho access token (60 phút)
        Passport::tokensExpireIn(now()->addMinutes(60));

        // Đặt thời gian sống cho refresh token (1 tháng)
        Passport::refreshTokensExpireIn(now()->addMonths(1));

    }
}

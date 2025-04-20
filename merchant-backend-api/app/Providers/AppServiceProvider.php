<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Passport;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
        //Passport::ignoreRoutes();
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {

        //
        Passport::hashClientSecrets();

        //
        Passport::loadKeysFrom(__DIR__.'/../secrets/oauth');

        //
        Passport::enablePasswordGrant();
        // Passport::tokensCan([
        //     'view-schedule' => 'Xem lịch trình',
        //     'view-profile' => 'Xem thông tin cá nhân',
        // ]);
    
        // Passport::setDefaultScope([
        //     'view-profile',
        // ]);
        
    }
}

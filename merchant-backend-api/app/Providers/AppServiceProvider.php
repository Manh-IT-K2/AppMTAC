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
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
        // Passport::tokensCan([
        //     'view-schedule' => 'Xem lịch trình',
        //     'view-profile' => 'Xem thông tin cá nhân',
        // ]);
    
        // Passport::setDefaultScope([
        //     'view-profile',
        // ]);
        
    }
}

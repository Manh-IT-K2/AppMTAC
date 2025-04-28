<?php

namespace App\Services;

use Kreait\Firebase\Factory;

class FirebaseService
{
    protected $database;

    public function __construct()
    {
        $credentialPath = base_path(config('firebase.credentials.file'));
    
        if (!file_exists($credentialPath)) {
            throw new \Exception("Firebase credential file does not exist at: {$credentialPath}");
        }
    
        $factory = (new Factory)
            ->withServiceAccount($credentialPath)
            ->withDatabaseUri(config('firebase.database.url'));
    
        $this->database = $factory->createDatabase();
    }
    

    public function updateDeviceStatus($userId, $deviceId)
    {
        return $this->database
            ->getReference('users/' . $userId)
            ->set([
                'device_id' => $deviceId,
                'updated_at' => now()->toDateTimeString(),
            ]);
    }

    public function getUserDeviceId($userId)
    {
        return $this->database
            ->getReference('users/' . $userId)
            ->getValue();
    }
}

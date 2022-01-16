<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class VaultwardenBackupCommand extends Command
{
    protected $signature = 'vaultwarden:backup';

    protected $description = 'Backs up the Vaultwarden volume using Rclone';

    public function handle()
    {
        $containerName = 'intranet-dashboard';
        $volumeName = 'portainer_data';
    }
}

<?php

namespace App\Http\Controllers;

use Docker\Docker;

class DashboardController
{
    public function __invoke()
    {
        $docker = Docker::create();

        $containers = $docker->containerList([
            'all' => true,
        ]);

//        foreach ($containers as $container) {
//            dump($container);
//        }
//
//        /** @var ContainerSummaryItem $portainer */
//        $portainer = collect($containers)
//            ->filter(fn(ContainerSummaryItem $container) => collect($container->getNames())->contains('/portainer'))
//            ->first();
//
//        $volumes = $docker->volumeList([
//            'filters' => \json_encode([
//                'name' => ['portainer_data'],
//            ]),
//        ]);
//
//        $volume = collect($volumes->getVolumes())->first();
//
//        dd($volume);
//
//        dump('restarting portainer');
//
//        $docker->containerRestart($portainer->getId());

        return view('pages.dashboard', compact('containers'));
    }
}

<x-app-layout>
    <div class="text-3xl mb-2">Containers:</div>
    <div class="flex">
        @foreach ($containers as $container)
            @php
            switch ($container->getState()) {
                case 'running':
                    $backgroundColor = 'bg-green-200';
                    $textColor = 'text-green-900';
                    $dotColor = 'bg-green-500';
                    break;
                case 'exited':
                    $backgroundColor = 'bg-red-200';
                    $textColor = 'text-red-900';
                    $dotColor = 'bg-red-500';
                    break;
                default:
                    $backgroundColor = 'bg-gray-200';
                    $textColor = 'text-gray-900';
                    $dotColor = 'bg-gray-500';
                    break;
            }
            @endphp
            <div class="flex ml-3 items-center first:ml-0 px-2 py-1 rounded-md font-bold {{ $backgroundColor }}">
                <div class="w-2 h-2 rounded-full {{ $dotColor }}"></div>
                <div class="ml-2 {{ $textColor }}">
                    {{ ucwords(str_replace('-', ' ', implode(', ', array_map(fn($string) => ltrim($string, '/'), $container->getNames())))) }}
                </div>

                {{--{{ $container->getStatus() }}
                {{ $container->getState() }}--}}
            </div>
        @endforeach
    </div>
</x-app-layout>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Intranet Dashboard</title>
        <link href="{{ mix('css/app.css') }}" rel="stylesheet">
        <script src="{{ mix('js/app.js') }}" defer></script>
    </head>
    <body>
        {{ $slot }}
    </body>
</html>

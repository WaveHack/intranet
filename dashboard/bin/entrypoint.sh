#!/usr/bin/env bash

bash bin/install.sh

if [ "$APP_ENV" = "local" ]; then
    php artisan serve --host=0.0.0.0 --port=80 &
    bash -l
else
    php artisan serve --host=0.0.0.0 --port=80
fi

#!/usr/bin/env bash

if [ "$APP_ENV" = "local" ]; then
    composer install
else
    composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev
fi

if [ ! -f ".env" ]; then
    cp .env.example .env
    php artisan key:generate
fi

yarn install

if [ "$APP_ENV" = "local" ]; then
    yarn run watch &
    php artisan optimize:clear
else
    yarn run production
    php artisan optimize
fi

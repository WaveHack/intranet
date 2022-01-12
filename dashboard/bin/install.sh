#!/usr/bin/env bash

composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

if [ ! -f ".env" ]; then
    cp .env.example .env
    php artisan key:generate
fi

yarn install

yarn run production

php artisan optimize

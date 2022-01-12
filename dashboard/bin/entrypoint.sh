#!/usr/bin/env bash

bash bin/install.sh

php artisan serve --host=0.0.0.0 --port=80

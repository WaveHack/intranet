#!/usr/bin/env bash

bash $(dirname $(realpath $0))/install.sh

php artisan serve --host=0.0.0.0 --port=80

#!/usr/bin/env bash

bash bin/install.sh

# todo: probably manage this with supervisor
php artisan serve --host=0.0.0.0 --port=80 &
cron &

# Start Bash login shell to keep the container running, and also so we can bash
# into it locally for development purposes
bash -l

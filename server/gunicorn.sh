#!/bin/bash

set -e

cd /srv/www
source venv/bin/activate
exec gunicorn app:app -c "server/gunicorn.conf.py"

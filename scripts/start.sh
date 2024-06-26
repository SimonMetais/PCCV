#!/bin/bash

cd django_app || exit

python manage.py makemigrations
python manage.py migrate

# collects all static files in our app and puts it in the STATIC_ROOT
python manage.py collectstatic --noinput

gunicorn django_app.wsgi -b 0.0.0.0:8000
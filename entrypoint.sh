#!/bin/bash

# Exit on any error
set -e

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Start Gunicorn server
echo "Starting Gunicorn server..."
exec gunicorn app.wsgi:application --bind 0.0.0.0:8000

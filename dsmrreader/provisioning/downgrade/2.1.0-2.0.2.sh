#!/bin/bash
./manage.py migrate dsmr_frontend 0018_v202_release
./manage.py migrate dsmr_backup 0004_custom_backup_path
./manage.py migrate dsmr_backend zero

#!/bin/sh
if [ ! -f ./.env ]
then
POSTGRES_USER="postgres"
POSTGRES_PASSWORD=$(openssl rand -base64 16)
echo "POSTGRES_USER=$POSTGRES_USER"  >> ./.env
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD"  >> ./.env
fi

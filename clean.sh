#!/bin/bash

echo

echo "Removing all the containers and other stuff."

docker-compose down -v

echo "Cleaned."

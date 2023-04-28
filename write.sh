#!/bin/bash

echo

echo "This script will write frequently some data to the MySQL master node."

while true
do
  sleep $(bc -l <<< "scale=4; ${RANDOM}/32767")
  docker-compose exec -it alpha mysql -uroot -pmypass mydb \
  -e "INSERT INTO users (full_name, birth_date) VALUES (MD5(RAND()), CURRENT_DATE - INTERVAL FLOOR(RAND() * 10000) DAY);" &> /dev/null
done

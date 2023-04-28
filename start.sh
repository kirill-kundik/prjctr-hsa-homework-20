#!/bin/bash

echo

echo "Starting MySQL group replication with docker-compose.yml file."

docker-compose up -d

echo "Waiting for the containers to be up and healthy."

i=0
while true
do
  sleep 1

  if [ $(docker-compose ps | grep "healthy" | wc -l) -eq 3 ]
  then
    echo "All containers are running and healthy."
    break
  fi

  let i++
  if [[ i == 15 ]]
  then
    echo "Docker containers were not started. Please check them for any errors."
    exit 1
  fi
done

echo "Setting container roles (master/slave) and configurations."

sleep 10

docker-compose exec -it alpha mysql -uroot -pmypass mydb -e "CALL set_as_master;" &> /dev/null

docker-compose exec -it beta mysql -uroot -pmypass mydb -e "CALL set_as_slave;" &> /dev/null

docker-compose exec -it gamma mysql -uroot -pmypass mydb -e "CALL set_as_slave;" &> /dev/null

echo "MySQL group replication have successfully started."

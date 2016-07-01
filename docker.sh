#!/bin/env zsh
docker run --name mdb -e MYSQL_ROOT_PASSWORD=toor -d mariadb:latest
#docker exec -it mdb bash
#
#docker run --name mongo -d facts --storageEngine wiredTiger  --noprealloc --smallfiles

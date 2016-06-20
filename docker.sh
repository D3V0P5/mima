#!/bin/env zsh
docker run --name mdb -e MYSQL_ROOT_PASSWORD=toor -d mariadb:latest
#docker exec -it mdb bash

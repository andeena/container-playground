#!/bin/sh

docker rm -f phpmyadmin1

# Jalankan phpMyAdmin di port 10000
docker container run \
    -dit \
    --name phpmyadmin1 \
    -p 10000:80 \
    -e PMA_HOST=mysql1 \
    -e MYSQL_ROOT_PASSWORD=case4task1 \
    --link mysql1 \
        phpmyadmin:5.2.1-apache

echo "Akses di: http://localhost:10000"
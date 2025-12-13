#!/bin/sh

docker rm -f mysql1

docker container run \
    -dit \
    --name mysql1 \
    -v $(pwd)/dbdata:/var/lib/mysql \
    -e MYSQL_DATABASE=mydb \
    -e MYSQL_PASSWORD=case4task1 \
    -e MYSQL_ROOT_PASSWORD=case4task1 \
    -e MYSQL_ROOT_HOST=% \
    mysql:8.0-debian \
    --default-authentication-plugin=mysql_native_password

echo "sleep 15 detik"
sleep 15

# create table
docker exec -i mysql1 mysql -uroot -pcase4task1 mydb -e "
CREATE TABLE IF NOT EXISTS user_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);"

echo "Database dan Tabel Siap!"
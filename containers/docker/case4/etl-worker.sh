#!/bin/sh

echo "Installing dependencies..."
apk update > /dev/null && apk add --no-cache curl jq mysql-client > /dev/null

URL="https://randomuser.me/api/"
DELAY=5

echo "--- Worker ETL Berjalan ---"

while true;
do
    RESPONSE=$(curl -s $URL)
    
    # transform
    FNAME=$(echo $RESPONSE | jq -r '.results[0].name.first')
    LNAME=$(echo $RESPONSE | jq -r '.results[0].name.last')
    EMAIL=$(echo $RESPONSE | jq -r '.results[0].email')
    CITY=$(echo $RESPONSE | jq -r '.results[0].location.city')
    FULLNAME="$FNAME $LNAME"

    mysql -h mysql1 -uroot -pcase4task1 mydb -e \
    "INSERT INTO user_logs (name, email, city) VALUES ('$FULLNAME', '$EMAIL', '$CITY');"

    echo "[Data Masuk] $FULLNAME ($CITY)"
    sleep $DELAY
done
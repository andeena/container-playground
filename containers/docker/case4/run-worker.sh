#!/bin/sh

docker rm -f etl-worker

docker run -dit \
    --name etl-worker \
    --link mysql1 \
    -v $(pwd)/etl-worker.sh:/worker.sh \
    alpine:3.18 \
    sh /worker.sh
    
echo "Worker berjalan di background."
echo "Cek logs dengan: docker logs -f etl-worker"
docker rm -f case5-public
docker run -dit \
    --name case5-public \
    -p 9999:80 \
    mypublicflask:1.0
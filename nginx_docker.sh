#!/bin/bash

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt -config req.cnf

docker run -it --rm -p 443:443 --name nginx --network host \
    -v "$PWD/default.conf":/etc/nginx/conf.d/default.conf \
    -v "$PWD/dist":/usr/share/nginx/html \
    -v "$PWD/nginx-selfsigned.crt":/nginx-selfsigned.crt \
    -v "$PWD/nginx-selfsigned.key":/nginx-selfsigned.key \
    nginx
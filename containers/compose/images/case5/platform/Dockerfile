FROM alpine:3.18

RUN apk add --no-cache python3 py3-pip nginx supervisor git

RUN pip3 install flask --break-system-packages

WORKDIR /app
COPY app.py .

COPY nginx.conf /etc/nginx/http.d/default.conf
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
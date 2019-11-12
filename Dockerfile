FROM alpine:3.9
LABEL maintainer="leafney <babycoolzx@126.com>"

RUN apk add --no-cache git pcre nginx supervisor && \
    mkdir -p /app/logs/ && \
    mkdir -p /run/nginx/ && \
    mkdir -p /etc/supervisor.d/ && \
    rm -rf /var/cache/apk/*

COPY ./supervisor_bloghook.ini /etc/supervisor.d/supervisor_bloghook.ini
COPY ./nginx_bloghook.conf /etc/nginx/conf.d/default.conf
COPY ./build.sh /app/
COPY ./main /app/

WORKDIR /app

EXPOSE 80 8080

CMD ["supervisord","-c","/etc/supervisord.conf"]
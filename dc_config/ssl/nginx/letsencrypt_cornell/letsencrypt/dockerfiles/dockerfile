FROM debian:buster-slim
RUN apt-get update \
 && apt-get install -y certbot

COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


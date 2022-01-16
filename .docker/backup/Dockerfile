FROM alpine:3.14

RUN apk add --no-cache docker rclone zip

COPY bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*
COPY crontab /etc/crontabs/root
COPY rclone.conf /root/.config/rclone/rclone.conf

CMD ["crond", "-f"]

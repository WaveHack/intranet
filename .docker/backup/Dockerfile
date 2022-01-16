FROM alpine:3.14

RUN apk --update add rclone zip

COPY bin /usr/local/bin
RUN chmod +x /usr/local/bin/*

COPY rclone.conf /root/.config/rclone/rclone.conf

COPY crontab /etc/crontabs/root

#CMD ["sh", "-l"]
CMD ["crond", "-f", "-d", "8"]

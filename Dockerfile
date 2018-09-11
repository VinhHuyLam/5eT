FROM alpine:latest
EXPOSE 8080
ENV GITREPO=https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/ LOCALDEST=5eTools CRONEXPR="0 0 0/12 ? * * *"
RUN apk add --update --no-cache git nodejs npm && \
    npm install -g simple-autoreload-server
COPY update.sh /update
#git pull every 12hrs via cron
RUN chmod +rx /update && \
    crontab -c /usr/bin/crontab -e $CRONEXPR /update
CMD ["/update"]
VOLUME ["/$LOCALDEST"]

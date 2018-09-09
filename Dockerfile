FROM alpine:latest
EXPOSE 8080
ENV GITREPO=https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/ LOCALDEST=5eTools
RUN apk add --update --no-cache git nodejs npm && \
    npm install -g simple-autoreload-server
WORKDIR /$LOCALDEST
COPY update.sh /update.sh
RUN chmod +rx /update.sh
CMD ["sh", "update.sh"]
VOLUME ["/$LOCALDEST"]

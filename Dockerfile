FROM alpine:latest
EXPOSE 8080
ENV GITREPO=https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/ LOCALDEST=5eTools
RUN apk add --update --no-cache git nodejs npm && \
    npm install -g simple-autoreload-server
COPY update.sh entrypoint
WORKDIR /$LOCALDEST
RUN chmod +rx  entrypoint && \
    ln -s /$LOCALDEST/5etools.html /$LOCALDEST/index.html
ENTRYPOINT ["./entrypoint"]
CMD npm run dev-server
VOLUME ["/$LOCALDEST"]

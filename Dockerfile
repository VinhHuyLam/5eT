FROM alpine:latest
EXPOSE 8080
ENV GITREPO=https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/ LOCALDEST=5eTools
RUN apk add --update --no-cache git nodejs npm bash && \
    npm install -g simple-autoreload-server
WORKDIR /$LOCALDEST
COPY update.sh entrypoint
RUN chmod +rx entrypoint
ENTRYPOINT ["./entrypoint"]
CMD npm run dev-server
VOLUME ["/$LOCALDEST"]

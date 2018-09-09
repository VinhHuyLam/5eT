FROM alpine:latest
EXPOSE 8080
RUN apk add --update --no-cache git nodejs npm
RUN git clone --branch master https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/
CMD npm run dev-server

FROM alpine:latest
EXPOSE 8080
RUN apk add --update --no-cache git nodejs npm && \
    npm install -g simple-autoreload-server
RUN git clone --branch master https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/ && \
    ln -s /TheGiddyLimit.github.io/5etools.html /TheGiddyLimit.github.io/index.html
WORKDIR /TheGiddyLimit.github.io
CMD npm run dev-server

FROM alpine:latest
EXPOSE 8080
RUN apk add --update --no-cache git nodejs
RUN git clone --https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/
WORKDIR /app
RUN npm install
CMD ["npm", "run dev-server"]

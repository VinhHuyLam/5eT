FROM alpine:latest
EXPOSE 8080
RUN apk add --update --no-cache git nodejs
RUN git clone --branch master https://github.com/TheGiddyLimit/TheGiddyLimit.github.io.git/
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD npm run dev-server

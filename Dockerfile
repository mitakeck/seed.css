FROM node:13.1.0-alpine

RUN npm install -g sass

WORKDIR /app
ENTRYPOINT [ "sass" ]
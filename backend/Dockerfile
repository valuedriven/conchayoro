ARG PORT=3000

FROM node:14-alpine as node

WORKDIR /app

RUN apk add --no-cache \
    tzdata \
    && npm i -g pm2 \
    && cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && apk del tzdata

COPY package*.json process.yml ./

COPY node_modules ./

EXPOSE ${PORT}

ENTRYPOINT ["pm2-runtime", "./process.yml"]
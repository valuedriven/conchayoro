ARG PORT=3000

FROM node:14-alpine as node

FROM node as builder

WORKDIR /app

COPY package*.json process.yml ./

COPY node_modules ./

FROM node as deployer

WORKDIR /app

RUN apk add --no-cache \
    tzdata \
    && npm i -g pm2 \
    && cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && apk del tzdata

COPY --from=builder node_modules ./

COPY . . 

EXPOSE ${PORT}

ENTRYPOINT ["pm2-runtime", "./process.yml"]
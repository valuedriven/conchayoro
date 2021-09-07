ARG HOST=localhost
ARG PORT=81
ARG BACKEND_HOST=localhost
ARG BACKEND_PORT=3001

FROM node:14-alpine as build-stage

WORKDIR /app

COPY package*.json ./

COPY dist ./

FROM nginx:1.19.3-alpine as production-stage

ARG HOST
ARG PORT
ARG BACKEND_HOST
ARG BACKEND_PORT

ENV HOST ${HOST}
ENV PORT ${PORT}
ENV BACKEND_HOST ${BACKEND_HOST}
ENV BACKEND_PORT ${BACKEND_PORT}

COPY --from=build-stage dist /usr/share/nginx/html

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]
ARG HOST=localhost
ARG PORT=81
ARG BACKEND_HOST=localhost
ARG BACKEND_PORT=3001

FROM nginx:1.19.3-alpine

WORKDIR /app

COPY package*.json ./

COPY dist /usr/share/nginx/html

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

ENV HOST ${HOST}
ENV PORT ${PORT}
ENV BACKEND_HOST ${BACKEND_HOST}
ENV BACKEND_PORT ${BACKEND_PORT}

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]
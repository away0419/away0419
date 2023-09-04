FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install nodejs

WORKDIR /app
COPY package*.json ./
RUN npm install -g npm@9.8.1
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
FROM node:latest as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install -g --cache
RUN npm i @vue/cli-service
COPY ./ .
RUN npm run serve

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
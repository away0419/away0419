FROM node:latest as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install -g --cache 
COPY ./ .
RUN npm run serve

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/public/index /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
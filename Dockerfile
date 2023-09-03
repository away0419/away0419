FROM node:latest as build-stage
WORKDIR /app
COPY package.json ./
RUN npm i -g 
COPY ./ .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
FROM node:14.21.3
WORKDIR /app
COPY package.json .
ADD . .
RUN npm install -g --cache npm@9.8.1 
RUN npm run serve

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/public/index /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/public/index /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
FROM node:14.21.3
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build


# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/public/index /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
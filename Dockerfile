FROM node:14.21.3
WORKDIR /app
COPY . .
RUN del package-lock.json
RUN rm -rf node_modules
RUN npm install -g --cache npm@latest 
RUN npm run serve


# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/public/index /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
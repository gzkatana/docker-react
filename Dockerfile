FROM node:alpine as builder
WORKDIR /usr/front
COPY package*.json ./
RUN npm install 
COPY ./ ./
RUN chmod 777 /usr/front/node_modules
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/front/build /usr/share/nginx/html
# no need to start nginx command , it will start automatically
# trying commit 
 

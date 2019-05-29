FROM node:alpine as builders
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builders /app/build /usr/share/nginx/html

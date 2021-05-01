FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build #creates /app/build directory with index.html and main.js


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

FROM nginx:latest

EXPOSE 80

COPY  ./frontend/dist /usr/share/nginx/html

# Dockerfile for spin-application

FROM nginx:latest
COPY path1/index.html /usr/share/nginx/html/index.html
EXPOSE 80

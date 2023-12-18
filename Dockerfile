# Dockerfile for spin-application

FROM nginx:latest
#RUN mkdir -p /usr/share/nginx/html/path1
#RUN mkdir -p /usr/share/nginx/html/path2
COPY path1/index.html /usr/share/nginx/html/index.html
EXPOSE 80

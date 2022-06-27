FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/logs
RUN touch /etc/nginx/logs/error.log
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

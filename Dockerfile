FROM nginx:alpine

COPY html /var/www/html/
COPY nginx/markdown-server.conf /etc/nginx/conf.d/default.conf
COPY __special /usr/share/nginx/html/__special


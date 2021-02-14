FROM pandoc/core 

WORKDIR /tmp
COPY ./src/ /tmp
RUN pandoc --standalone --template template.html index.md -o index.html

FROM nginx:latest
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /tmp /var/www/html
CMD ["nginx"]

FROM nginx:alpine
COPY . /usr/share/nginx/html
# Expõe a porta 80 (default do Nginx)
EXPOSE 80

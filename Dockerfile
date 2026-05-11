# Gunakan OS Nginx versi ringan
FROM nginx:alpine
# Copy file HTML kita ke folder Nginx
COPY index.html /usr/share/nginx/html/index.html
# Buka Port 80
EXPOSE 80
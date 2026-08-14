FROM php:8.2-apache
RUN apt-get update && apt-get install -y unzip
COPY admin_project.zip /var/www/html/
RUN unzip /var/www/html/admin_project.zip -d /var/www/html/ && rm /var/www/html/admin_project.zip

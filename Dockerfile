FROM php:8.2-apache
RUN docker-php-ext-install pdo pdo_mysql
COPY monir.zip /var/www/html/
RUN apt-get update && apt-get install -y unzip \
    && unzip /var/www/html/monir.zip -d /var/www/html/ \
    && rm /var/www/html/monir.zip

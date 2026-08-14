FROM php:8.2-apache
RUN apt-get update && apt-get install -y unzip
COPY monir.zip /var/www/html/
RUN unzip /var/www/html/monir.zip -d /var/www/html/ && rm /var/www/html/monir.zip

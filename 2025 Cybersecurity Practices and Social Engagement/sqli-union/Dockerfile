FROM php:8.1-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

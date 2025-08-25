
FROM php:8.1-apache

# 安裝 PDO MySQL 擴展
RUN docker-php-ext-install pdo pdo_mysql

ENV FLAG="NCKUCTF{OKAY_U_R_IN}"

# 設定 Apache 權限
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

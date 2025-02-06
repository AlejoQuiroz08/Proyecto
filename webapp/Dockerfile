FROM php:7.4-apache
COPY src/ /var/www/html/
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite
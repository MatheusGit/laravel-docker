FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
	libpq-dev \  
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
    && docker-php-ext-install ext-ldap \

RUN docker-php-ext-install zip pdo pdo_pgsql mbstring 
#RUN docker-php-ext-install pdo pdo_pgsql
#RUN docker-php-ext-install mbstring






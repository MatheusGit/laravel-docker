FROM php:7.1-apache

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
    
RUN docker-php-ext-install zip pdo pdo_pgsql mbstring 

RUN apt-get update && \ 
     apt-get install libldap2-dev -y && \ 
     docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \ 
     docker-php-ext-install ldap

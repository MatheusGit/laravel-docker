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
    
RUN docker-php-ext-install zip pdo pdo_pgsql mbstring 
#RUN docker-php-ext-install pdo pdo_pgsql
#RUN docker-php-ext-install mbstring

#RUN apt-get update && \ 
 #    apt-get install libldap2-dev -y php7.1-ldap && \ 
 #   docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \ 
 #    docker-php-ext-install ldap
 
# LDAP requirements
RUN apt-get update && \
    apt-get install -y ldap-utils libldap2-dev && \
    rm -rf /var/lib/apt/lists/*

# install ldap for php
RUN apt-get update -y && apt-get install -y php7.1-ldap






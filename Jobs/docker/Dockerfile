FROM php:8.1.13-apache

RUN apt-get upgrade && apt-get update -y
# Enable needed Apache modules
RUN a2enmod rewrite headers ssl actions session session_cookie cgi auth_digest dav dav_fs include suexec

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Git
RUN apt-get install -y git

# Install & Configure Imagick
RUN apt-get install -y libmagickwand-dev --no-install-recommends
RUN pecl install imagick
RUN docker-php-ext-enable imagick

# Install & Configure GD and ICONV
RUN apt-get install -y libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev
RUN docker-php-ext-install iconv \
        && docker-php-ext-configure gd \
        && docker-php-ext-install gd

# Install & Configure Zip
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

RUN docker-php-ext-install mysqli pdo pdo_mysql

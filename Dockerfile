FROM php:7.4-fpm
LABEL maintainer="antonio@antonioandra.de"

RUN     apt-get update \
    &&  apt-get install -qy \
            libmcrypt-dev \
            libicu-dev \
            libmagickwand-dev \
            libicu-dev \
            libz-dev \
            libpq-dev \
            libjpeg-dev \
            libpng-dev \
            libfreetype6-dev \
            libssl-dev \
            libmcrypt-dev \
            libxml2-dev \
            libbz2-dev \
            libjpeg62-turbo-dev \
            librabbitmq-dev \
            libzip-dev \
            curl \
            git \
            nodejs \
            libonig-dev \
            --no-install-recommends \
    &&  yes | pecl install mcrypt-1.0.3 \
    &&  docker-php-ext-enable mcrypt \
    &&  docker-php-ext-configure bcmath --enable-bcmath \
    &&  docker-php-ext-configure pcntl --enable-pcntl \
    &&  docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    &&  docker-php-ext-configure mbstring --enable-mbstring \
    &&  es | pecl install imagick \
    &&  docker-php-ext-enable imagick \
    &&  docker-php-ext-install \
            mbstring \
            pcntl \
            intl \
            zip \
            pdo_mysql \
            gd \
    &&  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
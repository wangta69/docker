FROM php:8.2-fpm


# 필요한 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    vim \
    && docker-php-ext-install mysqli pdo pdo_mysql

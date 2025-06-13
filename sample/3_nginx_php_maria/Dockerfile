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

# Get Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Get NodeJS
COPY --from=node:20-slim /usr/local/bin /usr/local/bin

# Get npm
COPY --from=node:20-slim /usr/local/lib/node_modules /usr/local/lib/node_modules
# php.ini 복사 (옵션)
# COPY ./php.ini /usr/local/etc/php/

# # Install required PHP extensions
# RUN docker-php-ext-install pdo pdo_mysql

# # Set the working directory inside the container (optional)
# WORKDIR /app

# # Copy all application files from your build context to /app
# COPY . /app

# # Optional: set correct permissions
# RUN chown -R www-data:www-data /app
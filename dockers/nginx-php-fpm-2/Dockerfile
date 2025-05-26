FROM php:8.2-fpm
WORKDIR /var/www
RUN apt-get update
# RUN alias 'll'='ls -al'
# RUN apt-get install vim
RUN apt-get install -y libpq-dev libzip-dev zip zlib1g-dev
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install zip
# RUN pecl install redis-5.3.7 && docker-php-ext-enable redis
COPY --from=composer /usr/bin/composer /usr/bin/composer

# COPY . .
# RUN composer install
# RUN /usr/bin/composer install
# ```
# docker build -t <project-name> .
# docker tag <project-name> <username>/<project-name>
# docker push <username>/<project-name>
# ```
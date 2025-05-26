# PHP 8.2 FPM 이미지를 기반으로 합니다
FROM php:8.2-fpm
# 필요한 PHP 확장을 설치합니다
RUN docker-php-ext-install pdo pdo_mysql

RUN mkdir /app
COPY index.php /app
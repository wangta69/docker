FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 시스템 패키지 업데이트 및 기본 도구 설치
RUN apt update && apt install -y \
  curl \
  wget \
  gnupg2 \
  lsb-release \
  ca-certificates \
  software-properties-common \
  vim \
  sudo \
  unzip \
  git \
  passwd \
  openssh-server \
  php-cli php-mbstring php-xml php-curl php-zip php-bcmath php-tokenizer php-mysql php-common \
  php-gd php-soap php-intl php-readline

# Node.js 18 설치 (Ubuntu 공식 방법)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt install -y nodejs

# # Get NodeJS
# COPY --from=node:20-slim /usr/local/bin /usr/local/bin

# # Get npm
# COPY --from=node:20-slim /usr/local/lib/node_modules /usr/local/lib/node_modules

# Composer 설치
RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

# # Get Composer
# COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# SSH 설정
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config


# 기본 사용자 추가 스크립트 복사
COPY create-users.sh /usr/local/bin/create-users.sh
RUN chmod +x /usr/local/bin/create-users.sh

# SSH 시작 시 사용자 자동 추가
CMD ["/bin/bash", "-c", "/usr/local/bin/create-users.sh && /usr/sbin/sshd -D"]
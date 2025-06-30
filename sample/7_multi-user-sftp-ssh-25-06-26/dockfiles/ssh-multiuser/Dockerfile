FROM ubuntu:22.04

# 필수 패키지 설치
RUN apt update && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd && \
    rm -rf /var/lib/apt/lists/*

# sshd 설정
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    echo "AllowUsers user1 pondol" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config && \
    echo "X11Forwarding no" >> /etc/ssh/sshd_config && \
    echo "PrintMotd no" >> /etc/ssh/sshd_config

# ssh key 생성
RUN ssh-keygen -A

# 시작 스크립트
RUN echo '#!/bin/bash\n\
mkdir -p /mnt/shared/user1 /mnt/shared/pondol\n\
useradd -u 1001 -d /mnt/shared/user1 -s /bin/bash -M user1 && echo "user1:password1" | chpasswd\n\
useradd -u 1002 -d /mnt/shared/pondol -s /bin/bash -M pondol && echo "pondol:password2" | chpasswd\n\
chown 1001:1001 /mnt/shared/user1 && chmod 755 /mnt/shared/user1\n\
chown 1002:1002 /mnt/shared/pondol && chmod 755 /mnt/shared/pondol\n\
exec /usr/sbin/sshd -D -e' > /start.sh && chmod +x /start.sh


# RUN echo '#!/bin/bash\n\
# useradd -u 1001 -d /mnt/shared/user1 -s /bin/bash -M user1 && echo "user1:password1" | chpasswd\n\
# useradd -u 1002 -d /mnt/shared/pondol -s /bin/bash -M pondol && echo "pondol:password2" | chpasswd\n\
# # 퍼미션 설정\n\
# [ -d /mnt/shared/user1 ] && chown 1001:1001 /mnt/shared/user1 && chmod 755 /mnt/shared/user1\n\
# [ -d /mnt/shared/pondol ] && chown 1002:1002 /mnt/shared/pondol && chmod 755 /mnt/shared/pondol\n\
# exec /usr/sbin/sshd -D -e' > /start.sh && chmod +x /start.sh

# useradd -u 1001 -d /home/user1 -s /bin/bash -M user1 && echo "user1:password1" | chpasswd\n\
# useradd -u 1002 -d /home/pondol -s /bin/bash -M pondol && echo "pondol:password2" | chpasswd\n\

EXPOSE 2222

CMD ["/start.sh"]

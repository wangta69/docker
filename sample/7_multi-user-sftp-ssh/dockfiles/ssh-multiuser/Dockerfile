FROM ubuntu:22.04

RUN apt update && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd

# 사용자 생성 및 홈 디렉토리 명확히 지정
RUN useradd -m -d /home/user1 -u 1001 user1 && echo "user1:password1" | chpasswd && \
    useradd -m -d /home/pondol -u 1002 pondol && echo "pondol:password2" | chpasswd

# sshd 설정 변경
RUN echo "Port 2222" >> /etc/ssh/sshd_config && \
    echo "AllowUsers user1 pondol" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config

EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D"]
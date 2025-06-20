FROM ubuntu:22.04

RUN apt update && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd

# user1, pondol 계정 생성, 홈 디렉터리 명시
RUN useradd -m -d /home/user1 -u 1001 user1 && echo "user1:password1" | chpasswd && \
    useradd -m -d /home/pondol -u 1002 pondol && echo "pondol:password2" | chpasswd

RUN echo "Port 2222" >> /etc/ssh/sshd_config && \
    echo "AllowUsers user1 pondol" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config

EXPOSE 2222

CMD ["/usr/sbin/sshd", "-D"]
#!/bin/bash

# www-data 그룹이 없으면 생성 (보통 nginx 이미지에는 존재함)
getent group www-data >/dev/null || groupadd www-data

# 유저 목록 정의: "user:password" 형식
USERS=("user1:password1" "pondol:password2")

for entry in "${USERS[@]}"; do
  USERNAME=$(echo "$entry" | cut -d: -f1)
  PASSWORD=$(echo "$entry" | cut -d: -f2)

  if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists"
  else
    echo "Creating user $USERNAME..."
    # useradd -m -s /bin/bash "$USERNAME"
    useradd -m -s /bin/bash -G www-data "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd
    mkdir -p "/home/$USERNAME"
    chown "$USERNAME:$USERNAME" "/home/$USERNAME"
    chmod 755 "/home/$USERNAME"
  fi
done

echo "All users created. Starting SSH..."
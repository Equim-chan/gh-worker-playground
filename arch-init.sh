#!/bin/bash
set -x

sed -i 's/#Color/Color/' /etc/pacman.conf

cat >> /etc/pacman.conf << 'EOF'
[multilib]
Include = /etc/pacman.d/mirrorlist
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch
EOF

pacman -Syy
pacman-key --init
pacman-key --refresh-keys
pacman -S --noconfirm archlinuxcn-keyring

pacman -Syu --needed --noconfirm \
  base-devel \
  bash-completion \
  vim \
  screen \
  rsync \
  wget \
  curl \
  git \
  pv \
  htop \
  yay

useradd equim
chown -R equim: /home/equim
passwd -d equim
echo 'equim ALL=(ALL) NOPASSWD:ALL' | env EDITOR='tee -a' visudo

rm "$0"

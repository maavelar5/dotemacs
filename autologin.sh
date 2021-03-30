#!/bin/bash

if [ ! -d /etc/systemd/system/getty\@tty1.service.d ]; then
    sudo mkdir /etc/systemd/system/getty\@tty1.service.d
fi

sudo cp ~/dotemacs/autologin.conf /etc/systemd/system/getty\@tty1.service.d/autologin.conf

cp ~/dotemacs/.bash_profile ~/.bash_profile
cp ~/dotemacs/.xinitrc ~/.xinitrc

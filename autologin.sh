#!/bin/bash

if [ ! -d /etc/systemd/system/getty\@tty1.service.d ]; then
    sudo mkdir /etc/systemd/system/getty\@tty1.service.d
fi

sudo cp autologin.conf /etc/systemd/system/getty\@tty1.service.d/autologin.conf

cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp .xinitrc ~/.xinitrc
cp .Xresources ~/.Xresources

if [ ! -d ~/.config ]; then
	mkdir ~/.config
fi

cp -r .config/awesome ~/.config/awesome

#!/bin/bash

rm -rf output
mkdir output

cd output
git clone https://aur.archlinux.org/pikaur.git

cd pikaur
makepkg -fsri

cd ..
rm -rf pikaur

sudo pacman -S xorg xorg-xinit emacs autorandr vim pulseaudio pulseaudio-bluetooth pulsemixer scrot xfce4-terminal the_silver_searcher ttf-liberation

pikaur -S brave-bin

git clone https://git.suckless.org/dwm

cd dwm
git checkout 6.3
git apply ../../dwm/systray.diff
cp ../../dwm/config.h config.h 
make clean; make; sudo make install;
cd ..

git clone https://git.suckless.org/slstatus
cd slstatus
cp ../../slstatus/config.h config.h
make clean; make; sudo make install;
cd ../../

./autologin.sh

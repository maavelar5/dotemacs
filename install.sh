#!/bin/bash

rm -rf output
mkdir output

cd output
git clone https://aur.archlinux.org/pikaur.git

cd pikaur
makepkg -fsri

cd ..
rm -rf pikaur

sudo pacman -S xorg xorg-xinit emacs autorandr vim pulseaudio pulseaudio-bluetooth pulsemixer scrot zutty the_silver_searcher ttf-liberation awesome gimp networkmanager rofi discord gcc gdb sdl2 sdl2_image sdl2_ttf sdl2_mixer sdl2_net pkg-config mpv

pikaur -S brave-bin

./autologin.sh

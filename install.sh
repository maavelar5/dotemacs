#!/bin/bash

sudo pacman -S xorg xorg-xinit emacs autorandr vim pipewire pipewire-pulse pulsemixer flameshot kitty the_silver_searcher ttf-liberation awesome gimp networkmanager rofi discord gcc gdb sdl2 sdl2_image sdl2_ttf sdl2_mixer sdl2_net pkg-config mpv hyprland otf-font-awesome network-manager-applet pavucontrol fakeroot make keychain

rm -rf output
mkdir output

cd output
git clone https://aur.archlinux.org/pikaur.git

cd pikaur
makepkg -fsri

cd ..
rm -rf pikaur

pikaur -S brave-bin

sudo cp theasy.rasi /usr/share/rofi/themes/

./autologin.sh

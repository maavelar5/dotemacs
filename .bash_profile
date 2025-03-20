 #[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 ]] && exec startx
[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 ]] && Hyprland

source ~/.android_paths
alias myshell='adb -s adb-8064313a-FHgGJL._adb-tls-connect._tcp shell'
source ~/.config/user-dirs.dirs
PATH=~/go/bin/:$PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc
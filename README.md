Naibaf0s dotfiles
=================

This directory contains my collection of dotfiles as well as an install and
update script.

Installation 
============
**This script hasn't been kept up to date with the rest of the repository**

```bash
cd ~
git clone https://github.com/naibaf0/dotfiles .dotfiles
./.dotfiles/dot_install.sh
```

Software Base
=============

Xorg
----
* i3
* dunst
* lxrandr
* xrandr
* xclip

Wayland
-------
* sway
* wlroots
* swaybg
* swayidle
* swaylock
* slurp
* grim
* kanshi
* wdisplays-git
* waybar
* mako
* xorg-server-xwayland
* wl-clipboard
* wofi


Universal
---------
* i3blocks
* rofi
* dmenu
* neofetch
* kitty
* zsh
* neovim
* python-pynvim
* git
* pcmanfm-gtk3, gvfs
* dropbox & dropbox-cli
* lxappearance
* xarchiver
* the_silver_searcher
* fzf
* pulseaudio, pulseaudio-bluetooth, pulseaudio-alsa, pulseaudio-ctl
* pavucontrol
* pulseeffects
* libnotify
* ctags
* acpi
* shellcheck
* inxi
* pass
* rofi-pass
* physlock
* arch-audit


* otf-overpass
* ttf-fantasque-sans-mono
* otf-font-awesome

* ant-dracula-gtk-theme
* faba-icon-theme

* imv
* gpicview-gtk3
* xviewer

* blueberry

Pacman hooks
------------
* informant
* pacman-cleanup-hook
* pug
* overdue 

Extra Groups
------------
`sudo usermod -a -G $GROUP $USER`
* `video` (backlight, udev rule provided by light)
* `informant` (to read informant hook messages without sudo)
* `rfkill` (bluetooth, more precisely blueberry)

Use XWayland
------------
To force XWayland with these apps copy their `.desktop` file from 
`/usr/share/applications/$APP` to `~/.local/share/applications` and add
`env GDK_BACKEND=x11` or `env QT_QPA_PLATFORM=xcb` depending if it is an GTK or
QT application to the `Exec=` line.
After the edit run `update-desktop-database` command.
* Virtualbox
* Zoom

Wayland/Sway migration
======================

Soon:
------------
* Pipewire (screencapture, better audio/video)
* [Firefox Hardware accelerated video playback](https://bugzilla.mozilla.org/show_bug.cgi?id=1610199)

Todo:
=====
* switch to sway stable with version 1.5 again
* Pass has implemented wl-clipboard support. waiting for version bump to update and simplify pass scripts (1.7.3 -> ?)
* Use clipman clipboard manager
* Switch to versioned deoplete after python-msgpack 1.0 is out of testing repo
* Pick image viewer

Getting rid of Python2
======================
* [x] ~minecraft-launcher (gconf dropped to aur, now working with python3)~
* [x] ~GIMP (Arch removed the pygtk support, provided in gimp-python2 if needed)~
* [ ] Inkscape (Still waiting for version 1.0, beta has been out for a while)

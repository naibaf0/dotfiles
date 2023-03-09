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

Wayland Desktop (sway)
----------------------
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
* vulkan-validation-layers


Universal
---------
* thunar, thunar-volman, gvfs
* dropbox & dropbox-cli
* lxappearance
* xarchiver
* pulseaudio, pulseaudio-bluetooth, pulseaudio-alsa, pulseaudio-ctl
* pavucontrol
* libnotify
* acpi
* pass
* physlock
* arch-audit
* qalculate-gtk

* otf-overpass
* ttf-fantasque-sans-mono
* otf-font-awesome

* ant-dracula-gtk-theme
* breeze-icons
* capitaine-cursors

* imv
* gpicview-gtk3

* blueberry

Terminal & Shell
----------------
* neofetch
* inxi
* kitty
* zsh
* fzf
* ripgrep
* fd

Development
-----------
* neovim
* python-pynvim
* git

* ctags
* shellcheck

Pacman hooks
------------
* informant
* pacman-cleanup-hook
* pug
* overdue 
* arch-audit

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


#!/bin/bash
gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org
sleep 1
gsettings set org.gnome.GPaste images-support 'true'
gsettings set org.gnome.GPaste max-displayed-history-size 10
sleep 1
gsettings set org.gnome.GPaste show-history '<Super>V'
sleep 1
gnome-extensions disable ding@rastersoft.com
sleep 1
gnome-extensions enable gtk4-ding@smedius.gitlab.com
sleep 1
rm "$HOME/Desktop/Finish_Setup.sh"

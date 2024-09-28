#!/bin/bash
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'minimize-or-previews'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'quit'"
sleep 1

dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'minimize-or-previews'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'quit'"
sleep 1

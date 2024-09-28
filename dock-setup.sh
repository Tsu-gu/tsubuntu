#!/bin/bash
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
sleep 1
echo "Applying setting 1"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
sleep 1
echo "Applying setting 2"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
sleep 1
echo "Applying setting 3"
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'minimize-or-previews'"
sleep 1
echo "Applying setting 4"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
sleep 1
echo "Applying setting 5"
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'quit'"
sleep 1
echo "Applying setting 6"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
sleep 1
echo "Applying setting 7"

dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity '0.40000000000000002'
sleep 1
echo "Applying setting 8"

dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
sleep 1
echo "Re-running the same set of commands. This gave me a lot of trouble so I want to ensure everything works fine."
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
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity '0.40000000000000002'
echo "Done."

#!/bin/bash
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
sleep 1
echo "--------------------------------------------"
echo "Extending the dock to the edges"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
sleep 1
echo "--------------------------------------------"
echo "Moving the dock to the left"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
sleep 1
echo "--------------------------------------------"
echo "Disabling auto-hiding"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'minimize-or-previews'"
sleep 1
echo "--------------------------------------------"
echo "Applying clicking on an icon to minimize"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
sleep 1
echo "--------------------------------------------"
echo "Applying switch workspace by scrolling"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'quit'"
sleep 1
echo "--------------------------------------------"
echo "Applying middle click action"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
sleep 1
echo "--------------------------------------------"
echo "Removing the extra padding"
echo "--------------------------------------------"
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'FIXED'"
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity '0.66000000000000003'
sleep 1
echo "--------------------------------------------"
echo "Applying background opacity"
echo "--------------------------------------------"

# Re-running the same set of commands. This gave me a lot of trouble so I want to ensure everything works fine.
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'minimize-or-previews'"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'quit'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity '0.66000000000000003'
echo "Done."

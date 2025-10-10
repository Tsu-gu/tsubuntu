#!/bin/bash
gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org
sleep 1
gsettings set org.gnome.GPaste images-support 'true'
gsettings set org.gnome.GPaste max-displayed-history-size 10
rm "$HOME/Desktop/Finish_Setup.sh"

touch $HOME/Desktop/ReadMe.txt
echo "Type this into the terminal after a few restarts if you want the clipboard to appear after pressing Super + V like on Windows or Plasma. Don't ask me why it can't be included in the Finish_Setup. It just doesn't work." > $HOME/Desktop/ReadMe.txt
echo "--------------------------------------------"
echo "gsettings set org.gnome.GPaste show-history '<Super>V'" > $HOME/Desktop/ReadMe.txt
echo "--------------------------------------------"
echo "┌──────────────────────────────────────────┐"
echo "│  Ubuntu 25.10 is using GNOME 49 which    │"
echo "│ broke Startup Applications. That's why   │"
echo "│ you can't see the app in the app menu.   │"
echo "│                                          │"
echo "│    I recommend installing 'Ignition'     │"
echo "│     from Flathub as a replacement.       │"
echo "└──────────────────────────────────────────┘"
echo "--------------------------------------------"
echo " flatpak install io.github.flattool.Ignition"
echo "--------------------------------------------"


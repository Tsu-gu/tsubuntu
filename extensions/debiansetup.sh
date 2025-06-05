#!/bin/bash
echo "Enabling the clipboard history extension..."
gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org
sleep 1
gsettings set org.gnome.GPaste images-support 'true'
gsettings set org.gnome.GPaste max-displayed-history-size 10
sleep 1
gsettings set org.gnome.GPaste show-history '<Super>V'
sleep 1
gnome-extensions enable ding@rastersoft.com
echo "Enabling the desktop icons extension..."
gnome-extensions enable dash-to-dock@micxgx.gmail.com
sleep 1
echo "Enabling the dash to dock extension..."
gnome-extensions enable tiling-assistant@leleat-on-github
sleep 1
echo "Enabling the tiling assistant extension..."
gnome-extensions enable ubuntu-appindicators@ubuntu.com
sleep 1
echo "Enabling tray icons..."
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/dock-setup.sh && chmod +x dock-setup.sh && ./dock-setup.sh

# enable super + v to bring up the clipboard
touch $HOME/Desktop/ReadMe.txt
echo "Type this into the terminal after a few restarts if you want the clipboard to appear after pressing Super + V like on Windows or Plasma. Don't ask me why it can't be included in the Finish_Setup. It just doesn't work." > $HOME/Desktop/ReadMe.txt
echo "gsettings set org.gnome.GPaste show-history '<Super>V'" > $HOME/Desktop/ReadMe.txt

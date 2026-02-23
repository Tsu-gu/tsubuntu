#!/bin/bash
gnome-extensions enable copyous@boerdereinar.dev
sleep 1
dconf write /org/gnome/shell/extensions/copyous/show-at-pointer true 
dconf write /org/gnome/shell/extensions/copyous/clipboard-orientation 'vertical'
dconf write /org/gnome/shell/extensions/copyous/dynamic-item-height true
dconf write /org/gnome/shell/extensions/copyous/open-clipboard-dialog-shortcut "['<Super>v']"

touch $HOME/Desktop/ReadMe.txt
echo "Type this into the terminal after a few restarts if you want the clipboard to appear after pressing Super + V like on Windows or Plasma. Don't ask me why it can't be included in the Finish_Setup. It just doesn't work." > $HOME/Desktop/ReadMe.txt
echo "--------------------------------------------"
echo "gsettings set org.gnome.GPaste show-history '<Super>V'" >> $HOME/Desktop/ReadMe.txt
echo "--------------------------------------------"


# InstallAllRecommended
touch "$HOME/Desktop/InstallAllRecommended.sh"
echo "notify-send -a Tsubuntu \"Installing recommended apps, please wait a few minutes\"" >> "$HOME/Desktop/InstallAllRecommended.sh"
echo "flatpak install io.github.flattool.Ignition page.codeberg.libre_menu_editor.LibreMenuEditor it.mijorus.gearlever io.github.kolunmi.Bazaar -y" >> "$HOME/Desktop/InstallAllRecommended.sh"
echo "notify-send -a Tsubuntu \"Recommended apps installed\"" >> "$HOME/Desktop/InstallAllRecommended.sh"
chmod +x "$HOME/Desktop/InstallAllRecommended.sh"

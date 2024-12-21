#!/bin/bash
extensionsrepo="https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/extensions/"
echo "┌──────────────────────────────────────────┐"
echo "│⚙       Tsubuntu for Ubuntu 25.04      ⚙ │"
echo "└──────────────────────────────────────────┘"

sudo apt install gnome-tweaks flatpak unzip gnome-extensions-app dconf-editor libfuse2 gnome-software-plugin-snap gnome-software-plugin-flatpak gnome-software gufw timeshift -y
echo "┌──────────────────────────────────────────┐"
echo "│Adding Flathub...                         │"                        
echo "└──────────────────────────────────────────┘"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "┌──────────────────────────────────────────┐"
echo "│Enabling right click > new file...        │"                        
echo "└──────────────────────────────────────────┘"

touch $HOME/Templates/NewFile.txt

# extensions making gnome usable

# Yes, this is necessary. It took me a long while to figure out why this damned script would only install one extension.
mkdir $HOME/.local/share/gnome-shell/extensions/

# Seems like version 45 supports both gnome 46 and 47, and is the latest.

echo "┌──────────────────────────────────────────┐"
echo "│Installing clipboard history extension... │"                        
echo "└──────────────────────────────────────────┘"

cd $HOME
downloadedzip2="clipboard-historyalexsaveau.dev.v45.shell-extension.zip"
linktozip2="https://extensions.gnome.org/extension-data/clipboard-historyalexsaveau.dev.v45.shell-extension.zip"
alternativelinktozip2="$extensionsrepo$downloadedzip2"
folder2="clipboard-history@alexsaveau.dev"

mkdir $folder2
cd $folder2
wget --server-response $linktozip2 || wget $alternativelinktozip2
unzip $downloadedzip2
rm $downloadedzip2
cd $HOME
mv $folder2 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Tweaking the file manager and the dock... │"                        
echo "└──────────────────────────────────────────┘"
echo "file:///home/$USER/Desktop" >> ~/.config/gtk-3.0/bookmarks
gsettings set org.gnome.nautilus.preferences show-create-link 'true'
gsettings set org.gnome.nautilus.preferences show-delete-permanently 'true'
gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'quit'

echo "┌──────────────────────────────────────────┐"
echo "│Tweaking the text editor...               │"                        
echo "└──────────────────────────────────────────┘"

# This makes the file manager look very similar to how Gnome 42's file manager behaved
gsettings set org.gnome.TextEditor show-line-numbers 'true'
gsettings set org.gnome.TextEditor spellcheck 'false'

echo "┌──────────────────────────────────────────┐"
echo "│Remember numlock state...                 │"                        
echo "└──────────────────────────────────────────┘"
gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state 'true'
echo "┌──────────────────────────────────────────┐"
echo "│Setting up shortcuts (try Super + E)      │"
echo "└──────────────────────────────────────────┘"

gsettings set org.gnome.shell.keybindings screenshot "['Print']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Super>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'taskmanager'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-system-monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Shift>Escape'

touch "$HOME/Desktop/Finish_Setup.sh"
chmod +x "$HOME/Desktop/Finish_Setup.sh"
echo '#!/bin/bash
gnome-extensions enable clipboard-history@alexsaveau.dev
sleep 1
rm "$HOME/Desktop/Finish_Setup.sh"
' >> "$HOME/Desktop/Finish_Setup.sh"
echo -e "\e[1;31m┌──────────────────────────────────────────┐\e[0m"
echo "│This script installed a software center   │"
echo "│app with support for Snap, Flatpak and    │"
echo "│native packages. This makes the default   │"
echo "│snap-store redundant.                     │"
echo -e "\e[1;31m└──────────────────────────────────────────┘\e[0m"
read -p "Do you want to remove the Snap Store? [y/n]: " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    sudo snap remove snap-store
else
    echo "┌──────────────────────────────────────────┐"
    echo "│Understandable. Keeping the snap-store.   │"
    echo "└──────────────────────────────────────────┘"
fi
    echo "┌──────────────────────────────────────────┐"
    echo "│Restart your PC and then run              │"
    echo "│Finish_Setup.sh, located on your desktop  │"
    echo "└──────────────────────────────────────────┘"
    read -p "Press Enter to close...."
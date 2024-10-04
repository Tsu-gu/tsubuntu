#!/bin/bash
echo "--------------------------------------------"
echo "          Tsubuntu for Ubuntu 22.04         "
echo "--------------------------------------------"
sudo apt install gnome-tweaks flatpak unzip gnome-extensions-app dconf-editor libfuse2 gnome-software-plugin-snap gnome-software-plugin-flatpak gnome-software webp-pixbuf-loader -y
# libfuse2 in order for all AppImages to run
echo "--------------------------------------------"
echo "Adding Flathub..."
echo "--------------------------------------------"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "--------------------------------------------"
echo "Enabling right click > new file..."
echo "--------------------------------------------"
touch $HOME/Templates/NewFile.txt

echo "Enabling webp support..."
echo "--------------------------------------------"

xdg-mime default org.gnome.eog.desktop image/webp

# extensions making gnome usable

# Yes, this is necessary. It took me a long while to figure out why this damned script would only install one extension.
mkdir $HOME/.local/share/gnome-shell/extensions/

echo "--------------------------------------------"
echo "Installing clipboard management extension..."
echo "--------------------------------------------"
cd $HOME
downloadedzip2="clipboard-historyalexsaveau.dev.v41.shell-extension.zip"
linktozip2="https://extensions.gnome.org/extension-data/clipboard-historyalexsaveau.dev.v41.shell-extension.zip"
folder2="clipboard-history@alexsaveau.dev"

mkdir $folder2
cd $folder2
wget $linktozip2
unzip $downloadedzip2
rm $downloadedzip2
cd $HOME
mv $folder2 $HOME/.local/share/gnome-shell/extensions/

echo "--------------------------------------------"
echo "Installing corner tiling extension..."
echo "--------------------------------------------"
cd $HOME
downloadedzip1="tiling-assistantleleat-on-github.v36.shell-extension.zip"
linktozip1="https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v36.shell-extension.zip"
folder1="tiling-assistant@leleat-on-github"

mkdir $folder1
cd $folder1
wget $linktozip1
unzip $downloadedzip1
rm $downloadedzip1
cd $HOME
mv $folder1 $HOME/.local/share/gnome-shell/extensions/


echo "--------------------------------------------"
echo "Tweaking the file manager and ubuntu dock..."
echo "--------------------------------------------"
gsettings set org.gnome.nautilus.preferences show-create-link 'true'
gsettings set org.gnome.nautilus.preferences show-delete-permanently 'true'
gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'quit'

echo "Remember numlock state..."
echo "--------------------------------------------"

gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state 'true'

echo "Setting up useful shortcuts (try Super + E)"
echo "--------------------------------------------"

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
gnome-extensions enable tiling-assistant@leleat-on-github
sleep 1
rm "$HOME/Desktop/Finish_Setup.sh"
' >> "$HOME/Desktop/Finish_Setup.sh"

echo "--------------------------------------------"
echo "This script installed a software center app "
echo "with support for Snap, Flatpak and native   "
echo "packages. This makes the default snap-store "
echo "redundant.                                  "
echo "--------------------------------------------"
read -p "Do you want to remove the Snap Store? [y/n]: " choice


if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    sudo snap remove snap-store
else
    echo "--------------------------------------------"
    echo "Understandable. Keeping the snap-store."
    echo "--------------------------------------------"
fi
    echo "--------------------------------------------"
    echo "Restart your PC and then run Finish_Setup.sh"
    echo "(on your desktop)"
    echo "--------------------------------------------"
    read -p "Press Enter to close...."

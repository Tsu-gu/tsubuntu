#!/bin/bash
# Fun fact: this was my first distro, so I thought why not also make the script work for it. All that was needed was to add the ppa for webp support and to change the area screenshot shortcut.
echo "┌──────────────────────────────────────────┐"
echo "│         Tsubuntu for Ubuntu 20.04        │"
echo "└──────────────────────────────────────────┘"

# I tend to avoid PPAs, but having webp support is worth it
sudo add-apt-repository ppa:ubuntuhandbook1/webp-pixbuf-loader -y
sudo apt install webp-pixbuf-loader gnome-tweaks gdebi flatpak unzip dconf-editor gnome-shell-extensions gnome-software-plugin-snap gnome-software-plugin-flatpak gnome-software gufw timeshift -y

echo "┌──────────────────────────────────────────┐"
echo "│Adding Flathub...                         │"                        
echo "└──────────────────────────────────────────┘"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "┌──────────────────────────────────────────┐"
echo "│Enabling right click > new file...        │"                        
echo "└──────────────────────────────────────────┘"
touch $HOME/Templates/NewFile.txt

echo "┌──────────────────────────────────────────┐"
echo "│Enabling webp support...                  │"
echo "└──────────────────────────────────────────┘"
xdg-mime default org.gnome.eog.desktop image/webp

# extensions making gnome usable

# Yes, this is necessary. It took me a long while to figure out why this damned script would only install one extension.

mkdir $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Installing clipboard history extension... │"                        
echo "└──────────────────────────────────────────┘"
cd $HOME
downloadedzip2="clipboard-indicatortudmotu.com.v34.shell-extension.zip"
linktozip2="https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v34.shell-extension.zip"
alternativelinktozip2="$extensionsrepo$downloadedzip2"
folder2="clipboard-indicator@tudmotu.com"

mkdir $folder2
cd $folder2
wget --server-response $linktozip2 || wget $alternativelinktozip2
unzip $downloadedzip2
rm $downloadedzip2
cd $HOME
mv $folder2 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Installing corner tiling extension...     │"                        
echo "└──────────────────────────────────────────┘"

cd $HOME
downloadedzip1="tiling-assistantleleat-on-github.v23.shell-extension.zip"
linktozip1="https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v23.shell-extension.zip"
alternativelinktozip1="$extensionsrepo$downloadedzip1"
folder1="tiling-assistant@leleat-on-github"

mkdir $folder1
cd $folder1
wget --server-response $linktozip1 || wget $alternativelinktozi1
unzip $downloadedzip1
rm $downloadedzip1
cd $HOME
mv $folder1 $HOME/.local/share/gnome-shell/extensions/

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
echo "│Remember numlock state...                 │"                        
echo "└──────────────────────────────────────────┘"

gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state 'true'
echo "┌──────────────────────────────────────────┐"
echo "│Setting up shortcuts (try Super + E)      │"
echo "└──────────────────────────────────────────┘"

gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['<Shift><Super>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'taskmanager'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-system-monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Shift>Escape'


touch "$HOME/Desktop/Finish_Setup.sh"
chmod +x "$HOME/Desktop/Finish_Setup.sh"
echo '#!/bin/bash
gnome-extensions enable clipboard-indicator@tudmotu.com
sleep 1
gnome-extensions enable tiling-assistant@leleat-on-github
sleep 1
rm "$HOME/Desktop/Finish_Setup.sh"
' >> "$HOME/Desktop/Finish_Setup.sh"
echo -e "\e[1;31m┌──────────────────────────────────────────┐\e[0m"
echo "│This script installed a software center   │"
echo "│app with support for Snap, Flatpak and    │"
echo "│native packages. This makes the default   │"
echo "│Snap Store redundant.                     │"
echo -e "\e[1;31m└──────────────────────────────────────────┘\e[0m"
read -p "│Remove the Snap Store?              [y/n]:│" choice


if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    sudo snap remove snap-store
else
    echo "┌──────────────────────────────────────────┐"
    echo "│Understandable. Keeping the snap-store.   │"
    echo "└──────────────────────────────────────────┘"
fi
 read -p "│Enable firewall?                    [y/n]:│" choice


if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw enable
else
    echo "┌──────────────────────────────────────────┐"
    echo "│Understandable.                           │"
    echo "└──────────────────────────────────────────┘"
fi

echo "Focal Fossa (20.04) reached the end of its standard"
echo "support, however it still has 5 more years ahead of"
echo "itself if you just create an account."
read -p "Attach Ubuntu Pro now?                [y/n]: " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    xdg-open 'https://ubuntu.com/pro/dashboard'
   
else
    echo "┌──────────────────────────────────────────┐"
    echo "│Understandable. Skipping Ubuntu Pro.     │"
    echo "└──────────────────────────────────────────┘"
fi


    echo "┌──────────────────────────────────────────┐"
    echo "│Restart your PC and then run              │"
    echo "│Finish_Setup.sh, located on your desktop  │"
    echo "└──────────────────────────────────────────┘"
    read -p "Press Enter to close...."

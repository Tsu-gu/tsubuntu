#!/bin/bash
echo "┌──────────────────────────────────────────┐"
echo "│    Tsubuntu for RHEL10 and derivatives   │"
echo "└──────────────────────────────────────────┘"

echo "┌──────────────────────────────────────────┐"
echo "│Adding EPEL...                            │"                        
echo "└──────────────────────────────────────────┘"
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
sudo dnf upgrade

# This was quite the jumpscare. Rocky not having wget preinstalled by default.
sudo dnf install gnome-tweaks unzip gnome-extensions-app dconf-editor wget firewall-config -y

echo "┌──────────────────────────────────────────┐"
echo "│Installing Snap...                        │"                        
echo "└──────────────────────────────────────────┘"
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo dnf install gnome-tweaks unzip gnome-extensions-app dconf-editor snapd -y

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

echo "┌──────────────────────────────────────────┐"
echo "│Installing clipboard history extension... │"                        
echo "└──────────────────────────────────────────┘"
cd $HOME
downloadedzip1="clipboard-indicatortudmotu.com.v38.shell-extension.zip"
linktozip1="https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v38.shell-extension.zip"
alternativelinktozip1="$extensionsrepo$downloadedzip1"
folder1="clipboard-indicator@tudmotu.com"

mkdir $folder1
cd $folder1
wget --server-response $linktozip1 || wget $alternativelinktozip1
unzip $downloadedzip1
rm $downloadedzip1
cd $HOME
mv $folder1 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Installing desktop icons extension...     │"                        
echo "└──────────────────────────────────────────┘"
cd $HOME
downloadedzip2="dingrastersoft.com.v63.shell-extension.zip"
linktozip2="https://extensions.gnome.org/extension-data/dingrastersoft.com.v63.shell-extension.zip"
folder2="ding@rastersoft.com"

mkdir $folder2
cd $folder2
wget $linktozip2
unzip $downloadedzip2
rm $downloadedzip2
cd $HOME
mv $folder2 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Installing corner tiling extension...     │"                        
echo "└──────────────────────────────────────────┘"
cd $HOME
downloadedzip3="tiling-assistantleleat-on-github.v32.shell-extension.zip"
linktozip3="https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v32.shell-extension.zip"
folder3="tiling-assistant@leleat-on-github"

mkdir $folder3
cd $folder3
wget $linktozip3
unzip $downloadedzip3
rm $downloadedzip3
cd $HOME
mv $folder3 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Installing dash to dock...                │"                        
echo "└──────────────────────────────────────────┘"
cd $HOME
downloadedzip4="dash-to-dockmicxgx.gmail.com.v84.shell-extension.zip"
linktozip4="https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v84.shell-extension.zip"
folder4="dash-to-dock@micxgx.gmail.com"

mkdir $folder4
cd $folder4
wget $linktozip4
unzip $downloadedzip4
rm $downloadedzip4
cd $HOME
mv $folder4 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Installing tray icons extension...        │"                        
echo "└──────────────────────────────────────────┘"

cd $HOME
downloadedzip4="appindicatorsupportrgcjonas.gmail.com.v53.shell-extension.zip"
linktozip4="https://extensions.gnome.org/extension-data/appindicatorsupportrgcjonas.gmail.com.v53.shell-extension.zip"
folder4="appindicatorsupport@rgcjonas.gmail.com"

mkdir $folder4
cd $folder4
wget $linktozip4
unzip $downloadedzip4
rm $downloadedzip4
cd $HOME
mv $folder4 $HOME/.local/share/gnome-shell/extensions/

echo "┌──────────────────────────────────────────┐"
echo "│Adding (_)([])(X) buttons...              │"                        
echo "└──────────────────────────────────────────┘"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"


echo "┌──────────────────────────────────────────┐"
echo "│Tweaking the file manager...              │"                        
echo "└──────────────────────────────────────────┘"
echo "file:///home/$USER/Desktop" >> ~/.config/gtk-3.0/bookmarks
gsettings set org.gnome.nautilus.preferences show-create-link 'true'
gsettings set org.gnome.nautilus.preferences show-delete-permanently 'true'
gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

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

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Primary><Alt>t'


# I know how stupid this looks but when I tried to put the content of dock-setup.sh into this echo section it would not work properly. 
touch "$HOME/Desktop/Finish_Setup.sh"
chmod +x "$HOME/Desktop/Finish_Setup.sh"
echo '#!/bin/bash
gnome-extensions enable clipboard-indicator@tudmotu.com
sleep 1
echo "Enabling the clipboard history extension..."
gnome-extensions enable ding@rastersoft.com
sleep 1
echo "Enabling the desktop icons extension..."
gnome-extensions enable dash-to-dock@micxgx.gmail.com
sleep 1
echo "Enabling the dash to dock extension..."
gnome-extensions enable tiling-assistant@leleat-on-github
sleep 1
echo "Enabling the tiling assistant extension..."
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
sleep 1
echo "Enabling tray icons..."
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/dock-setup.sh && chmod +x dock-setup.sh && ./dock-setup.sh
' >> "$HOME/Desktop/Finish_Setup.sh"

echo "┌──────────────────────────────────────────┐"
echo "│Restart your PC and then run              │"
echo "│Finish_Setup.sh, located on your desktop  │"
echo "└──────────────────────────────────────────┘"
read -p "Press Enter to close...."

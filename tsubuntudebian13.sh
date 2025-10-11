#!/bin/bash
extensionsrepo="https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/extensions/"
echo "┌──────────────────────────────────────────┐"
echo "│         Tsubuntu for Debian 13           │"
echo "└──────────────────────────────────────────┘"
echo "│Before you run this, make sure your user  │"
echo "│is in the sudoers file. Running this      │"
echo "│script as root directly will not work.    │"    
echo "│                                          │"
echo "│su                                        │"
echo "│sudo usermod -aG sudo $USER               │"
echo "│reboot                                    │"
echo "└──────────────────────────────────────────┘"
sudo apt install gnome-shell-extension-appindicator pkexec notify-send gnome-shell-extension-gpaste gnome-shell-extension-dashtodock gnome-shell-extension-desktop-icons-ng gnome-shell-extension-tiling-assistant gnome-tweaks wget bash-completion command-not-found flatpak unzip gdebi gnome-shell-extensions-prefs dconf-editor libfuse2t64 snapd mtp-tools gvfs-backends gufw timeshift -y
# libfuse2 in order for all AppImages to run, mtp-tools for being able to plug in your phone and transfer data
sudo systemctl enable --now snapd.socket
# for classic snaps to run. If you really hate snap, just remove these lines.
sudo ln -s /var/lib/snapd/snap /snap

echo "┌──────────────────────────────────────────┐"
echo "│Adding Flathub...                         │"                        
echo "└──────────────────────────────────────────┘"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "┌──────────────────────────────────────────┐"
echo "│Enabling right click > new file...        │"                        
echo "└──────────────────────────────────────────┘"
touch $HOME/Templates/NewFile.txt

echo "┌──────────────────────────────────────────┐"
echo "│Installing clipboard history extension... │"                        
echo "└──────────────────────────────────────────┘"
# This has to be bound to something else as by default it's also Super V for whatever reason. 
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>n']"

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
echo "│Tweaking the text editor...               │"                        
echo "└──────────────────────────────────────────┘"
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

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Primary><Alt>t'

wget -q $extensionsrepo/debiansetup.sh
cp debiansetup.sh $HOME/Desktop/Finish_Setup.sh
chmod +x "$HOME/Desktop/Finish_Setup.sh"

echo -e "\e[1;31m────────────────────────────────────────────\e[0m"

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

echo "┌──────────────────────────────────────────┐"
echo "│Restart your PC and then run              │"
echo "│Finish_Setup.sh, located on your desktop  │"
echo "└──────────────────────────────────────────┘"
read -p "Press Enter to close...."

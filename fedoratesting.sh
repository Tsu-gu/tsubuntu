#!/bin/bash
echo "┌──────────────────────────────────────────┐"
echo "│         Tsubuntu for Fedora 41           │"
echo "└──────────────────────────────────────────┘"
# Fedora does not support gnome-software-plugin-snap
sudo dnf install gnome-tweaks unzip gnome-extensions-app dconf-editor snapd firewall-config bash-completion -y
# fuse in order for all AppImages to run
# for classic snaps to run. If you really hate snap, just remove these lines. Also I think fedora can't run snaps in confinement anyways due to using SELinux.
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

wget -q $extensionsrepo/fedorasetup.sh
cp fedorasetup.sh $HOME/Desktop/Finish_Setup.sh
chmod +x "$HOME/Desktop/Finish_Setup.sh"

echo "┌──────────────────────────────────────────┐"
echo "│Restart your PC and then run              │"
echo "│Finish_Setup.sh, located on your desktop  │"
echo "└──────────────────────────────────────────┘"
read -p "Press Enter to close...."

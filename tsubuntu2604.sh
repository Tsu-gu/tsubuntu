#!/bin/bash
extensionsrepo="https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/extensions/"
echo "┌──────────────────────────────────────────┐"
echo "│     Tsubuntu for Ubuntu 26.04 LTS        │"
echo "└──────────────────────────────────────────┘"
sudo apt install gir1.2-gda-5.0 gir1.2-gsound-1.0 gnome-tweaks flatpak dconf-editor libfuse2t64 gnome-shell-extension-manager gufw timeshift software-properties-gtk -y

# libfuse2t64 in order for all AppImages to run. Many AppImages are built depending on this old version. Like it or not you either have it installed or half of them won't run. 
# software-properties-gtk to return the driver manager and Software & Updates
echo "┌──────────────────────────────────────────┐"
echo "│Adding Flathub...                         │"                        
echo "└──────────────────────────────────────────┘"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "┌──────────────────────────────────────────┐"
echo "│Enabling right click > new file...        │"                        
echo "└──────────────────────────────────────────┘"
test -f $HOME/Templates/NewFile.txt || touch $HOME/Templates/NewFile.txt

echo "┌──────────────────────────────────────────┐"
echo "│Installing a clipboard manager            │"                        
echo "└──────────────────────────────────────────┘"
# This has to be bound to something else as by default it's also Super V for whatever reason. 
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>n']"

cd $HOME/Downloads
wget https://github.com/boerdereinar/copyous/releases/download/v1.3.0/copyous@boerdereinar.dev.zip
gnome-extensions install -f ~/Downloads/copyous@boerdereinar.dev.zip


echo "┌──────────────────────────────────────────┐"
echo "│Tweaking the file manager and the dock... │"                        
echo "└──────────────────────────────────────────┘"
echo "file:///home/$USER/Desktop" >> ~/.config/gtk-3.0/bookmarks
gsettings set org.gnome.nautilus.preferences show-create-link 'true'
gsettings set org.gnome.nautilus.preferences show-delete-permanently 'true'
gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# Got rid of this because I found the default dash to dock behaviour is better
# gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'quit'

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


wget -q $extensionsrepo/ubuntu2604setup.sh
cp ubuntu2604setup.sh $HOME/Desktop/Finish_Setup.sh
chmod +x "$HOME/Desktop/Finish_Setup.sh"

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

read -p "│Skip shut down confirmation?        [y/n]:│" choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    gsettings set org.gnome.SessionManager logout-prompt false
else
    gsettings set org.gnome.SessionManager logout-prompt true
    echo "┌──────────────────────────────────────────┐"
    echo "│Understandable.                           │"
    echo "└──────────────────────────────────────────┘"
fi

read -p "│Move app launcher to the top of the panel? [y/n]:│" choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top true
else
    dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top false
    echo "┌──────────────────────────────────────────┐"
    echo "│Understandable.                           │"
    echo "└──────────────────────────────────────────┘"
fi

    echo "┌──────────────────────────────────────────┐"
    echo "│Restart your PC and then run              │"
    echo "│Finish_Setup.sh, located on your desktop  │"
    echo "└──────────────────────────────────────────┘"
    read -p "Press Enter to close...."

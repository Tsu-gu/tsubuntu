#!/bin/bash
echo "--------------------------------------------"

echo "Before you run this, make sure your user is in the sudoers file."
echo "su"
echo "sudo usermod -aG sudo $USER"
echo "reboot"
echo "--------------------------------------------"
sudo apt install gnome-tweaks flatpak unzip gdebi gnome-extensions-app dconf-editor libfuse2 snapd -y
# libfuse2 in order for all AppImages to run
sudo systemctl enable --now snapd.socket
# for classic snaps to run
sudo ln -s /var/lib/snapd/snap /snap

echo "--------------------------------------------"
echo "Adding Flathub..."
echo "--------------------------------------------"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "--------------------------------------------"
echo "Enabling right click > new file..."
echo "--------------------------------------------"
touch $HOME/Templates/NewFile.txt

# extensions making gnome usable

# Yes, this is necessary. It took me a long while to figure out why this damned script would only install one extension.
mkdir $HOME/.local/share/gnome-shell/extensions/

echo "--------------------------------------------"
echo "Installing clipboard management extension..."
echo "--------------------------------------------"
cd $HOME
downloadedzip1="clipboard-historyalexsaveau.dev.v41.shell-extension.zip"
linktozip1="https://extensions.gnome.org/extension-data/clipboard-historyalexsaveau.dev.v41.shell-extension.zip"
folder1="clipboard-history@alexsaveau.dev"

mkdir $folder1
cd $folder1
wget $linktozip1
unzip $downloadedzip1
rm $downloadedzip1
cd $HOME
mv $folder1 $HOME/.local/share/gnome-shell/extensions/

echo "--------------------------------------------"
echo "Installing desktop icons extension..."
echo "--------------------------------------------"
cd $HOME
downloadedzip2="gtk4-dingsmedius.gitlab.com.v60.shell-extension.zip"
linktozip2="https://extensions.gnome.org/extension-data/gtk4-dingsmedius.gitlab.com.v60.shell-extension.zip"
folder2="gtk4-ding@smedius.gitlab.com"

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
downloadedzip3="tiling-assistantleleat-on-github.v45.shell-extension.zip"
linktozip3="https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v45.shell-extension.zip"
folder3="tiling-assistant@leleat-on-github"

mkdir $folder3
cd $folder3
wget $linktozip3
unzip $downloadedzip3
rm $downloadedzip3
cd $HOME
mv $folder3 $HOME/.local/share/gnome-shell/extensions/

echo "--------------------------------------------"
echo "Installing dash to dock..."
echo "--------------------------------------------"
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


echo "--------------------------------------------"
echo "Tweaking the file manager and ubuntu dock..."
echo "--------------------------------------------"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.nautilus.preferences show-create-link 'true'
gsettings set org.gnome.nautilus.preferences show-delete-permanently 'true'
gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

echo "--------------------------------------------"
echo "Remember numlock state..."
echo "--------------------------------------------"

gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state 'true'

echo "--------------------------------------------"
echo "Setting up useful shortcuts (try Super + E)"
echo "--------------------------------------------"

gsettings set org.gnome.shell.keybindings screenshot "['Print']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Shift><Super>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'taskmanager'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-system-monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Shift>Escape'

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'


touch "$HOME/Desktop/Finish_Setup.sh"
chmod +x "$HOME/Desktop/Finish_Setup.sh"
echo '#!/bin/bash
gnome-extensions enable clipboard-history@alexsaveau.dev
sleep 1
gnome-extensions enable gtk4-ding@smedius.gitlab.com
sleep 1
gnome-extensions enable dash-to-dock@micxgx.gmail.com
sleep 1
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
dconf write /org/gnome/shell/extensions/dash-to-dock/click-action "'minimize-or-previews'"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'switch-workspace'"
dconf write /org/gnome/shell/extensions/dash-to-dock/middle-click-action "'quit'"
gnome-extensions enable tiling-assistant@leleat-on-github
sleep 1
rm "$HOME/Desktop/Finish_Setup.sh"
' >> "$HOME/Desktop/Finish_Setup.sh"

echo "--------------------------------------------------------------"
echo "Restart your PC and then run Finish_Setup.sh (on your desktop)"
echo "--------------------------------------------------------------"
read -p "Press Enter to close...."
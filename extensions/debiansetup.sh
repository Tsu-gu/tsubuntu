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

touch "$HOME/Desktop/Finish_Setup.sh"
chmod +x "$HOME/Desktop/Finish_Setup.sh"
echo '#!/bin/bash
gnome-extensions enable clipboard-history@alexsaveau.dev
sleep 1
echo "Enabling the clipboard history extension..."
gnome-extensions enable gtk4-ding@smedius.gitlab.com
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

# InstallAppImageIntegrator.sh
touch "$HOME/Desktop/InstallAppImageIntegrator.sh"
echo "#!/bin/bash" > "$HOME/Desktop/InstallAppImageIntegrator.sh"
echo "notify-send -a Tsubuntu \"Installing app, please wait a few minutes\"" >> "$HOME/Desktop/InstallAppImageIntegrator.sh"
echo "flatpak install it.mijorus.gearlever -y" >> "$HOME/Desktop/InstallAppImageIntegrator.sh"
echo "notify-send -a Tsubuntu \"GearLever installed\"" >> "$HOME/Desktop/InstallAppImageIntegrator.sh"
chmod +x "$HOME/Desktop/InstallAppImageIntegrator.sh"

# InstallStartupApps.sh
touch "$HOME/Desktop/InstallStartupApps.sh"
echo "#!/bin/bash" > "$HOME/Desktop/InstallStartupApps.sh"
echo "notify-send -a Tsubuntu \"Installing app, please wait a few minutes\"" >> "$HOME/Desktop/InstallStartupApps.sh"
echo "flatpak install io.github.flattool.Ignition -y" >> "$HOME/Desktop/InstallStartupApps.sh"
echo "notify-send -a Tsubuntu \"Ignition installed\"" >> "$HOME/Desktop/InstallStartupApps.sh"
chmod +x "$HOME/Desktop/InstallStartupApps.sh"

# InstallFlatpakAppStore.sh
touch "$HOME/Desktop/InstallFlatpakAppStore.sh"
echo "#!/bin/bash" > "$HOME/Desktop/InstallFlatpakAppStore.sh"
echo "notify-send -a Tsubuntu \"Installing app, please wait a few minutes\"" >> "$HOME/Desktop/InstallFlatpakAppStore.sh"
echo "flatpak install io.github.kolunmi.Bazaar -y" >> "$HOME/Desktop/InstallFlatpakAppStore.sh"
echo "notify-send -a Tsubuntu \"Bazaar installed\"" >> "$HOME/Desktop/InstallFlatpakAppStore.sh"
chmod +x "$HOME/Desktop/InstallFlatpakAppStore.sh"

# InstallSnapAppCentre.sh
touch "$HOME/Desktop/InstallSnapAppCentre.sh"
echo "#!/bin/bash" > "$HOME/Desktop/InstallSnapAppCentre.shh"
echo "notify-send -a Tsubuntu \"Installing app, please wait a few minutes\"" >> "$HOME/Desktop/InstallSnapAppCentre.sh"
echo "pkexec snap install snap-store" >> "$HOME/Desktop/InstallSnapAppCentre.sh"
echo "notify-send -a Tsubuntu \"App Centre installed\"" >> "$HOME/Desktop/InstallSnapAppCentre.sh"
chmod +x "$HOME/Desktop/InstallSnapAppCentre.sh"

# InstallMenuEditor.sh
touch "$HOME/Desktop/InstallMenuEditor.sh"
echo "notify-send -a Tsubuntu \"Installing app, please wait a few minutes\"" >> "$HOME/Desktop/InstallMenuEditor.sh"
echo "flatpak install page.codeberg.libre_menu_editor.LibreMenuEditor -y" >> "$HOME/Desktop/InstallMenuEditor.sh"
echo "notify-send -a Tsubuntu \"Main Menu installed\"" >> "$HOME/Desktop/InstallMenuEditor.sh"
chmod +x "$HOME/Desktop/InstallMenuEditor.sh"

# InstallAllRecommended
touch "$HOME/Desktop/InstallAllRecommended.sh"
echo "notify-send -a Tsubuntu \"Installing recommended apps, please wait a few minutes\"" >> "$HOME/Desktop/InstallAllRecommended.sh"
echo "pkexec snap install snap-store" >> "$HOME/Desktop/InstallAllRecommended.sh"
echo "flatpak install page.codeberg.libre_menu_editor.LibreMenuEditor it.mijorus.gearlever io.github.kolunmi.Bazaar -y" >> "$HOME/Desktop/InstallAllRecommended.sh"
echo "notify-send -a Tsubuntu \"Recommended apps installed\"" >> "$HOME/Desktop/InstallAllRecommended.sh"
chmod +x "$HOME/Desktop/InstallAllRecommended.sh"

# enable super + v to bring up the clipboard
touch $HOME/Desktop/ReadMe.txt
echo "Type this into the terminal after a few restarts if you want the clipboard to appear after pressing Super + V like on Windows or Plasma. Don't ask me why it can't be included in the Finish_Setup. It just doesn't work." > $HOME/Desktop/ReadMe.txt
echo "gsettings set org.gnome.GPaste show-history '<Super>V'" > $HOME/Desktop/ReadMe.txt

#!/bin/bash
gnome-extensions enable GPaste@gnome-shell-extensions.gnome.org
sleep 1
gsettings set org.gnome.GPaste images-support 'true'
gsettings set org.gnome.GPaste max-displayed-history-size 10
rm "$HOME/Desktop/Finish_Setup.sh"

touch $HOME/Desktop/ReadMe.txt
echo "Type this into the terminal after a few restarts if you want the clipboard to appear after pressing Super + V like on Windows or Plasma. Don't ask me why it can't be included in the Finish_Setup. It just doesn't work." > $HOME/Desktop/ReadMe.txt
echo "--------------------------------------------"
echo "gsettings set org.gnome.GPaste show-history '<Super>V'" >> $HOME/Desktop/ReadMe.txt
echo "--------------------------------------------"

touch $HOME/Desktop/InstallStartupApps.sh
echo "#!/bin/bash" > $HOME/Desktop/InstallStartupApps.sh
echo "flatpak install io.github.flattool.Ignition -y" >> $HOME/Desktop/InstallStartupApps.sh
chmod +x $HOME/Desktop/InstallStartupApps.sh

touch $HOME/Desktop/InstallFlatpakAppStore.sh
echo "#!/bin/bash" > $HOME/Desktop/InstallFlatpakAppStore.sh
echo "flatpak install io.github.kolunmi.Bazaar -y" >> $HOME/Desktop/InstallFlatpakAppStore.sh
chmod +x $HOME/Desktop/InstallFlatpakAppStore.sh

touch $HOME/Desktop/InstallAppImageIntegrator.sh
echo "#!/bin/bash" > $HOME/Desktop/InstallAppImageIntegrator.sh
echo "flatpak install it.mijorus.gearlever -y" >> $HOME/Desktop/InstallAppImageIntegrator.sh
chmod +x $HOME/Desktop/InstallAppImageIntegrator.sh


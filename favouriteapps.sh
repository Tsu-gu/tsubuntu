#!/bin/bash
sudo snap install vlc keepassxc
sudo apt install syncthing
flatpak install -assumeyes flathub it.mijorus.gearlever org.qbittorrent.qBittorrent org.gimp.GIMP org.kde.kdenlive org.nicotine_plus.Nicotine 


# filen install and integration into the desktop
wget https://cdn.filen.io/desktop/release/filen_x86_64.AppImage
mkdir $HOME/AppImages/
cp filen_x86_64.AppImage $HOME/AppImages/filen.appimage
rm filen_x86_64.AppImage
chmod +x $HOME/AppImages/filen.appimage

wget https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/filen.png
mkdir $HOME/AppImages/.icons/
mv filen.png $HOME/AppImages/.icons/

wget https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/filen.desktop
awk -v home="$HOME" '{gsub("/home/tsugu", home); print}' filen.desktop > new_filen.desktop
cp new_filen.desktop $HOME/.local/share/applications/filen.desktop
chmod +x $HOME/.local/share/applications/filen.desktop
rm new_filen.desktop
rm filen.desktop
read -p "Press Enter to close...."

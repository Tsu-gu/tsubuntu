#!/bin/bash
# flatpak install -assumeyes flathub it.mijorus.gearlever org.qbittorrent.qBittorrent org.gimp.GIMP org.kde.kdenlive org.nicotine_plus.Nicotine 
# snap install vlc keepassxc
wget https://cdn.filen.io/desktop/release/filen_x86_64.AppImage
mkdir $HOME/AppImages/
cp filen_x86_64.AppImage $HOME/AppImages/filen.appimage
rm filen_x86_64.AppImage

wget https://github.com/Tsu-gu/tsubuntu/blob/main/filen.png
mkdir $HOME/Appimages/.icons/
mv filen.png $HOME/Appimages/.icons/

wget https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/filen.desktop
mv filen.desktop $HOME/.local/share/applications/

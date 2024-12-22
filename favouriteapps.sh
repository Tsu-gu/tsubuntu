#!/bin/bash
echo "--------------------------------------------"
echo "          Install favourite apps            "
echo "--------------------------------------------"
sudo dpkg --add-architecture i386
sudo apt install syncthing steam-installer
sudo snap install vlc keepassxc
flatpak install -assumeyes flathub it.mijorus.gearlever org.qbittorrent.qBittorrent org.gimp.GIMP org.kde.kdenlive org.nicotine_plus.Nicotine 


# They have a deb now, soooo.
cd $HOME
wget https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_amd64.deb
sudo apt install $HOME/Filen_linux_amd64.deb -y
sudo rm Filen_linux_amd64.deb


# Note to self: make sure filen autostarts.
echo "--------------------------------------------"
read -p "Press Enter to close...."

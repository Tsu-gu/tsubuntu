#!/bin/bash
UBUNTU_CODENAME=$(cat /etc/*-release | grep UBUNTU_CODENAME | cut -d= -f2)
if [[ "$UBUNTU_CODENAME" == "jammy" ]]; then
    echo "Ubuntu Jammy detected. Installing tiling extension."
    # ---the first extension---
echo "Installing corner tiling extension..."
downloadedzip="tiling-assistantleleat-on-github.v36.shell-extension.zip"
linktozip="https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v36.shell-extension.zip"
folder="tiling-assistant@leleat-on-github"

mkdir $folder
cd $folder
wget $linktozip
unzip $downloadedzip
rm $downloadedzip
cd ..
mv $folder $HOME/.local/share/gnome-shell/extensions/
if [[ "$UBUNTU_CODENAME" == "noble" ]]; then
    echo "Ubuntu 24 doesn't need a tiling extension. One is already built in."
else
   # CODE
    
fi

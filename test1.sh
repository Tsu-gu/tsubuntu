#!/bin/bash

# Extract Ubuntu codename
UBUNTU_CODENAME=$(cat /etc/*-release | grep UBUNTU_CODENAME | cut -d= -f2 | tr -d '\r')

if [[ "$UBUNTU_CODENAME" == "jammy" ]]; then
    echo "Ubuntu Jammy detected. Installing tiling extension."

  # ---the first extension---
  echo "Installing corner tiling extension..."
  downloadedzip="tiling-assistantleleat-on-github.v36.shell-extension.zip"
  linktozip="https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v36.shell-extension.zip"
  folder="tiling-assistant@leleat-on-github"

  # Use quotes for variable expansions and commands
  mkdir "$folder"
  cd "$folder"
  wget "$linktozip"
  unzip "$downloadedzip"
  rm "$downloadedzip"
  cd ..
  mv "$folder" "$HOME/.local/share/gnome-shell/extensions/"
elif [[ "$UBUNTU_CODENAME" == "jammy" ]]; then
  echo "Ubuntu 24 (Noble) detected. Tiling extension is already built in."
else
    echo "Something went wrong."
fi

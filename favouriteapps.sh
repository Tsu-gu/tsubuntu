#!/bin/bash
wget https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/filen.desktop
awk -v home="$HOME" '{gsub("/home/tsugu", home); print}' filen.desktop > new_filen.desktop
cp new_filen.desktop $HOME/.local/share/applications/filen.desktop
rm new_filen.desktop
rm filen.desktop

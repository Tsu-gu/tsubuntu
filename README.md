![logo](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/tsubuntu-logo-fedora-debian-buntu.png)

The main point of this script is to tweak Ubuntu to behave the way I like it, and then tweak other distros to behave as close to this setup as possible. I mainly focus on **Ubuntu** and **Debian**.

The way I make these scripts is not to always turn distros into a 1:1 copy of Ubuntu. For example Manjaro uses their own theme, so I'm not touching that. Most of the distros here ship with stock GNOME so I won't forcibly install Yaru and Ubuntu's font and hope for the best.

What makes Ubuntu special for me aren't its colors, but its functionality. That's what these scripts try to replicate.
```
                                                    
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu.sh && chmod +x tsubuntu.sh && ./tsubuntu.sh

```
Reporting any bugs or issues found is greatly appreciated.

# Tweaks

## GNOME: 
- clicking on a running app minimizes it
- clicking on a group of apps brings up their previews 
- adds minimize, maximize buttons to windows
- adds right click > New File
- Super + Shift + S brings up the area screenshot
- Super + E opens the file manager
- Ctrl + Alt + T opens the terminal
- Adds Desktop as a bookmark in Nautilus
- Super+ V opens clipboard manager (Ubuntu only)
## Installed software:
- flatpak
- snap
- flatpak and snap plugins for gnome-software (doesn't work on Fedora)
- webp support for 20.04 and 22.04
- mtp-tools and gvfs-backends on Debian (to be able to transfer files from a connected phone)
- gnome-tweaks, gdebi, gnome-extensions-app, dconf-editor, libfuse2
- gufw(Ubuntu and Debian)/firewall-config(Fedora and RHEL)
- bash auto completion
## Installed extensions:
- tray icons
- corner tiling
- clipboard manager
- dash to dock
- desktop icons

_I have tested each of these in a VM multiple times. if you encounter any bugs or unexpected behaviours, feel free to open a PR._
* * *
# Supported and tested distros:

## ⚙Ubuntu
**25.04 Plucky Puffin** 

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu2504.sh && chmod +x tsubuntu2504.sh && ./tsubuntu2504.sh
```

**24.04 Noble Numbat**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu24.sh && chmod +x tsubuntu24.sh && ./tsubuntu24.sh
```

**22.04 Jammy Jellyfish**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu22.sh && chmod +x tsubuntu22.sh && ./tsubuntu22.sh
```

**20.04 Focal Fossa**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu20.sh && chmod +x tsubuntu20.sh && ./tsubuntu20.sh
```

## ⚙Debian
**12 Bookworm**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
```

## ⚙Fedora
**41** 

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubuntufedora41.sh && chmod +x tsubuntufedora41.sh && ./tsubuntufedora41.sh
```

**40**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubuntufedora40.sh && chmod +x tsubuntufedora40.sh && ./tsubuntufedora40.sh
```

## ⚙RHEL/Rocky/Alma 

**9**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubunturhel9.sh && chmod +x tsubunturhel9.sh && ./tsubunturhel9.sh
```

## ⚙OpenSUSE 

**Tumbleweed & Leap**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubuntutumbleweed.sh && chmod +x tsubuntutumbleweed.sh && ./tsubuntutumbleweed.sh
```

## ⚙Arch Linux
- tested on Endeavour OS
  
```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubuntuarch.sh && chmod +x tsubuntuarch.sh && ./tsubuntuarch.sh

```
## ⚙Manjaro
```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubuntumanjaro.sh && chmod +x tsubuntumanjaro.sh && ./tsubuntumanjaro.sh

```

# Showcase
![screenshot1](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/buntu.webp)

![screenshot2](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/rocky.png)
![screenshot2](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/EndeavourShowcase.png)
![screenshot2](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/TumbleweedShowcase.png)
![screenshot2](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/ManjaroShowcase.png)



https://youtu.be/xf739ivb9hg

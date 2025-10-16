![logo](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/tsubuntu-logo-fedora-debian-buntu.png)
```
          
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu.sh && chmod +x tsubuntu.sh && ./tsubuntu.sh

```

- [Tweaks](#tweaks)
  - [Gnome](#gnome)
  - [Installed software](#installed-software)
  - [Installed extensions](#installed-extensions)
- [Ubuntu tips](#ubuntu-tips)
  - [OEM Installation](#oem-installation)
  - [Picking a different flavour during install](#picking-a-different-flavour-during-install)
  - [Managing snap permissions](#managing-snap-permissions)
  - [Newly installed VLC from the App Center crashes](#newly-installed-vlc-from-the-app-center-crashes)
  - [Unable to install "PACKAGE": snap "PACKAGE" has "install-snap" change in progress](#unable-to-install-package-snap-package-has-install-snap-change-in-progress)
  - [An update broke an app](#an-update-broke-an-app)

- [Supported distros](#tested-distros)
- [Showcase (screenshots)](#showcase)
- [Unityfy GNOME without extensions](#unityfy)
- [Future plans](#future-plans) 
  
The main point of this script is to tweak Ubuntu to behave the way I like it, and then tweak other distros to behave as close to this setup as possible. I mainly focus on **Ubuntu** and **Debian**.

The way I make these scripts is not to always turn distros into a 1:1 copy of Ubuntu. For example Manjaro uses their own theme, so I'm not touching that. Most of the distros here ship with stock GNOME so I won't forcibly install Yaru and Ubuntu's font and hope for the best.

What makes Ubuntu special for me aren't its colors, but its functionality. That's what these scripts try to replicate.

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
- webp support for 20.04 and 22.04
- mtp-tools and gvfs-backends on Debian (to be able to transfer files from a connected phone)
- gnome-tweaks, gdebi, gnome-extensions-app, dconf-editor, libfuse2
- gufw(Ubuntu and Debian)/firewall-config(Fedora and RHEL)
- bash auto completion
### Can be installed later
You right click on the script, run it and a notification will tell you once the install finishes.
- Bazaar (I decided to abandon GNOME Software with the extensions and keep App Center, and give users the option to install a Flatpak store)
- Gearlever (AppImage integration, you just drag and drop the files into its window)
- Ignition (Replaces Startup Applications which got broken by GNOME 49)
- App Center (aka snap-store, the main app store for snaps on Ubuntu.)
## Installed extensions:
- tray icons
- corner tiling
- clipboard manager
- dash to dock
- desktop icons
  
Ubuntu already comes with all of these except for a clipboard manager
# Ubuntu tips
## OEM installation
In the past you could boot up the ISO and select OEM install from GRUB.
<img width="781" height="338" alt="image" src="https://github.com/user-attachments/assets/4d1ba7eb-47e3-4ef8-81d3-10f012eb97ac" />

In new Ubuntu you need to boot it up and do:
```
sudo mkdir -p /usr/share/desktop-provision
sudo bash -c 'echo "mode: oem" > /usr/share/desktop-provision/whitelabel.yaml'
```

## Picking a different flavour during install
You can install other flavours from other ISOs with the new installer by doing:
```
sudo mkdir -p /usr/share/desktop-provision
sudo bash -c 'echo "flavor: kubuntu" > /usr/share/desktop-provision/whitelabel.yaml'
```
## Managing snap permissions
You can actually manage permissions of snaps straight from Settings > Apps
There you will also find the option for autostarting them on new Ubuntu.
<img width="990" height="650" alt="image" src="https://github.com/user-attachments/assets/58c6d6b3-dbf1-41b6-95f2-88a77a925c78" />


## Newly installed VLC from the App Center crashes
VLC still uses Core18 for their Snap, which is what the software center mainly contains.
You can fix it by doing:
```
sudo rm /var/cache/fontconfig/*
rm ~/.cache/fontconfig/*
fc-cache -r
```
## Startup Apps is missing
It got removed with GNOME 49. You're supposed to use Settings > Apps and tick autostart. Very limited, doesn't show you all autostarting apps, doesn't allow for setting options the apps should launch with.

Install [Ignition](https://flathub.org/en/apps/io.github.flattool.Ignition) or a similar app to bring the functionality back.

<img width="607" height="534" alt="image" src="https://github.com/user-attachments/assets/71e6e041-e43c-409b-bb59-8976b1af2cb3" />

## Unable to install "PACKAGE": snap "PACKAGE" has "install-snap" change in progress
You won't see this preferably ever but if you encounter it, all you have to do is:
```
snap changes
...
123  Doing   2024-04-28T10:40:11Z  -  Install "PACKAGE" snap
...
sudo snap abort 123
```
## An update broke an app
Snap keeps several backup versions, you just have to revert to the previous one and preferable hold it so it doesn't update to the broken version.
```
snap revert app
snap refresh --hold app
```

* * *

# Tested distros:

## ⚙Ubuntu

**25.10 Questing Quokka** 

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu2510.sh && chmod +x tsubuntu2510.sh && ./tsubuntu2510.sh
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
I actually adapted the script for this as Focal was my first distro. 

## ⚙Debian
**13 Trixie**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
```
**12 Bookworm**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
```
## ⚙Fedora

**43**

```
wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/others/tsubuntufedora43.sh && chmod +x tsubuntufedora43.sh && ./tsubuntufedora43.sh
```

# Distros I adapted the script for but I don't test them

I don't use these so I don't really have the time to update the scripts. If you care abnout any of these, feel free to send in a PR.

## ⚙RHEL/Rocky/Alma 

RHEL 10 refuses to boot up in a VM.

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
***
# Unityfy
**This is not part of the script but with just two commands you can make GNOME resemble Unity that much more**

```
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top true
```

(The : symbol indicates the placement of the buttons)

![screenshot2](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/ubuntu-gnome-unity-1.png)

![screenshot2](https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/showcase/ubuntu-gnome-unity-2.png)


There's also an option to make the side panel look even more like unity but I found that it's completely broken. Apps will disappear, you can't add new ones, etc. If you still want to give it a go:

`gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true`

# Future plans

I would like to support **Ubuntu Core Desktop** once it releases. Instead of apt installing flatpak and similar I imagine somehow installing a distrobox container and loading it with the necessary software. Or who knows how that will be done.

#!/bin/bash


clear
# Initialize an array to store selected options
selected_options=()

# Display the menu to the user
while true; do

 echo " _______           _                    _          "
 echo "|__   __|         | |                  | |         "
 echo "   | | ___  _   _ | |__   _   _  _ __  | |_  _   _ "
 echo "   | |/ __|| | | || '_ \ | | | || '_ \ | __|| | | |"
 echo "   | |\__ \| |_| || |_) || |_| || | | || |_ | |_| |"
 echo "   |_||___/ \__,_||_.__/  \__,_||_| |_| \__| \__,_|"
 echo "---------------------------------------------------"                                                                  
    echo "[1] Install Flatpak       [5] Activate Ubuntu Pro"
    echo "[2] Configure GNOME       [6] Make MPV usable"
    echo "[3] Install Distrobox     [7] Remove Snap"
    echo "[4] Install useful apps   [8] Install Snap back"
   echo "---------------------------------------------------"
   echo "Selected Options: ${selected_options[*]}"
   echo "---------------------------------------------------"
   
    # Prompt the user for their choice
    read -p "Enter your choices: " choice

    case $choice in
        1)

            selected_options+=(1)
            clear
            
            ;;

        2)

            selected_options+=(2)
            clear
            ;;

        3)

            selected_options+=(3)
            clear
            ;;
        4)

            selected_options+=(4)
            clear
            ;;
        5)

            selected_options+=(5)
            clear
            ;;
        6)

            selected_options+=(6)
            clear
            ;;        
        7)

            selected_options+=(7)
            clear
            ;;
         8)

            selected_options+=(8)
            clear
            ;;              
        *)
            # Execute the selected options
            if [ ${#selected_options[@]} -eq 0 ]; then
                echo "No options selected. Please select options before executing."
            else
                for option in "${selected_options[@]}"; do
                    case $option in
                        1)
                            # Install Flatpak
                            echo "Installing Flatpak..."
                            
                            sudo apt install gnome-software-plugin-flatpak flatpak -y
                            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
		            sleep 3
                            ;;

                        2)
                            echo "Configuring GNOME..."
                            gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
                            gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'quit'
                            gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
                            sudo apt install gnome-tweaks gnome-shell-extensions -y
                           # wget https://extensions.gnome.org/extension-data/tiling-assistantleleat-on-github.v36.shell-extension.zip
                           # mkdir $HOME/.local/share/gnome-shell/extensions/tiling-assistant@leleat-on-github
                           # unzip -q tiling-assistantleleat-on-github.v36.shell-extension.zip -d $HOME/.local/share/gnome-shell/extensions/tiling-assistant@leleat-on-github
                           # gnome-extensions enable tiling-assistant@leleat-on-github
                             			    echo "-----------------------------"
                       	   echo "Download and enable the extension 'Tiling Assistant'. If you value corner tiling you will need it. I couldn't make it install via the command line."
                       	      			    echo "-----------------------------"
                       	   xdg-open https://extensions.gnome.org/extension/3733/tiling-assistant/
                            ;;

                        3)
                            echo "Installing Distrobox..."
                            sudo apt install podman -y
                            wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh


                            ;;
                            
                        4)
                            echo "Installing must-have software..."
   			    # The snap
			    sudo snap install gimp
			    sudo snap install mpv
			    sudo snap install keepassxc
			    sudo snap install fluffychat
			    # The apt
			    sudo apt install syncthing dconf-editor handbrake geany -y
			    sudo add-apt-repository ppa:kdenlive/kdenlive-stable
			    sudo apt update
			    sudo apt install kdenlive -y


                            ;;
                         5)
                            echo "Activating Ubuntu Pro..."
			    sudo pro attach TOKEN 
 			    sudo pro disable livepatch 
 			    pro status

                            ;;    
                         6)
                            echo "Inserting MPV configuration... Please make sure to play at least one video with mpv so that its config directories get created properly for this to work"
   			    sleep 3
   			    touch $HOME/snap/mpv/current/.config/mpv/input.conf
   			    
echo "UP add volume +2
DOWN add volume -2
WHEEL_UP add volume +2
WHEEL_DOWN add volume -2
Shift+RIGHT no-osd seek +2 exact
Shift+LEFT  no-osd seek -2 exact
a cycle audio
s cycle sub
d screenshot

#Pro tips
#Adjust subtitle delay by +/- 0.1 seconds.  -->  z and Z
#Adjust audio delay (A/V sync) by +/- 0.1 seconds. --> Ctrl + and Ctrl -
#Adjust subtitle font size by 10%.--> Shift+g and Shift+f
#Cycle between aspect ratios --> Shift + A" >> $HOME/snap/mpv/current/.config/mpv/input.conf

                            ;;       
                         7)
                            echo "Removing snap..."
                          echo "Please run this script as root for this operation."

snap remove firefox
snap remove gtk-common-themes
snap remove gnome-3-38-2004
snap remove snapd-desktop-integration
snap remove snap-store
snap remove core20
snap remove bare
snap remove snapd
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo systemctl mask snapd
sudo apt purge snapd -y
sudo apt-mark hold snapd
rm -rf ~/snap/
sudo cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd

                            ;;    
                         8)
                            echo "Installing Snap..."
                           echo "Please run this script as root for this operation."

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt-mark unhold snapd
sudo apt install snapd -y

snap install snapd
snap install core20
snap install bare
snap install gnome-3-38-2004
snap install snap-store
snap install firefox
snap install gtk-common-themes
snap install snapd-desktop-integration


                            ;;    
                            

                            
                    esac
                done

                # Clear the selected options and exit
                selected_options=()
                echo "Selected options executed. Exiting..."
                exit 0
            fi
            ;;

        69)
            # Quit the script. Deprecated but I will keep it here just in case.
            echo "Nice. Goodbye!"
            exit 0
            ;;

      
    esac
done


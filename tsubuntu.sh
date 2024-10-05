#!/bin/bash
# For Ubuntu 24.10, 24.04, 22.04, 20.04, Debian 12, and Fedora 40/41

# Get OS ID and version from /etc/os-release
source /etc/os-release
OS_ID=$ID
OS_VERSION=$VERSION_ID

# Check for Ubuntu versions
if [[ "$OS_ID" == "ubuntu" ]]; then
    if [[ "$OS_VERSION" == "24.04" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu24.sh && chmod +x tsubuntu24.sh && ./tsubuntu24.sh
    elif [[ "$OS_VERSION" == "22.04" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu22.sh && chmod +x tsubuntu22.sh && ./tsubuntu22.sh
    elif [[ "$OS_VERSION" == "20.04" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu20.sh && chmod +x tsubuntu20.sh && ./tsubuntu20.sh
    elif [[ "$OS_VERSION" == "24.10" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu2410.sh && chmod +x tsubuntu2410.sh && ./tsubuntu2410.sh
    else
        echo "Unsupported Ubuntu version: $OS_VERSION"
        exit 1
    fi
# Check for Debian 12
elif [[ "$OS_ID" == "debian" ]] && [[ "$OS_VERSION" == "12" ]]; then
    wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
# Check for Fedora 40 and 41
elif [[ "$OS_ID" == "fedora" ]]; then
    if [[ "$OS_VERSION" == "40" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntufedora40.sh && chmod +x tsubuntufedora40.sh && ./tsubuntufedora40.sh
    elif [[ "$OS_VERSION" == "41" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntufedora41.sh && chmod +x tsubuntufedora41.sh && ./tsubuntufedora41.sh
    else
        echo "Unsupported Fedora version: $OS_VERSION"
        exit 1
    fi
else
    echo "Unsupported distro: $NAME, version $OS_VERSION"
    exit 1  
fi

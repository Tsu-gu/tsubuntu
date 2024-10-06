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

# Check for Debian versions
elif [[ "$OS_ID" == "debian" ]]; then
    if [[ "$OS_VERSION" == "12" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
    elif [[ "$OS_VERSION" == "11" ]]; then
    	echo "This doesn't exist yet."
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntudebian11.sh && chmod +x tsubuntudebian11.sh && ./tsubuntudebian11.sh
    elif [[ "$OS_VERSION" == "trixie" ]]; then
    	echo "This is just a placeholder. It likely won't work that well."
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntu24.sh && chmod +x tsubuntu24.sh && ./tsubuntu24.sh
    else
        echo "Unsupported Debian version: $OS_VERSION"
        exit 1
    fi

# Check for Fedora versions
elif [[ "$OS_ID" == "fedora" ]]; then
    if [[ "$OS_VERSION" == "40" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntufedora40.sh && chmod +x tsubuntufedora40.sh && ./tsubuntufedora40.sh
    elif [[ "$OS_VERSION" == "41" ]]; then
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntufedora41.sh && chmod +x tsubuntufedora41.sh && ./tsubuntufedora41.sh
    elif [[ "$OS_VERSION" == "42" ]]; then
    	echo "This doesn't exist yet."
        wget -q https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main/tsubuntufedora42.sh && chmod +x tsubuntufedora42.sh && ./tsubuntufedora42.sh
    else
        echo "Unsupported Fedora version: $OS_VERSION"
        exit 1
    fi
else
    echo "Unsupported OS: $OS_ID"
    exit 1
fi

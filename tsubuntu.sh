#!/bin/bash
# For Ubuntu 24.10, 24.04, 22.04, 20.04, Debian 12, and Fedora 40/41
repo="https://raw.githubusercontent.com/Tsu-gu/tsubuntu/main"
rhel_version=$(awk -F'=' '/^VERSION_ID/ {gsub(/"/, "", $2); split($2, a, "."); print a[1]}' /etc/os-release)
OS_SUSE=$(awk -F'=' '/^ID=/ {gsub(/"/, "", $2); split($2, a, "-"); print a[1]}' /etc/os-release)
# Get OS ID and version from /etc/os-release
source /etc/os-release
OS_ID=$ID
OS_VERSION=$VERSION_ID
CODENAME=$VERSION_CODENAME

# Check for Ubuntu versions
if [[ "$OS_ID" == "ubuntu" ]]; then
    if [[ "$OS_VERSION" == "24.04" ]]; then
        wget -q $repo/tsubuntu24.sh && chmod +x tsubuntu24.sh && ./tsubuntu24.sh
    elif [[ "$OS_VERSION" == "22.04" ]]; then
        wget -q $repo/tsubuntu22.sh && chmod +x tsubuntu22.sh && ./tsubuntu22.sh
    elif [[ "$OS_VERSION" == "20.04" ]]; then
        wget -q $repo/tsubuntu20.sh && chmod +x tsubuntu20.sh && ./tsubuntu20.sh
    elif [[ "$OS_VERSION" == "24.10" ]]; then
        wget -q $repo/tsubuntu2410.sh && chmod +x tsubuntu2410.sh && ./tsubuntu2410.sh
    else
        echo "Unsupported Ubuntu version: $OS_VERSION"
        exit 1
    fi

# Check for Debian versions
elif [[ "$OS_ID" == "debian" ]]; then
    if [[ "$OS_VERSION" == "12" ]]; then
        wget -q $repo/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
    elif [[ "$OS_VERSION" == "11" ]]; then
    	echo "This doesn't exist yet."
        wget -q $repo/tsubuntudebian11.sh && chmod +x tsubuntudebian11.sh && ./tsubuntudebian11.sh
    elif [[ "$CODENAME" == "trixie" ]]; then
    	echo "This is just a placeholder. It likely won't work that well."
        wget -q $repo/tsubuntudebian.sh && chmod +x tsubuntudebian.sh && ./tsubuntudebian.sh
    else
        echo "Unsupported Debian version: $OS_VERSION"
        exit 1
    fi

# Check for Fedora versions
elif [[ "$OS_ID" == "fedora" ]]; then
    if [[ "$OS_VERSION" == "40" ]]; then
        wget -q $repo/tsubuntufedora40.sh && chmod +x tsubuntufedora40.sh && ./tsubuntufedora40.sh
    elif [[ "$OS_VERSION" == "41" ]]; then
        wget -q $repo/tsubuntufedora41.sh && chmod +x tsubuntufedora41.sh && ./tsubuntufedora41.sh
    elif [[ "$OS_VERSION" == "42" ]]; then
    	echo "This doesn't exist yet."
        wget -q $repo/tsubuntufedora42.sh && chmod +x tsubuntufedora42.sh && ./tsubuntufedora42.sh
    else
        echo "Unsupported Fedora version: $OS_VERSION"
        exit 1
    fi

# Check for RHEL versions
elif [[ "$rhel_version" == "9" ]]; then
 wget -q $repo/tsubunturhel9.sh && chmod +x tsubunturhel9.sh && ./tsubunturhel9.sh
    if [[ "$rhel_version" == "10" ]]; then
         wget -q $repo/tsubunturhel10.sh && chmod +x tsubunturhel10.sh && ./tsubunturhel10.sh
    elif [[ "$rhel_version" == "11" ]]; then
    	echo "This doesn't exist yet."
    else
        echo "Unsupported RHEL version: $rhel_version"
        exit 1
    fi

# Check for SUSE versions
elif [[ "$OS_SUSE" == "opensuse" ]]; then
    if [[ "$OS_ID" == "opensuse-tumbleweed" ]]; then
        wget -q $repo/tsubuntutumbleweed.sh && chmod +x tsubuntutumbleweed.sh && ./tsubuntutumbleweed.sh
    elif [[ "$OS_ID" == "opensuse-leap" ]]; then
        wget -q $repo/tsubuntutumbleweed.sh && chmod +x tsubuntutumbleweed.sh && ./tsubuntutumbleweed.sh
    elif [[ "$OS_ID" == "opensuse-slowroll" ]]; then
        wget -q $repo/tsubuntutumbleweed.sh && chmod +x tsubuntutumbleweed.sh && ./tsubuntutumbleweed.sh
    else
        echo "Unsupported OpenSUSE version: $OS_ID"
        exit 1
    fi
    

    
else
    echo "Unsupported OS: $OS_ID"
    exit 1
fi

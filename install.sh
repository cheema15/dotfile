#!/bin/bash

# Get username that called script
ME=$SUDO_USER

# Check if effective user id is 0 (root)
if [[ "$(id -u)" -eq 0 ]]; then
    echo "Script is running as root"
    # Check if apt is package manager
    if [[ -n "$(which apt)" ]]; then
        echo "apt is installed exactly as specified."
        # Install required packages with apt
        apt install -y \
            nmap \
            dnsutils \
            libgl1-mesa-glx \
            libegl1-mesa \
            libxrandr2 \
            libxrandr2 \
            libxss1 \
            libxcursor1 \
            libxcomposite1 \
            libasound2 \
            libxi6 \
            libxtst6

        # Check if Anaconda is already installed
        if [[ -d "/home/$ME/anaconda3" ]]; then
            echo "Anaconda is already installed in /home/$ME/anaconda3."
        else
            # Check if Anaconda installer exists
            if [[ -e $(ls Anaconda3*.sh 2> /dev/null | head -1) ]]; then
                echo "Installer found, running it"
                bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
                echo "PATH=$PATH:/home/$ME/anaconda3/bin" >> /home/$ME/.profile
            else
                # Download Anaconda installer if not found
                echo "Downloading Anaconda installer"
                curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
                bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
                echo "PATH=$PATH:/home/$ME/anaconda3/bin" >> /home/$ME/.profile
            fi
        fi
    else
        echo "apt is not installed at the specified location."
    fi

    # Run scripts one by one
    bash configfiles/bash.sh
    bash configfiles/git.sh
    bash configfiles/ssh.sh
    bash configfiles/vim.sh
else
    echo "Script is not running as root, exiting..." 1>&2
    exit 1
fi


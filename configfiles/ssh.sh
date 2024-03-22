#!/bin/bash

ssh_setup() {
    # Check network connection
    if ! ping -c 1 fry.cs.wright.edu &> /dev/null; then
        echo "[ERROR] Not connected to WSU-Secure or Wright State VPN. Please connect before setting up SSH."
        exit 1
    fi

    # Check if ~/.ssh folder exists. If not, create it.
    if [ ! -d ~/.ssh ]; then
        echo "[INFO] Creating SSH folder..."
        mkdir -p ~/.ssh
    else
        echo "[INFO] SSH folder exists, continuing..."
    fi

    # Symbolically link authorized_keys
    ln -sf ~/dotfiles/authorized_keys ~/.ssh/authorized_keys

    # Create or update ~/.ssh/config file with an entry for fry.cs.wright.edu
    if [ ! -f ~/.ssh/config ]; then
        echo -e "Host fry\n\tUser w695sxc\n\tHostName fry.cs.wright.edu\n\tPort 22" > ~/.ssh/config
    else
        # Ensure entry doesn't already exist
        if ! grep -q "Host fry" ~/.ssh/config; then
            echo -e "\nHost fry\n\tUser w695sxc\n\tHostName fry.cs.wright.edu\n\tPort 22" >> ~/.ssh/config
        fi
    fi

    # Symbolically link config file
    ln -sf ~/dotfiles/config ~/.ssh/config

    echo "[INFO] SSH setup completed."
}

ssh_setup


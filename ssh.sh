#!/bin/bash

ssh_setup() {
    if [ ! -d ~/.ssh ]; then
        echo "[INFO] Creating SSH folder..."
        mkdir -p ~/.ssh
    else
        echo "[INFO] SSH folder exists, continuing..."
    fi

    # Symbolically link authorized_keys
    ln -sfb ~/dotfiles/authorized_keys ~/.ssh/authorized_keys

    # Create or update ~/.ssh/config file with an entry for fry.cs.wright.edu
    if [ ! -f ~/.ssh/config ]; then
        echo -e "Host fry\n\tUser w695sxc\n\tHostName fry.cs.wright.edu\n\tPort 22" > ~/.ssh/config
    else
        echo -e "\nHost fry\n\tUser w695sxc\n\tHostName fry.cs.wright.edu\n\tPort 22" >> ~/.ssh/config
    fi

    # Symbolically link config file
    ln -sfb ~/dotfiles/config ~/.ssh/config

    echo "[INFO] SSH setup completed."
}

ssh_setup



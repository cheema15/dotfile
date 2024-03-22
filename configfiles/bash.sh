#!/bin/bash

bash_config() {
    # Get the current user's username
    ME=$(whoami)

    # Define the path to your custom .bashrc file
    CUSTOM_BASHRC="/home/$ME/dotfiles/bashrc"

    # Check if the custom .bashrc file exists
    if [ ! -f "$CUSTOM_BASHRC" ]; then
        echo "Error: Custom .bashrc file not found at $CUSTOM_BASHRC"
        exit 1
    fi

    # Backup existing .bashrc file
    if [ -f "/home/$ME/.bashrc" ]; then
        echo "Backing up existing .bashrc file..."
        mv /home/$ME/.bashrc /home/$ME/.bashrc_backup
    fi

    # Link custom .bashrc file
    echo "Linking custom .bashrc file..."
    ln -sf "$CUSTOM_BASHRC" /home/$ME/.bashrc

    # Source the linked .bashrc file
    echo "Sourcing .bashrc file..."
    source /home/$ME/.bashrc

    # Copy .bashrc to git repository
    echo "Copying .bashrc to git repository..."
    cp /home/$ME/.bashrc /home/cheema15/dotfiles/

    echo "Bash configuration applied successfully."
}

bash_config


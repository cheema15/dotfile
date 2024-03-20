#!/bin/bash

git_setup() {
    echo -e '[INFO] Setting git configurations...'

    # Set name & email
    git config --global user.name "cheema15"
    git config --global user.email "cheema.15@wright.edu"

    # Prompt for core editor
    read -rp "[PROMPT] Which core editor do you prefer, Vim or Nano? (v/n): " editor

    # Convert input to lowercase for case-insensitive comparison
    editor=$(echo -e "$editor" | tr '[:upper:]' '[:lower:]')

    # Check the user's choice and set the core editor accordingly
    if [[ "$editor" == "v" || "$editor" == "vim" ]]; then
        git config --global core.editor "vim"
    elif [[ "$editor" == "n" || "$editor" == "nano" ]]; then
        git config --global core.editor "nano"
    else
        echo -e "[ERROR] Invalid choice. Please enter 'v' for Vim or 'n' for Nano."
        exit 1
    fi

    # Default exclude commonly ignorable files/folders or set default commit message template
    # (Add your desired configuration here)

    # Set git autocorrect
    git config --global help.autocorrect 50

    echo -e '[INFO] Finished setting git configurations. Continuing...'

    # Copy .gitconfig to repository
    cp ~/.gitconfig .gitconfig

    # Create symbolic link to ~/.gitconfig with sudo
    sudo ln -sf /home/cheema15/dotfiles/.gitconfig ~/.gitconfig 
}

git_setup

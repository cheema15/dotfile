#!/bin/bash

setup_bashrc() {
    echo "[INFO] Setting up .bashrc..."

    # Make two useful aliases
    echo 'alias ll="ls -alF"' >> ~/.bashrc
    echo 'alias ..="cd .."' >> ~/.bashrc

    # "awesome" bash aliases
    echo 'alias awesome="echo This is awesome!"' >> ~/.bashrc

    # Add aliases from "The Ultimate B.A. .bashrc" file
    # Add additional packages if required for these aliases

    # Copy .bashrc to repository
    cp ~/.bashrc /home/cheema15/dotfiles/.bashrc

    # Create symbolic link to ~/.bashrc
    ln -sf /home/cheema15/dotfiles/.bashrc ~/.bashrc
}

setup_bashrc


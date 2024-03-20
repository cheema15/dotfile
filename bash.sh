#!/bin/bash

setup_bashrc() {
    echo "[INFO] Setting up .bashrc..."

    # Make two useful aliases
    echo 'alias ll="ls -alF"' >> ~/.bashrc
    echo 'alias ..="cd .."' >> ~/.bashrc

    # "awesome" bash aliases
    echo 'alias awesome="echo This is awesome!"' >> ~/.bashrc

    # 30 okay aliases
    echo 'alias l="ls -CF"' >> ~/.bashrc
    echo 'alias la="ls -A"' >> ~/.bashrc
    # Add more aliases as needed...

    # 70 more aliases
    # Add more aliases as needed...

    # Install additional packages if required
    # Add package names here if needed...

    # Copy .bashrc to repository
    cp ~/.bashrc /home/cheema15/dotfiles/.bashrc

    # Create symbolic link to ~/.bashrc
    ln -sf /home/cheema15/dotfiles/.bashrc  ~/.bashrc
}

setup_bashrc

~                                                                                                                                    ~                                                                                                                                    ~                                                                                                                                    ~                                                                                                                                    ~  


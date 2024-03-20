#!/bin/bash

vim_setup() {
    # Ensure Vim plugin manager (Vundle) is installed
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        echo "[INFO] Installing Vundle..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        echo "[INFO] Vundle already installed, skipping..."
    fi

    # Ensure the Gruvbox color scheme is installed
    if [ ! -f ~/.vim/colors/gruvbox.vim ]; then
        echo "[INFO] Installing Gruvbox color scheme..."
        mkdir -p ~/.vim/colors
        curl -o ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
    else
        echo "[INFO] Gruvbox color scheme already installed, skipping..."
    fi

    # Ensure the vim-airline plugin is installed
    if [ ! -d ~/.vim/bundle/vim-airline ]; then
        echo "[INFO] Installing vim-airline..."
        git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
    else
        echo "[INFO] vim-airline already installed, skipping..."
    fi

    echo "[INFO] Vim setup completed."
}

vim_setup


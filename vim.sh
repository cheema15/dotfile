#!/bin/bash

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Pick and install a color scheme for vim
# You can choose any color scheme you like, here's an example with the "gruvbox" theme
mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

# Pick and install a vim improvement plugin
# For example, let's install the 'vim-airline' plugin
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# Configuration for Vundle and plugins
cat << EOF >> ~/.vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list
" Add your desired plugins here

" Example plugin - vim-airline
Plugin 'vim-airline/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

" Example configuration for vim-airline
" This can be extended for other plugins as well
let g:airline_theme='gruvbox'

" Your custom configurations can go here

EOF

# Submission
echo "Submission: "
echo "Please review the customizations made to your vim setup."

# Optionally, you can also open vim to verify the changes
# vim

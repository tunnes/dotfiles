#!/bin/bash

# Creating symbolic links ---------------------------------------------------------------------------------
# This piece below creates the symbolic links into the /home.

echo -e "Creaing symbolic links:"

if [ -r ~/.bash_profile ]; then
    if cmp -s .bash_profile ~/.bash_profile; then
	echo -e "\033[36mInfo:\033[0m file .bash_profile is already present on your /home."
    else
	echo -e "\033[31mError:\033[0m file .bash_profile it is already present on /home and is different, manual intervention is needed."
    fi
else
    ln -s .bash_profile ~/.bash_profile
    echo -e "\033[36mInfo:\033[0m symbolic link .bash_profile created."  
fi

if [ -r ~/.emacs.d ]; then
    if cmp -s .emacs.d/init.el ~/.emacs.d/init.el; then
	echo -e "\033[36mInfo:\033[0m directory .emacs.d is already present on your /home."
    else
	echo -e "\033[31mError:\033[0m directory .emacs.d it is already present on /home and is different, manual intervention is needed."
    fi
else
    ln -s .emacs.d ~/.emacs.d
    echo -e "\033[36mInfo:\033[0m symbolic link ~/.emacs.d created."  
fi

# Installing Homebrew ---------------------------------------------------------------------------------
echo -e "\nInstalling Homebew:"

if [[ $(command -v brew) == "" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "\033[36mInfo:\033[0m brew is already installed."
fi

# Installing Rbenv ---------------------------------------------------------------------------------
echo -e "\nInstalling rbenv:"
if [[ $(command -v rbenv) == "" ]]; then
    brew install rbenv
else
    echo -e "\033[36mInfo:\033[0m $(rbenv -v) is already installed."
fi

# Installing Emacs ---------------------------------------------------------------------------------
echo -e "\nInstalling Emacs:"
if [[ $(command -v emacs) == "" ]]; then
    brew install emacs
else
    echo -e "\033[36mInfo:\033[0m emacs is already installed."
fi

# Installing Iterm2 ---------------------------------------------------------------------------------
echo -e "\nInstalling Iterm2:"
if [[ ! -d /Applications/iTerm.app ]]; then
    brew install iterm2
else
    echo -e "\033[36mInfo:\033[0m iTerm2 is already installed."
    echo -e "\033[36mInfo:\033[0m it is necessary to load the preferences file manually."

fi

# Copy Fonts ----------------------------------------------------------------------------------------
echo -e "\nCopy Fonts:"
cp fonts/* ~/Library/Fonts
echo -e "\033[36mInfo:\033[0m fonts copied to ~/Library/Fonts."

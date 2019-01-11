#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Hammerspoon
    git clone git@github.com:AWildDevAppears/hammerspoon-config.git
    mv hammerspoon-config ~/.hammerspoon
    git clone https://github.com/nathancahill/anycomplete.git ~/.hammerspoon/anycomplete
    wget https://github.com/Hammerspoon/Spoons/raw/master/Spoons/HeadphoneAutoPause.spoon.zip
    unzip HeadphoneAutoPause.spoon.zip
    mv HeadphoneAutoPause.spoon ~/.hammerspoon/Spoons/.
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ln -s $(pwd)/.gitconfig-linux ~/.gitconfig
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ln -s $(pwd)/.gitconfig-mac ~/.gitconfig
fi

# VSCode
while read p; do
  code --install-extension $p
done < vscode-extensions

# Terminal
ln -s $(pwd)/.aliases.sh ~/.aliases.sh
ln -s $(pwd)/.exports.sh ~/.exports.sh
ln -s $(pwd)/.functions.sh ~/.functions.sh
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.global-gitignore ~/.global-gitignore

ln -s $(pwd)/.config/htop ~/.config/htop
ln -s $(pwd)/.config/alacritty ~/.config/alacritty

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    #  VSCode settings
    ln -s $(pwd)/.config/Code\ -\ OSS/User/snippets ~/.config/Code\ -\ OSS/snippets
    ln -s $(pwd)/.config/Code\ -\ OSS/User/settings.json ~/.config/Code\ -\ OSS/settings.json

    ln -s $(pwd)/.config/dunst ~/.config/dunst
    ln -s $(pwd)/.config/i3 ~/.config/i3
    ln -s $(pwd)/.config/polybar ~/.config/polybar
    ln -s $(pwd)/.config/ranger ~/.config/ranger
    ln -s $(pwd)/.config/rofi ~/.config/rofi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # VSCode settings
    ln -s $(pwd)/.config/Code\ -\ OSS/User/snippets ~/Library/Application\ Support/Code/User/snippets
    ln -s $(pwd)/.config/Code\ -\ OSS/User/settings.json ~/Library/Application\ Support/Code/User/settings.json

    ln -s $(pwd)/.config/karabiner ~/.config/karabiner
    ln -s $(pwd)/.config/brewfile ~/.config/brewfile
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Finder
    defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder
fi

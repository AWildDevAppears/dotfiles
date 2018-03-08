# Hammerspoon
git clone git@github.com:AWildDevAppears/hammerspoon-config.git
mv hammerspoon-config ~/.hammerspoon
git clone https://github.com/nathancahill/anycomplete.git ~/.hammerspoon/anycomplete
wget https://github.com/Hammerspoon/Spoons/raw/master/Spoons/HeadphoneAutoPause.spoon.zip
unzip HeadphoneAutoPause.spoon.zip
mv HeadphoneAutoPause.spoon ~/.hammerspoon/Spoons/.

# VSCode
while read p; do                                                                                                                 ✔  209  17:16:29
  code --install-extension $p
done < vscode-extensions

# Terminal
ln -s $(pwd)/.aliases.sh ~/.aliases.sh
ln -s $(pwd)/.exports.sh ~/.exports.sh
ln -s $(pwd)/.functions.sh ~/.functions.sh
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.global-gitignore ~/.global-gitignore
ln -s $(pwd)/.gitconfig ~/.gitconfig

ln -s $(pwd)/.config ~/.config

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder

git config --global user.name "Jeremy Morrison"
git config --global user.email jeremy.morrison36@gmail.com

cd ~
git clone https://github.com/JeMorriso/.dotfiles.git

source ~/.dotfiles/homebrew/bin/homebrew/install.sh

mkdir ~/bin
cd ~/.dotfiles
stow zsh
stow kitty
stow lazyvim

################################################################################
# programs not on homebrew
################################################################################
# https://github.com/rvaiya/warpd
curl -L https://github.com/rvaiya/warpd/releases/download/v1.3.5/warpd-1.3.5-osx.tar.gz | sudo tar xzvfC - / && launchctl load /Library/LaunchAgents/com.warpd.warpd.plist

# https://github.com/dbalatero/VimMode.spoon
bash <(curl -s https://raw.githubusercontent.com/dbalatero/VimMode.spoon/master/bin/installer)

mkdir -p ~/source/others
cd ~/source/others

git clone https://github.com/xiamaz/YabaiIndicator.git xiamaz/YabaiIndicator
git clone https://github.com/Ga68/benign-key-logger.git Ga68/benign-key-logger
git clone https://github.com/kmonad/kmonad.git kmonad/kmonad
git clone https://github.com/wdomitrz/kitty-gruvbox-theme.git wdomitrz/kitty-gruvbox-theme

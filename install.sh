#!/bin/bash
DIR=$(dirname $(realpath "$0"))
# alacritty configuration
rm $HOME/.alacritty.yml
ln -s $DIR/.alacritty.yml $HOME/.alacritty.yml
# install oh-my-zsh
rm -Rf $HOME/.oh-my-zsh
git clone http://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
# install custom theme(s)
rm $ZSH/custom/themes/kafeitu-custom.zsh-theme
ln -s $DIR/kafeitu-custom.zsh-theme $ZSH/custom/themes/kafeitu-custom.zsh-theme
# install custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
# install zsh configuration
rm $HOME/.zshrc
ln -s $DIR/.zshrc $HOME/.zshrc
# i3
rm $HOME/.config/i3/config
ln -s $DIR/i3config $HOME/.config/i3/config
# i3blocks
rm $HOME/.config/i3blocks/config
ln -s $DIR/i3blocksconfig $HOME/.config/i3blocks/config
rm -Rf $HOME/.config/i3blocks/scripts
ln -s $DIR/i3blocksscripts $HOME/.config/i3blocks/scripts
# Done
echo "Done. Restarting!"
shutdown now -r

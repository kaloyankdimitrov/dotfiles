#!/bin/bash
DIR=$(dirname $(realpath "$0"))
# alacritty configuration
if [ -f $HOME/.alacritty.yml ]
then
	rm $HOME/.alacritty.yml
fi
ln -s $DIR/.alacritty.yml $HOME/.alacritty.yml
# install oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]
then
	rm -Rf $HOME/.oh-my-zsh
fi
git clone http://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
# install custom theme(s)
if [ -f $HOME/kafeitu-custom.zsh-theme ]
then
	rm $ZSH/custom/themes/kafeitu-custom.zsh-theme
fi
ln -s $DIR/kafeitu-custom.zsh-theme $ZSH/custom/themes/kafeitu-custom.zsh-theme
# install custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
# install zsh configuration
if [ -f $HOME/.zshrc ]
then
	rm $HOME/.zshrc
fi
ln -s $DIR/.zshrc $HOME/.zshrc
# picom
if [ -d $HOME/.config/picom ]
then
	rm -Rf $HOME/.config/picom
fi
ln -s $DIR/picom $HOME/.config/picom
# i3
if [ -d $HOME/.config/i3 ]
then
	rm -Rf $HOME/.config/i3
fi
ln -s $DIR/i3 $HOME/.config/i3
# i3blocks
if [ -d $HOME/.config/i3blocks ]
then
	rm -Rf $HOME/.config/i3blocks
fi
ln -s $DIR/i3blocks $HOME/.config/i3blocks
# rofi
if [ -d $HOME/.config/rofi ]
then
	rm -Rf $HOME/.config/rofi
fi
ln -s $DIR/rofi $HOME/.config/rofi

# nvim
if [ -d $HOME/.config/nvim ]
then
	rm -Rf $HOME/.config/nvim
fi
ln -s $DIR/nvim $HOME/.config/nvim

# Done
echo "Done. Restarting!"
shutdown now -r

#!/bin/bash
#
# System initialisation script
#


# Check if brew is installed
echo "Checking if brew is installed..."

type brew
if [ $? -eq 0 ]
then
	echo "Brew installed"
else
	echo "Brew not installed"
	echo
	echo "Installing Homebrew:"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


# Check if git is installed
echo "Checking if git is installed..."

type git
if [ $? -eq 0 ]
then
	echo "Git installed"
else
	echo "Git not installed"
	echo
	echo "Installing Git:"
	brew install git
fi

ssh-add

git clone https://github.com/russial/dotfiles.git ~/dotfiles

# Install vim-go plugin
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
# Install NERDTree plugin
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
# Install NERDTree-git plugin
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/pack/dist/start/nerdtree-git-plugin
# Install vim-airline plugin
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
# Install vim-fugitive plugin
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
# Install gitgutter
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
# Setup solarized 
git clone https://github.com/altercation/vim-colors-solarized.git ~/dotfiles/tmp/vim-colors-solarized
mkdir ~/.vim/colors/
cp ~/dotfiles/tmp/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf ~/dotfiles/tmp

ln ~/dotfiles/.vimrc ~/.vimrc


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

echo "Checking if fzf is installed..."

type fzf
if [ $? -eq 0 ]
then
    echo "FZF installed"
else
    echo "FZF is not installed"
    echo
    echo "Installing FZF:"
    brew install fzf
    # To install useful key bindings and fuzzy completion:
    $(brew --prefix)/opt/fzf/install
fi

ssh-add

git clone https://github.com/russial/dotfiles.git ~/dotfiles

git clone https://github.com/junegunn/fzf.git ~/.vim/pack/plugins/start/fzf
# Install vim-go plugin
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
# Install NERDTree plugin
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
# Install NERDTree-git plugin
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/pack/dist/start/nerdtree-git-plugin
# Install NERDCommenter plugin 
git clone https://github.com/preservim/nerdcommenter.git ~/.vim/pack/dist/start/nerdcommenter 
# Install vim-airline plugin
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
# Install vim-fugitive plugin
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
# Install gitgutter
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
# Install auto-pairs
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/pack/airblade/start/auto-pairs
# Install snippets
git clone https://github.com/tomtom/tlib_vim.git ~/.vim/pack/airblade/start/tlib_vim
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/pack/airblade/start/vim-addon-mw-utils
git clone https://github.com/garbas/vim-snipmate.git ~/.vim/pack/airblade/start/vim-snipmate
git clone https://github.com/honza/vim-snippets.git ~/.vim/pack/airblade/start/vim-snippets
# Install coc.vim
echo "Checking prerequisites for coc.nvim..."
type node
if [ $? -eq 0 ]
then
    echo "node installed"
else
    echo "node is not installed"
    echo
    echo "Installing node:"
    curl -sL install-node.now.sh/lts | bash
fi
git clone --single-branch --branch release https://github.com/neoclide/coc.nvim.git ~/.vim/pack/airblade/start/coc.nvim
# Setup solarized
git clone https://github.com/altercation/vim-colors-solarized.git ~/dotfiles/tmp/vim-colors-solarized
mkdir ~/.vim/colors/
cp ~/dotfiles/tmp/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf ~/dotfiles/tmp

ln ~/dotfiles/.vimrc ~/.vimrc
ln ~/dotfiles/coc-settings.json ~/.vim/coc-settings.json
vim -c 'CocInstall coc-go|q'

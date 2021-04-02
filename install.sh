#! /bin/zsh

# ----- zsh ----- #
stow -t $HOME zsh

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "========== installing oh-my-zsh =========="
    sh misc/ohmyzsh-install.sh
fi

# install incr.zsh
if [ ! -e ~/.oh-my-zsh/custom/plugins/incr/incr-0.2.zsh ]; then
    echo "========== installing incr =========="
    mkdir ~/.oh-my-zsh/custom/plugins/incr -p
    cp misc/incr-0.2.zsh ~/.oh-my-zsh/custom/plugins/incr/
fi

# install zsh-autosuggestion
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "========== installing zsh-autosuggestions =========="
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# install zsh-syntax-highlighting
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "========== installing zsh-syntax-highlighting =========="
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Automatically add source command to .zshrc
grep -qxF "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" ~/.zshrc ||
    ( echo "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" >> ~/.zshrc &&
echo "========== Write \"source ~/.zshrc_tandf\" to .zshrc ==========" )

# Set up zsh plugins
# It's said that history-substring-search should be put after
# zsh-syntax-highlighting
plugins="git zsh-autosuggestions colored-man-pages zsh-syntax-highlighting history-substring-search"
overridden_waring="# May be overridden! Modify ~\/dotfile\/install.sh instead"
sed -i "s/^plugins=.*$/plugins=($plugins) $overridden_waring/g" ~/.zshrc

echo "Remember to source ~/.zshrc to get the newest configuration"
# ----- zsh end ----- #

# nvim requires specific path
if [ ! -d ~/.config/nvim ]; then
    echo "========== creating ~/.config/nvim =========="
    mkdir -p ~/.config/nvim
fi
stow -t ~/.config/nvim nvim

# fusuma requires specific path
if [ ! -d ~/.config/fusuma ]; then
    echo "========== creating ~/.config/fusuma =========="
    mkdir -p ~/.config/fusuma
fi
stow -t ~/.config/fusuma fusuma

# UltiSnips requires specific path
if [ -d ~/.vim/plugged/ultisnips/UltiSnips ]; then
    stow -t ~/.vim/plugged/ultisnips/UltiSnips UltiSnips
fi

stow -t $HOME vim tmux bash

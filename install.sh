# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "========== installing oh-my-zsh =========="
    sh misc/ohmyzsh-install.sh
fi

# install incr.zsh
if [ ! -e ~/.oh-my-zsh/plugins/incr/incr*.zsh ]; then
    echo "========== installing incr =========="
    mkdir ~/.oh-my-zsh/plugins/incr -p
    cp misc/incr-0.2.zsh ~/.oh-my-zsh/plugins/incr/
fi

stow -t $HOME vim tmux bash nvim zsh

# UltiSnips requires specific path
if [ -d ~/.vim/plugged/ultisnips/UltiSnips ]; then
    stow -t ~/.vim/plugged/ultisnips/UltiSnips UltiSnips
fi

# Automatically add source command to .zshrc
grep -qxF "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" ~/.zshrc ||
    ( echo "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" >> ~/.zshrc &&
echo "Write to .zshrc" )


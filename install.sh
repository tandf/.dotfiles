stow -t $HOME vim tmux bash nvim zsh

# UltiSnips requires specific path
if [ ! -d ~/.vim/plugged/ultisnips/UltiSnips ]; then
    mkdir -p ~/.vim/plugged/ultisnips/UltiSnips
fi
stow -t ~/.vim/plugged/ultisnips/UltiSnips UltiSnips

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "========== installing oh-my-zsh =========="
    # not working due to "network problems" that everyone knows
    # sh -c "$(proxychains curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sh misc/ohmyzsh-install.sh
fi

# install incr.zsh
if [ ! -e ~/.oh-my-zsh/plugins/incr/incr*.zsh ]; then
    echo "========== installing incr =========="
    mkdir ~/.oh-my-zsh/plugins/incr -p
    cp misc/incr-0.2.zsh ~/.oh-my-zsh/plugins/incr/
fi

# Automatically add source command to .zshrc
grep -qxF "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" ~/.zshrc ||
    ( echo "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" >> ~/.zshrc &&
echo "Write to .zshrc" )


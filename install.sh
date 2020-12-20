# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "========== installing oh-my-zsh =========="
    sh misc/ohmyzsh-install.sh
fi

# install incr.zsh
if [ ! -e ~/.oh-my-zsh/custom/plugins/incr/incr*.zsh ]; then
    echo "========== installing incr =========="
    mkdir ~/.oh-my-zsh/custom/plugins/incr -p
    cp misc/incr-0.2.zsh ~/.oh-my-zsh/custom/plugins/incr/
fi

# install zsh-autosuggestion
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "========== installing zsh-autosuggestions =========="
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Automatically add source command to .zshrc
grep -qxF "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" ~/.zshrc ||
    ( echo "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" >> ~/.zshrc &&
echo "========== Write \"source ~/.zshrc_tandf\" to .zshrc ==========" )

# Setup zsh plugins
plugins="git zsh-autosuggestions"
sed -i "s/^plugins=.*$/plugins=($plugins)/g" ~/.zshrc

stow -t $HOME vim tmux bash zsh
stow

# UltiSnips requires specific path
if [ -d ~/.vim/plugged/ultisnips/UltiSnips ]; then
    stow -t ~/.vim/plugged/ultisnips/UltiSnips UltiSnips
fi


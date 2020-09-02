# Automatically add source command to .zshrc
grep -qxF "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" ~/.zshrc ||
    ( echo "[ -f ~/.zshrc_tandf ] && source ~/.zshrc_tandf" >> ~/.zshrc &&
echo "Write to .zshrc" )

stow -t $HOME vim tmux bash nvim zsh

# UltiSnips requires specific path
if [ -d "~/.vim/plugged/ultisnips/UltiSnips" ]; then
    stow -t ~/.vim/plugged/ultisnips/UltiSnips
fi

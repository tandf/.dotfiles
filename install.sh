stow -t $HOME vim tmux bash

if [ -d "~/.vim/bundle/ultisnips/UltiSnips" ]; then
    stow -t ~/.vim/bundle/ultisnips/UltiSnips UltiSnips
fi

if [ ! -f "./vim/.vimrc_local" ] ; then
    cp ./vim/.vimrc_local_sample ./vim/.vimrc_local
fi

grep -qxF "[ -f ~/.bashrc_tandf ] && source ~/.bashrc_tandf" ~/.bashrc ||
    ( echo "[ -f ~/.bashrc_tandf ] && source ~/.bashrc_tandf" >> ~/.bashrc &&
echo "Write to .bashrc" )

stow -t $HOME vim tmux bash

if [ -d "~/.vim/bundle/ultisnips/UltiSnips" ]; then
    stow -t ~/.vim/bundle/ultisnips/UltiSnips UltiSnips
fi

# Dotfiles
Install:

First you need to write a local vim resource file. You can take 
`vim\.vimrc_local_sample` or `vim\_vimrc_local_sample` as an example.
The local file name should be `.vimrc_local` or `_vimrc_local`, 
depending on your OS. You can also simply use the sample file by 
copy it and change its name.

Run install script:

```./install.sh```

Add local part to bashrc file:

```echo "~/.bashrc_tandf >> ~/.bashrc"```

## TODO
- [ ] Split vimrc according to function. Like [this repo](https://github.com/skywind3000/vim-init).
  - [x] Specific viriable for specific OS.
- [ ] Add `source ~/.bashrc_tandf` to .bashrc automatically.

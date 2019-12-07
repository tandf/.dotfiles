# Dotfiles
Install:

First you need to have a local vim resource file. For Linux users, 
this file is automatically copied from `vim\.vimrc_local_sample` 
by running `./install.sh ` if there doesn't exist such a file.

You can also write one yourself. You can take `vim\.vimrc_local_sample`
 or `vim\_vimrc_local_sample` as an example.  The local file name 
should be `.vimrc_local` or `_vimrc_local`, depending on your OS. You 
can also simply use the sample file by copy it and change its name.

Run install script:

```./install.sh```

## TODO
- [ ] Split vimrc according to function. Like [this repo](https://github.com/skywind3000/vim-init).
  - [x] Specific viriable for specific OS.
- [x] Add `source ~/.bashrc_tandf` to .bashrc automatically.
- [ ] Custom status line.
    - [ ] Show word count for md and similar files.

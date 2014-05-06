This currently has my bash, tmux and some script files. Need to add: vim config file.

To install:

    git clone https://github.com/patrickmcelwee/dotfiles ~/dotfiles
    cd ~/dotfiles
    ./install_dotfiles.sh

This will make a backup of any config files that are not symlinks. They will be placed into ~/dotfiles\_old

I use Vundle to manage vim plugins. See the documentation at https://github.com/gmarik/Vundle.vim. To setup:

    mkdir .vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Also, I use ~/.vim_backups for backup files. So you need to:

    mkdir ~/.vim_backups

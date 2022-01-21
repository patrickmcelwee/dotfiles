This currently has my vim, bash, tmux and some script files. For anyone else looking at this, sorry that it doesn't get cleaned up very often! But it works for me.

To install:

    git clone https://github.com/patrickmcelwee/dotfiles ~/dotfiles
    ~/dotfiles/install_dotfiles.sh
    source ~/.bashrc

Open Vim and run:

    :PlugInstall

This will make a backup of any config files that are not symlinks. They will be placed into ~/dotfiles\_old

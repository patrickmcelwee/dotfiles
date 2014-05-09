HISTFILESIZE=5000

alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'

alias ls='ls -G'
alias ll='ls -ltr'

alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text'

alias pg='ps aux | grep'
alias hsg='history | grep'
alias start-mysql='sudo /usr/local/mysql/bin/mysqld_safe'
alias tomcat='sh ~/.scripts/tomcat.sh'
alias torqueboxrun='jruby -S torquebox run -J "\-Xmx1024m \-XX:MaxPermSize=528m"'

alias g='git'

alias cdd='bundle exec cap development deploy'
alias cad='bundle exec cap acceptance deploy'

alias vim='/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim'
alias emacs='/usr/local/Cellar/emacs/24.3/bin/emacs'

# :-)
alias mirror='/Applications/Photo\ Booth.app/Contents/MacOS/Photo\ Booth'

if [ -d /usr/local/Cellar/macvim ]; then
  export EDITOR='/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim'
else
  export EDITOR='vim'
fi
# pass through C-s to vim
vim()
{
  local STTYOPTS="$(stty --save)"
  stty stop '' -ixoff
  command vim "$@"
  stty "$STTYOPTS"
}

export SQLPATH=/opt/oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/bin
export ORACLE_HOME=/opt/oracle/instantclient_11_2
export TERM=screen-256color
export NLS_LANG=AMERICAN_AMERICA.UTF8
 
export PATH=$PATH:$ORACLE_HOME
export PATH=$PATH:/usr/local/mysql/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby ruby
fi

export CPPFLAGS=-I/opt/X11/include
export JVM_OPTS='-Djava.awt.headless=true'
export JRUBY_OPTS='--1.9 -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -J-Djava.awt.headless=true'
export JAVA_OPTS="-client -Djava.awt.headless=true"

# git autocomplete branches
if [ -f ~/.scripts/git-completion.bash ]; then
  . ~/.scripts/git-completion.bash
fi

# ads sub command (https://github.com/37signals/sub)
if [ -f ~/work/ads-sub/bin/ads ]; then
  eval "$(~/work/ads-sub/bin/ads init -)"
fi

set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ ! -n "$SSH_CLIENT" ]; then
  export PS1='\W \u$ '
fi

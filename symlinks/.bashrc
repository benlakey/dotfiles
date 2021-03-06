# MacOS goofyness
export BASH_SILENCE_DEPRECATION_WARNING=1

# GitHub annoying filter branch warnings
export FILTER_BRANCH_SQUELCH_WARNING=1

source ~/.secrets
source ~/.workrc
source ~/.bash/git-completion.sh

export PATH=$PATH:$HOME:$HOME/bin

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias nosleep="caffeinate -d -i -m -s"
fi

alias grep="grep --color=always"
alias less="less -R"
# alias curl="echo \"use instead: http\""

# Git-aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$txtgrn\] \$\[$txtrst\] "

# Shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS=GxFxCxDxBxegedabagaced
alias diff="colordiff"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export LS_OPTIONS='--color=auto'
  eval "$(dircolors -b)"
  alias ls='ls $LS_OPTIONS'
  alias grep='grep $LS_OPTIONS'
  alias fgrep='fgrep $LS_OPTIONS'
  alias egrep='egrep $LS_OPTIONS'
fi

# MacVim
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$PATH:$HOME/.macvim
  alias vi="mvim -v"
  alias vim="mvim -v"
fi
export EDITOR="vim"

# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# per-process macos resource limits
ulimit -n 524288 524288

if [[ "$OSTYPE" == "darwin"* ]]; then
  # dont use chrome gestures to navigate
  defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE
  defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
fi

# Android
PATH=$PATH:~/Library/Android/sdk/platform-tools
export ANDROID_HOME=~/Library/Android/sdk
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# TCP listeners
listening() {
  if [ $# -eq 0 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P
  elif [ $# -eq 1 ]; then
    sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
  else
    echo "Usage: listening [pattern]"
  fi
}

# portslay:  kill the task active on the specified TCP port
portslay() {
   kill -9 `lsof -i tcp:$1 | tail -1 | awk '{ print $2;}'`
}

# Ubuntu-provided default bashrc values
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # If not running interactively, don't do anything
  case $- in
      *i*) ;;
        *) return;;
  esac

  # append to the history file, don't overwrite it
  shopt -s histappend

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# BASH niceties
# date with commands in history
export HISTTIMEFORMAT="%h %d %H:%M:%S "
# keep much more history than default
export HISTSIZE=9999999
# allow the history file to grow to accomodate more history
export HISTFILESIZE=9999999
# append to history instead of replacing it on new session
shopt -s histappend
# write the history immediately instead of at the end of the session
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

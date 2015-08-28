source ~/.secrets
source ~/.workrc
source ~/.bash/git-completion.sh

export PATH=$PATH:$HOME:$HOME/bin

alias grep="grep --color=always"
alias less="less -R"

# Git-aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\[$txtgrn\]\u \[$txtrst\]@ \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias diff="colordiff"

# Git
alias gs="git status"

# MacVim
export PATH=$PATH:$HOME/.macvim
alias vim="mvim -v"
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Ruby
alias bers="bundle exec rails s"
eval "$(rbenv init -)"
alias tags="ctags -R --languages=ruby --exclude=.git --exclude=log . \$(bundle list --paths)"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

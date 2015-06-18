export PATH=/usr/local/bin:$PATH
export EDITOR=~/.scripts/vim

test -r /sw/bin/init.sh && . /sw/bin/init.sh

if [ `uname` = "Darwin" ]; then
  alias ls='ls -G'
fi
alias ll='ls -h1'
alias l="ls -alsht"
alias t="tree -L 2"
alias rdp="sh ~/.scripts/rdp.sh"

alias gvim='~/.scripts/mvim'
alias vim='/usr/bin/vim'

alias j='jobs'

alias s='git status --short'
alias gup='git smart-pull'
alias gl='git smart-log'
alias gm='git smart-merge'
alias gb='git branch -rav'
alias ajax="curl -H 'X-Requested-With: XMLHttpRequest'"

alias be='bundle exec'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Git tab completion
source ~/.scripts/git-completion.bash
# # Show branch in status line
if [ `uname` == "Darwin" ]; then
  PS1='[\W$(__git_ps1 " (%s)")]\$ '
else
  # add hostname if we're not on a mac
  PS1='(\h) [\W$(__git_ps1 " (%s)")]\$ '
fi
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Load environment specific config
PER_ENV_RC=".`hostname`_bash_rc"
if [ -e $PER_ENV_RC ]; then
  source $PER_ENV_RC
fi

# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
export PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"

source ~/.bashrc

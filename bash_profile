PS1="\w$ "

function random_words() {
  ruby ~/Documents/work/cmrb/random_words.rb $1 | pbcopy
}

function top_email_addresses() {
  head -n$1 ~/Desktop/21_subs.csv | cut -f1,2 -d, | pbcopy
}

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
alias vim='~/.scripts/vim'

alias rcc="ruby ~/randcc.rb ~/testcc.txt"
alias ga="top_email_addresses"
alias rw="random_words"
alias j='jobs'
alias start_mongo="mongod --dbpath /var/lib/mongodb/"

alias s='git status --short'
alias gup='git smart-pull'
alias gl='git smart-log'
alias gm='git smart-merge'
alias gb='git branch -rav'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Git tab completion
source ~/.scripts/git-completion.bash
# # Show branch in status line
PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

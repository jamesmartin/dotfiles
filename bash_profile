PS1="\w$ "

function random_words() {
  ruby ~/Documents/work/cmrb/random_words.rb $1 | pbcopy
}

function top_email_addresses() {
  head -n$1 ~/Desktop/21_subs.csv | cut -f1,2 -d, | pbcopy
}

export PATH=/usr/local/bin:$PATH
export EDITOR=~/.scripts/mvim

test -r /sw/bin/init.sh && . /sw/bin/init.sh

alias ls='ls -G'
alias ll='ls -h1'
alias l="ls -alsht"
alias t="tree -L 2"
alias rdp="sh ~/.scripts/rdp.sh"

alias gvim='~/.scripts/mvim'
alias vim='~/.scripts/vim'

alias rcc="ruby ~/randcc.rb ~/testcc.txt"
alias ga="top_email_addresses"
alias rw="random_words"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

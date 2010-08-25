PS1="\n<\[\033[0;32m\]\h\[\033[0m\]:\[\033[0;37m\]\u\[\033[0m\]> \j \w (\[\033[0;36m\]\$(~/TBytes.sh) Mb\[\033[0m\])\n! "
#
function random_words() {
  ruby ~/Documents/work/cmrb/random_words.rb $1 | pbcopy
}

function top_email_addresses() {
  head -n$1 ~/Desktop/21_subs.csv | cut -f1,2 -d, | pbcopy
}

# Setting the path for MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export TERM=xterm-color
export EDITOR=/usr/bin/vim
export CPP_U_TEST=/Users/jma/projects/cpputest/trunk
export CPPUTEST_HOME=/Users/jma/projects/cpputest/trunk

test -r /sw/bin/init.sh && . /sw/bin/init.sh

alias ls='ls -G'
alias ll='ls -h1'
alias l="ls -alsht"
alias t="tree -L 2"
alias rdp="sh ~/dotfiles/scripts/rdp.sh"
alias rdpn="sh ~/rdpn"
alias tlxvpn="sh ~/tlxvpnc"
alias smartssan="sh ~/smartssan"
alias wiki="python ~/moin/moin-1.8.0/wikiserver.py"
alias synergy="sh ~/synergy.sh"

alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

alias rcc="ruby ~/randcc.rb ~/testcc.txt"
alias ga="top_email_addresses"
alias rw="random_words"

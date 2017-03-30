export PATH=~/.scripts:$PATH
export PATH=/usr/local/bin:$PATH
export EDITOR=/usr/bin/vim
GPG_TTY=$(tty)
export GPG_TTY
eval $(gpg-agent --daemon)

test -r /sw/bin/init.sh && . /sw/bin/init.sh

if [ `uname` = "Darwin" ]; then
  alias ls='ls -G'
fi
alias ll='ls -h1'
alias l="ls -alsht"
alias t="tree -L 2"
alias rdp="sh ~/.scripts/rdp.sh"

alias vim=$EDITOR

alias j='jobs'

alias s='git status --short'
alias gup='git smart-pull'
alias gl='git smart-log'
alias gm='git smart-merge'
alias gb='git branch -rav'
alias fmod='git status --porcelain -uno | cut -c4-' # Only the filenames of modified files
alias umod='git status --porcelain -u | cut -c4-' # Only the filenames of unversioned files
alias con='git status --short | grep -E "^(?:U|AA)"'
alias ajax="curl -H 'X-Requested-With: XMLHttpRequest'"
alias marked="open -a 'Marked 2'"

alias be='bundle exec'
alias fix-js="rm -rf node_modules ; script/bootstrap"

# Git tab completion
source ~/.scripts/git-completion.bash
# # Show branch in status line
if [ `uname` == "Darwin" ]; then
  PS1='[\W$(__git_ps1 " (%s)")]\$ '
else
  # add hostname if we're not on a mac
  PS1='(\h) [\W$(__git_ps1 " (%s)")]\$ '
fi
# Prints out a full-width horizontal rule and *then* the prompt to provide a visual cue for the end of command output
export PROMPT_COMMAND="printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -;echo -ne '\033]0;${PWD/#$HOME/~}\007'"

# Load environment specific config
PER_ENV_RC=".`hostname`_bash_rc"
if [ -e $PER_ENV_RC ]; then
  source $PER_ENV_RC
fi

[[ -s "$HOME/.bashrc" ]] && . "$HOME/.bashrc"  # Per machine bash configuration

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-messages --glob '!.git/*'"

# rbenv:
# Rather than `$(rbenv init -)`, prepend rbenv shims onto the path.
# We don't need all of the other fancy rbenv command line stuff.
export PATH="$HOME/.rbenv/shims:$PATH"

PS1="\n<\[\033[0;32m\]\h\[\033[0m\]:\[\033[0;37m\]\u\[\033[0m\]> \j \w (\[\033[0;36m\]\$(~/TBytes.sh) Mb\[\033[0m\])\n! "
#
# Your previous .profile  (if any) is saved as .profile.mpsaved
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
alias rdp="sh ~/rdp.sh"
alias rdpn="sh ~/rdpn"
alias tlxvpn="sh ~/tlxvpnc"
alias smartssan="sh ~/smartssan"
alias wiki="python ~/moin/moin-1.8.0/wikiserver.py"
alias synergy="sh ~/synergy.sh"

alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

##
# Your previous /Users/jma/.profile file was backed up as /Users/jma/.profile.macports-saved_2009-09-08_at_19:51:47
##

# MacPorts Installer addition on 2009-09-08_at_19:51:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/jamesmartin/.bash_profile file was backed up as /Users/jamesmartin/.bash_profile.macports-saved_2010-03-16_at_11:56:13
##

# MacPorts Installer addition on 2010-03-16_at_11:56:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# ALIASES
##

# WTF!!!
alias fuck='$(thefuck $(fc -ln -1))'
alias fml="fuck"

# replace existing stuff
alias top="htop"
alias git="hub"

# print out your file tree
if [[ "$PLATFORM" == "mac" ]]; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi;

alias sp="spotify"

# git commands
alias gst="git status"
alias gco="git checkout"
alias gcl="git clone"

# moving around the file system
alias treset="cd ~;clear;ls"
alias clr="clear;ls"
alias r-treset="cd /;clear"
alias pclr="clear;pwd;ls"
alias cd..="cd .."
alias lss="ls -la"

#editor commands
alias c="code" # Visual Studio Code
if [[ "$PLATFORM" == "mac" ]]; then
    alias mvim="/Applications/MacVim.app/Contents/bin/mvim" # MacVim
fi;

# opening and editing the bash profile
alias bashup="clear; source ~/.bash_profile"
alias zshup="clear; source ~/.zshrc;"
alias c-bash="code ~/.bash_profile ~/.aliases.sh ~/.functions.sh ~/.exports.sh ~/.zshrc"

# shortcuts
if [[ "$PLATFORM" == "mac" ]]; then
    alias brewi="brew install"
    alias brewu="brew update"
    alias brewit="brew upgrade"
    alias lfind="find ~/ -name"
    alias afind="find / -name"
fi;

# ip
alias myip='curl icanhazip.com'

# apache commands
if [[ "$PLATFORM" == "mac" ]]; then
    alias apacheEdit='code /etc/apache2/'     # apacheEdit:       Edit httpd.conf
    alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
    alias editHosts='sudo code /etc/hosts'                  # editHosts:        Edit /etc/hosts file
    alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
    alias apacheLogs='less +F /var/log/apache2/error_log'   # Apachelogs:   Shows apache error logs
    alias apacheServers='cat /etc/apache2/extra/httpd-vhosts.conf | grep -E "ServerName|ServerAlias" | grep -v "#"'
fi;

alias tracert="traceroute"

if [[ "$PLATFORM" == "mac" ]]; then
   alias geny="open /Applications/Genymotion.app"
fi;

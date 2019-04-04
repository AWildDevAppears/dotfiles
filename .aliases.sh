##
# ALIASES
##

# print out your file tree
if [[ "$PLATFORM" == "mac" ]]; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi;

# git commands
alias gst="git status"
alias gco="git checkout"
alias gcod="git checkout develop"
alias gcom="git checkout master"
alias gcl="git clone"

if [[ "$PLATFORM" == "mac" ]]; then
    alias git-author="git commit --amend --author=\"Josh Burgess <jburgess@whiteoctober.co.uk>\""
else
    alias git-author="git commit --amend --author=\"Josh Burgess <joshuacburgess32@gmail.com>\""
fi;

# moving around the file system
alias clr="clear;ls"
alias cd..="cd .."

#editor commands
alias c="code" # Visual Studio Code

# opening and editing the bash profile
alias zshup="clear; source ~/.zshrc;"

# shortcuts
if [[ "$PLATFORM" == "mac" ]]; then
    alias brewi="brew install"
    alias brewu="brew update"
    alias brewit="brew upgrade"
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

# Replacements

# exa over ls
if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
fi

# RipGrep over grep
if [ -x "$(command -v rg)" ]; then
    alias grep="rg"
fi

if [ -x "$(command -v htop)" ]; then
    alias top="htop"
fi

if [ -x "$(command -v hub)" ]; then
    alias git="hub"
fi

if [ -x "$(command -v nvim)" ]; then
    alias vim="nvim"
fi

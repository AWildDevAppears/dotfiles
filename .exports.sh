export SSH_KEY_PATH="~/.ssh/rsa_id"

if [[ "$PLATFORM" == "mac" ]]; then
    export DEFAULT_USER="joshburgess"
    export HOME="/Users/joshburgess"

    export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

    ##
    # SET UP RBENV
    ##
    export PATH=/Users/joshburgess/.rbenv/shims:/Users/joshburgess//.rbenv/completions/rbenv.bash:$PATH

    ##
    # SET UP BINARY FILES
    ##
    export PATH=/usr/bin:/bin:$PATH
    export PATH=:/Users/joshburgess/bin:$PATH
    export PATH=/opt/local/bin:/opt/local/sbin:Users/joshburgess/bin:$PATH
    export PATH=/usr/local/bin:$PATH
    export PATH="/usr/local/sbin:$PATH"
    export PATH=/Users/joshburgess/.local/bin:$PATH

    export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
else
    export DEFAULT_USER="crow"
    export HOME="/home/crow"

    ##
    # SET UP RBENV
    ##
    export PATH=/home/crow/.rbenv/shims:/home/crow//.rbenv/completions/rbenv.bash:$PATH

    ##
    # SET UP BINARY FILES
    ##
    export PATH=/usr/bin:/bin:$PATH
    export PATH=:/home/crow/bin:$PATH
    export PATH=/opt/local/bin:/opt/local/sbin:/home/crow/bin:$PATH
    export PATH=/usr/local/bin:$PATH
    export PATH="/usr/local/sbin:$PATH"
    export PATH=/home/crow/.local/bin:$PATH
fi;


##
# SET UP PYENV
##
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

source $HOME/.cargo/env

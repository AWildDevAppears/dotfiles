# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export PLATFORM="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PLATFORM="mac"
else
  export PLATFORM="unknown"
fi

# Path to your oh-my-zsh installation.
if [[ "$PLATFORM" == "mac" ]]; then
  export ZSH=/Users/joshburgess/.oh-my-zsh
elif [[ "$PLATFORM" == "linux" ]]; then
  export ZSH=/home/crow/.oh-my-zsh
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Config
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time virtualenv symfony2_version nvm node_version)

POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx ruby adb zsh-nvm composer cp docker rvm sublime drush zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/share/man:$MANPATH"


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ "$PLATFORM" == "mac" ]]; then
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='mvim'
  fi
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh

##
# JDK
##
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/joshburgess/Library/Android/sdk/platform-tools
export PATH=/Users/joshburgess/Library/Android/sdk:$PATH
export PATH=${PATH}:/Users/joshburgess/Library/Android/sdk/platform-tools:/Users/joshburgess/Library/Android/sdk/tools
export PATH=${JAVA_HOME}/bin:$PATH

export PATH=/Users/joshburgess/Code/projects/depot_tools:$PATH

##
# GOlang
##
export GOPATH=$HOME/work

##
# NVM
##
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PKG_CONFIG_PATH=$(brew --prefix python3)/Frameworks/Python.framework/Versions/3.4/lib/pkgconfig:$(brew --prefix qt5)/lib/pkgconfig:$(brew --prefix oniguruma)/lib/pkgconfig

if [[ "$PLATFORM" == "mac" ]]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  eval $(thefuck --alias)
fi

source "$HOME/.exports.sh"
source "$HOME/.aliases.sh"
source "$HOME/.functions.sh"


if [[ "$PLATFORM" == "mac" ]]; then
  export NVM_DIR="/Users/joshburgess/.nvm"
else
  export NVM_DIR="/home/crow/.nvm"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Minicom
export PATH=/opt/minicom/2.2/bin:$PATH

#Yarn
export PATH="$PATH:/opt/yarn-[version]/bin"


unsetopt correct_all
ssh-add 2>/dev/null;
autoload -U compinit && compinit
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

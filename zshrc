# Path to your oh-my-zsh installation.
  export ZSH=/home/ruben/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#RPROMPT="$(date "+%Y-%m-%d %H:%M:%S")"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Ignore duplicates in history
HIST_IGNORE_ALL_DUPS="true"
HIST_FIND_NO_DUPS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python sudo)

# User configuration

  export PATH="/home/ruben/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/ruben/.fzf/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -la --color'
alias l='ls -CF --color'
alias ls='ls --color'
alias e='nvim'
alias gp4='~/bin/git-p4.py'
alias rsync='rsync -rav --progress'
alias rdesktop='rdesktop -g 1200x1000 -k da'
alias gits='git status -uall'
alias gitu='git add -u'
alias gitp='git add -p'
alias gitc='git commit'
alias gitl='git log'
alias git-tree='git log --oneline --graph --decorate --all'
alias emacss='emacs --no-window-system'
alias ack='ack-grep'
alias updateit='sudo apt update && sudo apt -y upgrade'
alias tmux='tmux -2'
alias pretty_json='python -mjson.tool'
alias squash_pyc='find . -type f -name "*.pyc" -exec rm -f {} \;'
alias squash_pycache='find . -type d -name "__pycache__" -exec rm -rf {} \;'
alias v='vim'
alias ag='ag -S'  # Use smartcase by default

export ALTERNATE_EDITOR=""

# functions
function watch_tsx {
find . -name "*.tsx" |entr npm run build
}

# Make sure terminal uses 256 colors
export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ruben/.sdkman"
[[ -s "/home/ruben/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ruben/.sdkman/bin/sdkman-init.sh"

#xmodmap ~/.xmodmap

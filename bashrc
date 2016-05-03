export P4CLIENT=ruben
export P4USER=ruben
export P4PORT=ribe:1666
export P4EDITOR=nano

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset


alias ll='ls -la --color'
alias l='ls -CF --color'
alias ls='ls --color'
alias gp4='~/bin/git-p4.py'
alias rsync='rsync -rav --progress'
alias rdesktop='rdesktop -g 1200x1000 -k da'
alias gits='git status'
alias gitu='git add -u'
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

# source ~/bin/git-prompt.sh

# Color for the prompt
# PS1="${txtblu}\u${txtrst}@${txtgrn}\h${txtylw}\$(__git_ps1)${txtrst}:${txtred}\w${txtrst}\n \$ "


#function _update_ps1() {
#	PS1="$(~/powerline-shell.py --mode compatible $? 2> /dev/null)"
#}
#
#if [ "$TERM" != "linux" ]; then
#   PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

# Fortune cow
#fortune |cowsay -f tux

export USER_FULL_NAME='Ruben Nielsen'
export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ruben/.sdkman"
[[ -s "/home/ruben/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ruben/.sdkman/bin/sdkman-init.sh"

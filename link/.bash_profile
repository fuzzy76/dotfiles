########################
# Environment variables
########################

export PATH="$HOME/repos/dotfiles/bin:$HOME/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH"

export EDITOR=nano
#export EDITOR="atom -nw"
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PRO_BASE="$HOME/repos"
export ANSIBLE_NOCOWS=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export LC_ALL=nb_NO.UTF-8
export LANG=nb_NO.UTF-8

PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"

###############
# Autocomplete
###############

#complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
if [ -f $(brew --prefix)/etc/bash_completion ]; then . $(brew --prefix)/etc/bash_completion ; fi
source $HOME/repos/dotfiles/bin/git-completion.sh

##########
# Aliases
##########

#alias weechat="ssh -t matilda.fuzzy76.net ./weechat.sh"
#alias weechat="mosh matilda.fuzzy76.net ./weechat.sh"
alias cloudconflict="find ~/CloudStation/ -name *_Conflict.* ; find ~/CloudStation/ -name *_Conflict"
alias drupalcs="phpcs --standard=Drupal,DrupalPractice --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"
alias gitall="ls | xargs -t -I{} git -C {}"
#-P10
############
# Functions
############

# pro cd function
pd() {
  local projDir=$(pro search $1)
  cd ${projDir}
}

####################
# Ending operations
####################

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PS1="[\u@\h:\W\$(git-radar --bash --fetch)] "
cloudconflict

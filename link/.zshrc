########################
# Environment variables
########################

export PATH="$HOME/repos/dotfiles/bin:$HOME/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH"

export EDITOR=nano
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export ANSIBLE_NOCOWS=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export LC_ALL=no_NO.UTF-8
export LANG=no_NO.UTF-8

PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"
export PROMPT='%F{yellow}%n@%m:%~%f %# '

###############
# Autocomplete
###############

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
#if [ -f $(brew --prefix)/etc/bash_completion ]; then . $(brew --prefix)/etc/bash_completion ; fi
#source $HOME/repos/dotfiles/bin/git-completion.sh

##########
# Aliases
##########

alias gitall="ls | xargs -t -I{} git -C {}"
alias typora="open -a typora"
alias bertha="sudo mkdir /Volumes/bertha ; sudo chown fuzzy76 /Volumes/bertha ; sudo mount_nfs -o rw,bg,hard,resvport,intr,ac,nfc,tcp bertha.local:/volume1/fuzzy76/ /Volumes/bertha/"

#-P10
############
# Functions
############


####################
# Ending operations
####################

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# export PS1="[\u@\h:\W\$(git-radar --bash --fetch)] "
# export PROMPT="$PROMPT\$(git-radar --zsh --fetch) "
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"


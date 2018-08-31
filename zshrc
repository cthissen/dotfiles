# enable colors 
autoload colors zsh/terminfo
colors




 #minimal prompt 
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh


plugins=(git osx extract Z) 
export ZSH=/Users/christhissen/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

 #minimal prompt
# left is right arrow char 
# right current path 
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# autostart tmux 
if [ "$TMUX" = "" ]; then tmux; fi 

# audo cd 
setopt auto_cd 

# spellcheck /typo correction 
setopt correctall 
alias git status='nocorrect git status' 

# get antigen 
if [[ ! -f ~/.antigen.zsh ]]; then
  curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
fi
source /usr/local/share/antigen/antigen.zsh

# syntax highlighting on prompt
antigen bundle zsh-users/zsh-syntax-highlighting

# autocomplete 
antigen bundle zsh-users/zsh-autosuggestions

# git shorthand (git -> g) 
antigen bundle git 


antigen apply

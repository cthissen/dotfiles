# enable colors 
autoload colors zsh/terminfo
colors

# minimal prompt 
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

#====================================
# Ansible generated file, DO NOT EDIT
#====================================
# Modern ls & tree alternatives with eza
alias ls="eza --icons=auto"
alias ll="ls -l"
alias lt="ls -lt"
alias la="ls -al"
# git-ignore vbersions of the above
alias gls="ls --git-ignore"
alias gll="gls -l"
alias glt="gls -lt"
alias gla="gls -al"
# tree versions
alias tree="eza --tree"
alias gtree="tree --git-ignore"
# Folder shortcuts
alias godev="cd $PROJECTS"
alias gopro="cd $PROJECTS"
alias goconf="cd $HOME/.config"
# Add more advanced aliases
alias edit="$EDITOR"
alias remove="rm -rf"
alias reload="source ~/.zshrc"
alias vim=nvim
alias vienv="vim ~/.env"
alias brewup="brew update && brew upgrade"

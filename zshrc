# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# Settings
source ~/.zsh/settings.zsh

# Aliases
source ~/.zsh/aliases.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

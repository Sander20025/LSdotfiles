# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# thefuck alias

eval $(thefuck --alias)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


alias vim="nvim"

#krew to path 
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias kn="kubens"
alias kx="kubectx"
alias tf="terraform"
alias k="kubectl"
alias ke='kubectl exec -i -t'
alias kg='kubectl get pods'
alias kd='kubectl describe pod'
alias kl='kubectl logs'
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Change the color for autosuggestions to a very light blue, close to white
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#E5E9F0'  # Almost white light blue for better visibility

# Update zsh-syntax-highlighting colors for better readability with lighter tones
ZSH_HIGHLIGHT_STYLES[comment]='fg=#ECEFF4'    # Very light grey for comments
ZSH_HIGHLIGHT_STYLES[command]='fg=#D8DEE9'    # Almost white for commands
ZSH_HIGHLIGHT_STYLES[alias]='fg=#E5E9F0'      # Very light for aliases, close to white
ZSH_HIGHLIGHT_STYLES[function]='fg=#ECEFF4'   # Whiter tone for functionssource /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


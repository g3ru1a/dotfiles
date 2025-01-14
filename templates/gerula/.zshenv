source ~/.profile

export PATH="/home/<user>/.local/share/go/bin:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
# Cab probably delete
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Move all the DIRs to .local/share
export CARGO_HOME="${HOME}/.local/share/cargo"
export RUSTUP_HOME="${HOME}/.local/share/rust"
export GOPATH="${HOME}/.local/share/go"
export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/ripgreprc"

# ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# user environment variables
# XDG Base Directories
# export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# editor and viewers
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export MANPAGER='less'
#export MANPAGER='nvimpager'


# FZF settings
export FZF_DEFAULT_OPTS='
    --exact
    --reverse
    --border=rounded
    --cycle
    --height=100%
    --info=hidden
    --prompt=➜\
    --pointer=➜
    --color=16
    --color=bg:-1,bg+:#332E41
    --color=fg:#DADAE8,fg+:#DADAE8
    --color=hl:#DADAE8,hl+:#A4B9EF
    --color=prompt:#F2CECF
    --color=pointer:-1
    --color=gutter:-1
    --color=marker:-1
    --color=spinner:-1
    --color=border:#A4B9EF'

# デモ GIF 撮影用の zsh 設定（docs/demo.tape から使う）
HISTFILE=/dev/null
PROMPT='%F{blue}❯%f '
bindkey -e
command -v fzf >/dev/null && source <(fzf --zsh)
source "${ZDOTDIR:h:h}/zsh-bindkey-ja.plugin.zsh"

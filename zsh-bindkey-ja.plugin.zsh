# zsh-bindkey-ja: zsh のキーバインドを日本語の説明付きで一覧表示する
#
#   bindkey-ja       … emacs モード（bindkey -e）のキー
#   bindkey-ja -v    … vi モード（bindkey -v）の入力モード・ノーマルモードのキー
#   bindkey_ja_add <widget> <説明>
#                    … 自作ウィジェットなどの説明を追加する（既存の説明の上書きにも使える）
#
# 説明はウィジェット名に紐づけているので、表示されるキーは常に今の bindkey 設定が反映される。
# キーが割り当てられていないウィジェットは表示しない。

# 表示順に「ウィジェット名 説明」を並べる。'--- ' で始まる要素は見出し

# emacs モード
typeset -ga _bindkey_ja_emacs=(
  '--- 移動'
  beginning-of-line             '行の先頭へ移動'
  end-of-line                   '行の末尾へ移動'
  forward-word                  '1単語右へ移動'
  backward-word                 '1単語左へ移動'
  forward-char                  '1文字右へ移動'
  backward-char                 '1文字左へ移動'
  '--- 削除・貼り付け'
  backward-kill-word            'カーソルの左の1単語を削除'
  kill-word                     'カーソルの右の1単語を削除'
  kill-line                     'カーソルから行末までを削除'
  kill-whole-line               '行全体を削除'
  backward-kill-line            'カーソルから行頭までを削除'
  yank                          '削除した文字を貼り付け'
  '--- 履歴'
  up-line-or-history            '1つ前の履歴を表示'
  down-line-or-history          '1つ後の履歴を表示'
  history-incremental-search-backward '履歴を文字列で検索'
  fzf-history-widget            'コマンド履歴をfzfで検索'
  insert-last-word              '直前のコマンドの最後の引数を挿入'
  '--- fzf'
  fzf-file-widget               'ファイルをfzfで選んで挿入'
  fzf-cd-widget                 'ディレクトリをfzfで選んで移動'
  '--- その他'
  abbr-expand-and-insert        'abbrを展開してスペースを入力 (zsh-abbr)'
  clear-screen                  '画面をクリア'
  undo                          '直前の編集を取り消す'
  push-line                     '入力中のコマンドを退避し、次のコマンド実行後に戻す'
  edit-command-line             '入力中のコマンドをエディタで編集'
  which-command                 'カーソル位置のコマンドの正体を表示'
  transpose-words               '直前の2単語を入れ替える'
)

# vi モードの入力モード（文字を打っている状態）
typeset -ga _bindkey_ja_viins=(
  '--- モード切り替え'
  vi-cmd-mode                   'ノーマルモードへ切り替え'
  '--- 削除'
  vi-backward-kill-word         'カーソルの左の1単語を削除'
  vi-kill-line                  'カーソルから行頭までを削除'
  vi-backward-delete-char       'カーソルの左の1文字を削除'
  '--- 履歴'
  fzf-history-widget            'コマンド履歴をfzfで検索'
  '--- fzf'
  fzf-file-widget               'ファイルをfzfで選んで挿入'
  fzf-cd-widget                 'ディレクトリをfzfで選んで移動'
  '--- その他'
  abbr-expand-and-insert        'abbrを展開してスペースを入力 (zsh-abbr)'
  clear-screen                  '画面をクリア'
)

# vi モードのノーマルモード（Esc を押した後の状態）
typeset -ga _bindkey_ja_vicmd=(
  '--- 移動'
  vi-backward-char              '1文字左へ移動'
  vi-forward-char               '1文字右へ移動'
  vi-forward-word               '次の単語の先頭へ移動'
  vi-backward-word              '前の単語の先頭へ移動'
  vi-forward-word-end           '単語の末尾へ移動'
  vi-digit-or-beginning-of-line '行の先頭へ移動'
  vi-first-non-blank            '行の最初の空白でない文字へ移動'
  vi-end-of-line                '行の末尾へ移動'
  vi-find-next-char             '右にある指定した文字へ移動'
  vi-find-prev-char             '左にある指定した文字へ移動'
  vi-repeat-find                '直前の文字移動(f/F)を繰り返す'
  '--- 入力モードへ'
  vi-insert                     'カーソルの前から入力'
  vi-add-next                   'カーソルの後ろから入力'
  vi-insert-bol                 '行の先頭から入力'
  vi-add-eol                    '行の末尾から入力'
  vi-change-eol                 'カーソルから行末までを消して入力'
  vi-change-whole-line          '行全体を消して入力'
  '--- 削除・コピー・貼り付け'
  vi-delete-char                'カーソル位置の1文字を削除'
  vi-delete                     '削除（dw で1単語、dd で行全体）'
  vi-kill-eol                   'カーソルから行末までを削除'
  vi-change                     '消して入力（cw で1単語）'
  vi-replace-chars              'カーソル位置の1文字を置き換え'
  vi-yank                       'コピー（yw で1単語、yy で行全体）'
  vi-put-after                  'カーソルの後ろに貼り付け'
  vi-put-before                 'カーソルの前に貼り付け'
  '--- 履歴'
  up-line-or-history            '1つ前の履歴を表示'
  down-line-or-history          '1つ後の履歴を表示'
  vi-history-search-backward    '履歴を文字列で検索'
  vi-repeat-search              '直前の履歴検索を繰り返す'
  fzf-history-widget            'コマンド履歴をfzfで検索'
  '--- その他'
  undo                          '直前の編集を取り消す'
  vi-repeat-change              '直前の変更を繰り返す'
  visual-mode                   '範囲選択を始める'
  vi-swap-case                  'カーソル位置の大文字・小文字を入れ替える'
  clear-screen                  '画面をクリア'
)

# bindkey_ja_add で追加された説明（ウィジェット名 → 説明）と、その追加順
typeset -gA _bindkey_ja_user
typeset -ga _bindkey_ja_user_order

bindkey_ja_add() {
  if (( $# != 2 )); then
    print -u2 'usage: bindkey_ja_add <widget> <説明>'
    return 1
  fi
  (( ${+_bindkey_ja_user[$1]} )) || _bindkey_ja_user_order+=("$1")
  _bindkey_ja_user[$1]=$2
}

# bindkey の表記を読みやすくする（例: ^[f → Alt-f, " " → Space）
_bindkey_ja_pretty_key() {
  local k=$1
  case $k in
    ' ')    REPLY='Space' ;;
    '^?')   REPLY='Backspace' ;;
    '^[')   REPLY='Esc' ;;
    '^[^?') REPLY='Alt-Backspace' ;;
    '^['?*) REPLY="Alt-${k#'^['}" ;;
    *)      REPLY=$k ;;
  esac
}

# 1つのキーマップを、説明一覧の順に表示する
#   $1: キーマップ名（emacs / viins / vicmd）  $2: 説明一覧の変数名
_bindkey_ja_show() {
  local keymap=$1 list_name=$2
  local line key widget REPLY
  local -A keys  # ウィジェット名 → キー（複数あれば " / " でつなぐ）

  # 今のキーバインドを読み取り、ウィジェットごとにキーをまとめる
  for line in "${(@f)$(bindkey -M $keymap)}"; do
    [[ $line =~ '^"(.*)" ([^ "]+)$' ]] || continue
    key=${match[1]}
    widget=${match[2]}
    # bindkey は $ や ^ などの1文字を \$ \^ と書くので、\ を外す
    [[ $key == \\? ]] && key=${key#\\}
    # 矢印キーなどのエスケープシーケンス、Alt+大文字の重複、Alt+Ctrl の組み合わせは表示しない
    [[ $key == '^[['* || $key == '^[O'* || $key == '^['[A-Z] ]] && continue
    [[ $key == '^[^'* && $key != '^[^?' ]] && continue
    _bindkey_ja_pretty_key "$key"
    keys[$widget]+="${keys[$widget]:+ / }$REPLY"
  done

  local -a list=("${(@P)list_name}")
  local -A shown
  # 表示する行をいったん溜める。見出しは「--- 見出し」、行は「キー<TAB>ウィジェット<TAB>説明」
  local -a rows
  local i name desc header=''

  for (( i = 1; i <= ${#list}; i++ )); do
    name=${list[i]}
    if [[ $name == '--- '* ]]; then
      # 見出しは、その下に表示する行が1つでもあるときだけ出す
      header=$name
      continue
    fi
    desc=${list[++i]}
    shown[$name]=1
    [[ -n ${keys[$name]} ]] || continue
    [[ -n $header ]] && rows+=("$header") && header=''
    # bindkey_ja_add で上書きされていればそちらを使う
    rows+=("${keys[$name]}"$'\t'"$name"$'\t'"${_bindkey_ja_user[$name]:-$desc}")
  done

  # bindkey_ja_add で追加された説明のうち、上の一覧になかったもの
  header='--- 追加した説明'
  for name in $_bindkey_ja_user_order; do
    (( ${+shown[$name]} )) && continue
    [[ -n ${keys[$name]} ]] || continue
    [[ -n $header ]] && rows+=("$header") && header=''
    rows+=("${keys[$name]}"$'\t'"$name"$'\t'"${_bindkey_ja_user[$name]}")
  done

  # 列の幅を、表示する中身のいちばん長いものに合わせる
  local row key_w=0 widget_w=0
  local -a cols
  for row in $rows; do
    [[ $row == '--- '* ]] && continue
    cols=("${(@ps:\t:)row}")
    (( ${#cols[1]} > key_w )) && key_w=${#cols[1]}
    (( ${#cols[2]} > widget_w )) && widget_w=${#cols[2]}
  done

  for row in $rows; do
    if [[ $row == '--- '* ]]; then
      print -P "\n%F{cyan}${row#'--- '}%f"
      continue
    fi
    cols=("${(@ps:\t:)row}")
    printf "  %-${key_w}s  %-${widget_w}s  %s\n" "${cols[@]}"
  done
}

bindkey-ja() {
  emulate -L zsh
  case $1 in
    -v)
      print -P '%B%F{yellow}■ vi モード：入力モード（viins）%f%b'
      _bindkey_ja_show viins _bindkey_ja_viins
      print -P '\n%B%F{yellow}■ vi モード：ノーマルモード（vicmd）%f%b'
      _bindkey_ja_show vicmd _bindkey_ja_vicmd
      ;;
    ''|-e)
      print -P '%B%F{yellow}■ emacs モード%f%b'
      _bindkey_ja_show emacs _bindkey_ja_emacs
      ;;
    -h|--help)
      print 'usage: bindkey-ja [-e|-v]'
      print '  -e  emacs モードのキーを表示（省略時）'
      print '  -v  vi モードのキーを表示'
      ;;
    *)
      print -u2 'usage: bindkey-ja [-e|-v]'
      return 1
      ;;
  esac
}

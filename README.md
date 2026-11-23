# zsh-bindkey-ja

zsh の`bindkey`を日本語の説明で表示します。

![bindkey-ja のデモ](docs/demo.gif)

```
$ bindkey-ja
■ emacs モード

移動
  ^A                  beginning-of-line                    行の先頭へ移動
  ^E                  end-of-line                          行の末尾へ移動
  Alt-f               forward-word                         1単語右へ移動

削除・貼り付け
  ^W / Alt-Backspace  backward-kill-word                   カーソルの左の1単語を削除
  ^K                  kill-line                            カーソルから行末までを削除
...
```

## 特徴

- **今の設定がそのまま表示される**：説明はキーではなくウィジェット名に紐づけています。表示するキーは実行のたびに `bindkey` から読み取るので、キーの割り当てを変えても表示が追従します。
- **割り当てのないものは出ない**：キーが割り当てられていないウィジェットは表示しません。fzf などのプラグインを入れていなければ、その行は出ません。
- **vi モードにも対応**：`bindkey-ja -v` で、入力モード（viins）とノーマルモード（vicmd）を表示します。
- **自作ウィジェットの説明を足せる**：`bindkey_ja_add` で説明を追加・上書きできます。

## インストール

### source で読み込む

好きな場所に clone して、`.zshrc` から `source` で読み込みます。

```zsh
git clone https://github.com/asa129/zsh-bindkey-ja ~/.zsh/zsh-bindkey-ja
echo 'source ~/.zsh/zsh-bindkey-ja/zsh-bindkey-ja.plugin.zsh' >> ~/.zshrc
```

### oh-my-zsh

oh-my-zsh のカスタムプラグインとして clone します。

```zsh
git clone https://github.com/asa129/zsh-bindkey-ja ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bindkey-ja
```

`.zshrc` の `plugins=()` に追加します。

```zsh
plugins=(... zsh-bindkey-ja)
```

## 使い方

```zsh
bindkey-ja       # emacs モード（bindkey -e）のキーを表示
bindkey-ja -v    # vi モード（bindkey -v）のキーを表示
```

### 自作ウィジェットの説明を追加する

`.zshrc` で、プラグインを読み込んだ後に説明を追加します。

```zsh
bindkey_ja_add ghq-fzf 'ghqのリポジトリをfzfで選んで移動'
```

標準の一覧にないウィジェットは「追加した説明」という見出しの下に表示されます。
標準の一覧にあるウィジェットを指定すると、その説明を上書きします。

### 短く呼び出す

alias や [zsh-abbr](https://github.com/olets/zsh-abbr) で短縮名を付けると便利です。

```zsh
alias bkj='bindkey-ja'
```

## ライセンス

[MIT](LICENSE)

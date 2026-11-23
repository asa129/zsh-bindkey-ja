# デモ GIF を作る VHS の台本
# リポジトリのルートで `vhs docs/demo.tape` を実行すると docs/demo.gif ができる

Output docs/demo.gif

Set Shell "zsh"
Set FontSize 15
Set Width 1150
Set Height 1340
Set Padding 20
Set Theme "Catppuccin Mocha"
Set TypingSpeed 80ms

# デモ用の設定で zsh を起動し直す（撮影には映さない）
Hide
Type "ZDOTDIR=$PWD/docs/demo exec zsh"
Enter
Sleep 1s
Type "clear"
Enter
Sleep 500ms
Show

Sleep 500ms
Type "bindkey-ja"
Sleep 500ms
Enter
Sleep 5s

Type "clear"
Enter
Sleep 500ms
Type "bindkey-ja -v"
Sleep 500ms
Enter
Sleep 5s

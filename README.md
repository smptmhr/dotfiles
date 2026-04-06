# initial setting
```
cd ~ && git clone git@github.com:smptmhr/dotfiles.git
```

```shell
## zshrc
ln -s ~/dotfiles/.zshrc ~

## vimrc
ln -s ~/dotfiles/.vimrc ~

## claude
### 既に存在する場合は、退避させてからシンボリックリンクを貼る
mv ~/.claude ~/.claude.bak # (退避)
ln -s ~/dotfiles/.claude ~/.claude 
```

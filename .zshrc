## プラグインマネージャ (Zinit) の自動インストール
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

########## 高速起動を維持するため、これより下でコンソール出力を行わないこと ##########

## Powerlevel10k Instant Prompt 初期化
## .zshrcの読み込みが終わるまでの仮のシェル(読み込みが終わるとzshにシームレスに移行する。)
## Instant Promptの使用中にコンソール出力を行うとwarningが出る
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## プラグインマネージャー (Zinit) のロード
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## Aliases
alias cd_to_some_directory='cd ~/Documents/path/to/some/directory'

## shellのテーマ設定
zinit ice depth=1
zinit light romkatv/powerlevel10k

### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

## git関連
### git-promptの読み込み
source ~/.zsh/git-prompt.sh

### git-completionの読み込み
### 参考: https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/bin:$PATH"

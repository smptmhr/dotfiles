#!/bin/bash
PIDFILE="$HOME/.claude/notifier.pid"

# 既存の再通知プロセスをキャンセル
if [ -f "$PIDFILE" ]; then
    kill "$(cat "$PIDFILE")" 2>/dev/null
    rm -f "$PIDFILE"
fi

# 即時通知
/opt/homebrew/bin/terminal-notifier -title 'Claude Code' -message 'ユーザ確認待ちです' -sound Glass

# 60秒後に1度だけ再通知してPIDファイルを削除
(
    sleep 60
    /opt/homebrew/bin/terminal-notifier -title 'Claude Code ⏰' -message 'まだ確認待ちです（再通知）' -sound Glass
    rm -f "$PIDFILE"
) &
echo $! > "$PIDFILE"

#!/bin/bash
PIDFILE="$HOME/.claude/notifier.pid"
if [ -f "$PIDFILE" ]; then
    kill "$(cat "$PIDFILE")" 2>/dev/null
    rm -f "$PIDFILE"
fi

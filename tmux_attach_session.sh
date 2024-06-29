#!/bin/bash
if [ ! -f "./workspace.tmux" ]; then
    echo "workspace.tmux must be in the cwd"
    exit 1
fi

if [ -z "$1" ]; then
    echo "A session name must be provided"
    exit 1
fi

if ! tmux has-session -t $1 2>/dev/null; then
  tmux new-session -d -s $1
  tmux source-file ./workspace.tmux
fi

tmux attach -t $1

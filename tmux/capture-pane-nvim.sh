TTF=$(mktemp)

tmux capture-pane -eS -
tmux save-buffer $TTF
tmux delete-buffer
tmux new-window ~/.config/tmux/open-nvim-tmp-buffer.sh $TTF

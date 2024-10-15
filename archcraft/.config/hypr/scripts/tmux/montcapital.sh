#!/bin/bash

session_name='montcapital'

tmux has-session -t $session_name
if [ $? != 0  ]
then
    tmux new-session -ds $session_name -x- -y-
    tmux split-window -h -t $session_name:0.0
    tmux send-keys -t $session_name:0.0 'cd ~/Projects/php/mont-api/' C-m C-l
    tmux send-keys -t $session_name:0.1 'cd ~/Projects/php/mont-api/' C-m C-l
    tmux new-window -n outros
    tmux split-window -h -t $session_name:outros.0
    tmux select-window -t $session_name:0
    tmux select-pane -t $session_name:outros.0
    tmux rename-window -t $session_name 'projeto'
    tmux select-pane -t $session_name:projeto.0
fi

tmux attach -t $session_name

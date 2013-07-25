if [ $TERM != "screen" -o $SSH_TTY != "" ]; then
	exec screen -S main -xRR
fi

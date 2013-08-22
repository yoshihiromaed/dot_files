if [ $TERM != "screen" -o $SSH_TTY -ne "" ]; then
	exec screen -S main -xRR
fi

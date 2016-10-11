all:
	stow -t ~/ -v git vim zsh tmux

clean:
	stow -D -t ~/ -v git vim zsh tmux

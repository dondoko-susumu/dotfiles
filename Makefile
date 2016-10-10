all:
	stow -t ~/ -v git vim zsh

clean:
	stow -D -t ~/ -v git vim zsh

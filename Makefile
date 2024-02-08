all:
	stow --verbose --target=$$HOME .

delete:
	stow --verbose --target=$$HOME --delete .

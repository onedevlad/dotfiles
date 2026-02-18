.PHONY: all
all:
	stow --verbose --target=$$HOME .

.PHONY: delete
delete:
	stow --verbose --target=$$HOME --delete .

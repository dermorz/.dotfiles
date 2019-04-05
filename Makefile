STOW = stow -v

.PHONY: install
install: git config zsh vim

.PHONY: zsh
zsh:
	$(STOW) zsh

.PHONY: config
config:
	$(STOW) config

.PHONY: git
git:
	$(STOW) git

.PHONY: vim
vim: fzf
	$(STOW) vim
	vim +PlugInstall +qall

.PHONY: fonts
fonts:
	find fonts \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v {} ~/Library/Fonts \;

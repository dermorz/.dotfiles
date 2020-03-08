STOW = stow -v

.PHONY: link
link: git zsh vim

.PHONY: zplug
zplug:
	-[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug.git ~/.zplug

.PHONY: zsh
zsh: zplug
	$(STOW) zsh

.PHONY: config
config:
	$(STOW) config

.PHONY: git
git:
	$(STOW) git

.PHONY: vim
vim:
	$(STOW) vim
	vim +PlugInstall +qall

.PHONY: fonts
fonts:
	find fonts \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v {} ~/Library/Fonts \;

.PHONY: install
install: brew brew-install

.PHONY: brew
brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: brew-install
brew-install:
	brew install $$(< homebrew)
	brew cask install $$(< homebrew-cask)

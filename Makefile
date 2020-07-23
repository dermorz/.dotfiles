STOW = stow -v

.PHONY: link
link: git zsh config vim x

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
	nvim +PlugInstall +qall
	nvim +"CocInstall -sync coc-go coc-json coc-python coc-spell-checker coc-texlab coc-vimlsp coc-yaml" +q

.PHONY: x
x:
	$(STOW) x

.PHONY: brew
brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: brew-install
brew-install:
	brew install $$(< homebrew)
	brew cask install $$(< homebrew-cask)

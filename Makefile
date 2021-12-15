install: dependency
	yay -S ttf-cascadia-code
	yay -S tldr
	yay -S curl
	yay -S zsh
	yay -S tmux
	yay -S fzf
	yay -S fd
	yay -S the_silver_searcher
	yay -S python-pip
	yay -S fuse
	yay -S spotify
	yay -S php
	pip3 install pynvim
	ln -s ${HOME}/dotfiles/kitty.conf ${HOME}/.config/kitty/kitty.conf
	ln -s ${HOME}/dotfiles/i3 ${HOME}/.config/i3/config
	ln -s ${HOME}/dotfiles/i3blocks ${HOME}/.config/i3blocks/config
	sh -c 'curl -fLo "$${XDG_DATA_HOME:-$$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	mkdir -p ${HOME}/.config/nvim/
	ln -s ${HOME}/dotfiles/init.vim ${HOME}/.config/nvim/init.vim
	ln -s ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
	ln -s ${HOME}/dotfiles/extensions.json ${HOME}/.config/coc/extensions/package.json
	mkdir -p ${HOME}/.config/coc/extensions/
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
postinstall:
	source ${HOME}/.zshrc; \
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1; \
	ln -s "$$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	rm ${HOME}/.zshrc
	ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | zsh
	source ${HOME}/.nvm/nvm.sh; \
	nvm install node
	cd ${HOME}/.config/coc/extensions/; \
	npm install
dependency:
	nvim --version
	go version
	curl --version
clean:
	rm ${HOME}/.config/kitty/kitty.conf
	rm ${HOME}/.config/i3/config
	rm -rf ${HOME}/.oh-my-zsh
	rm ${HOME}/.zshrc
	rm ${HOME}/.config/nvim/init.vim
	rm ${HOME}/.vimrc
	rm ${HOME}/.config/coc/extensions/package.json
	mkdir -p ${HOME}/.config/coc/extensions/

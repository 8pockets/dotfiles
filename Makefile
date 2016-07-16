install:
		git submodule init
		git submodule update
		ln -snf ~/dotfiles/.vimrc ~/.vimrc
		ln -snf ~/dotfiles/.zshrc ~/.zshrc
		ln -snf ~/dotfiles/.zshenv ~/.zshenv
		ln -snf ~/dotfiles/.bashrc ~/.bashrc
		ln -snf ~/dotfiles/.bash_profile ~/.bash_profile
		ln -snf ~/dotfiles/.ctags ~/.ctags
		ln -snf ~/dotfiles/.tmux.conf ~/.tmux.conf
		mkdir -p ~/.vim/
		ln -snf ~/dotfiles/.vim/ ~/.vim/
		mkdir -p ~/.vim/autoload/
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		#mkdir -p ~/.local/share/fonts
		#cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
		sudo fc-cache -fv
		ln -snf ~/dotfiles/.hyperterm.js ~/.hyperterm.js

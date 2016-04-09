install:
		git submodule init
		git submodule update
		ln -snf ~/dotfiles/.vimrc ~/.vimrc
		ln -snf ~/dotfiles/.zshrc ~/.zshrc
		ln -snf ~/dotfiles/.bashrc ~/.bashrc
		ln -snf ~/dotfiles/.bash_profile ~/.bash_profile
		ln -snf ~/dotfiles/.ctags ~/.ctags
		ln -snf ~/dotfiles/.tmux.conf ~/.tmux.conf
		ln -snf ~/dotfiles/powerline ~/powerline/
		mkdir -p ~/.vim/bundle/
		git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

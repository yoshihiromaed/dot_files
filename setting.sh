if [ ! -d ~/.vim/bundle ] ; then
	mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/logs ] ; then
	mkdir ~/logs
fi

ln -s -f ~/dot_files/.screenrc ~/.screenrc
if [ ! -d ~/.vim/bundle/neobundle.vim ] ; then
	git clone git@github.com:Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
ln -s -f ~/dot_files/.vimrc ~/.vimrc
echo "[ -f ${HOME}/dot_files/.zshrc ] && source ${HOME}/dot_files/.zshrc" > ~/.zshrc
echo "[ -f ${HOME}/dot_files/.zlogin ] && source ${HOME}/dot_files/.zlogin" > ~/.zlogin

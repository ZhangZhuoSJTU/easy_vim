# Copy .vimrc into $HOME
EasyVim="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp $EasyVim/.vimrc $HOME

# Define Vim running time
VimRunTime=$HOME/.vim

# Install Vundle if needed
BundleDir=$HOME/.vim/bundle
VundleDir=$BundleDir/Vundle.vim
if [ ! -d "$VundleDir" ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git $VundleDir
fi

# Install Plugins
vim +PluginInstall +qall

# Compile YouCompleteMe (modify arguments if needed)
# $BundleDir/YouCompleteMe/install.py --rust-completer

# Install Powerline fonts
$BundleDir/powerline-fonts/install.sh

# Make undo history directory
UndoDir=$VimRunTime/undodir
if [ ! -d "$UndoDir" ]
then
    mkdir $UndoDir
fi

# Set RustFmt
# $HOME/.cargo/bin/rustup component add rustfmt

# Set Black
# pip install black

# Set ClangFormat
# sudo apt install clang-format

# easy\_vim

`easy_vim` is derived from [sychelsea](https://github.com/sychelsea) and little inspired by [ArthurChiao](https://github.com/ArthurChiao), aiming at building a **light-weight** vim configuration. Different from other maybe-fancy ~~**but heavy**~~ ones, `easy_vim` is much easier to scale and effective enought for unix programmers.

## Quick Install
```bash
$ git clone https://github.com/ZhangZhuoSJTU/easy_vim.git
$ cd easy_vim
$ ./install.sh
```

## For Rust

`easy_vim` is equipped with `RustFmt`. De-comment all `rustfmt` related configuration in `install.sh`. Command `,r` in normal mode serves to reformat your rust code.

## For Python

`easy_vim` uses [black](https://github.com/psf/black) to format python code. If you are using Python 3.6.0+, de-comment all `black` configuration in `$HOME/.vimrc` and `pip install black`. Then command `,b` would work.

## For C/C++

`easy_vim` uses `clang-fmt` to format C and C++ code. De-comment related code in `install.sh` and `$HOME/.vimrc` to support command `,c`. 

## Cheat Sheet

+ `,l`: Open/close nerdtree

## Troubleshoot

`easy_vim` requires powerline symbols. If you did not install any fonts supporting powerline symbols on your local machine, [Cascadia Code](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode) is recommended. More choices can be found at [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).

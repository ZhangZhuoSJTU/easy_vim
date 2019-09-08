# easy\_vim

`easy_vim` is derived from [sychelsea](https://github.com/sychelsea) and little inspired by [ArthurChiao](https://github.com/ArthurChiao), aiming at building a **light-weight** vim configuration. Different from other maybe-fancy ~~**but heavy**~~ ones, `easy_vim` is much easier to scale and effective enought for unix programmers.

## Quick Install
```bash
$ git clone https://github.com/ZhangZhuoSJTU/easy_vim.git
$ cd easy_vim
$ ./install.sh
```

## For Rust

`easy_vim` is already equipped with `RustFmt`. Command `,r` in normal mode serves to reformat your rust code.

## For Python

`easy_vim` uses [black](https://github.com/psf/black) to format python code. If you are using Python 3.6.0+, de-comment all `black` configuration in `$HOME/.vimrs` and `pip install black`. Then command `,b` would work.

## Cheat Sheet

+ `,l`: Open/close nerdtree

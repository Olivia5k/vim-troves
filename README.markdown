# Vim :: Troves

![Vim :: Troves :: Screenshot](http://i.imgur.com/mX0nrmJ.png)

`vim-troves` is a plugin that enhances vim powers in Python `setup.py` files,
especially around the [Python trove classifiers][troves].

## Vim :: Troves :: Features

* Omnicompletion of troves. See the screenshot above. All the categories and
  their children are completable. The troves are fetched automatically from the
  [canonical trove URL][troves].
* Listing and browsing of all the troves via the `:Troves` command.
* Updating the existing troves via the `:Troves!` command.
* And, for silliness, double colons (` :: `) will be highlighted in `setup.py`
  files.

## Vim :: Troves :: Installation

[Vundle][vundle] style: `Bundle 'thiderman/vim-troves'` in your `.vimrc`

[pathogen][pathogen] style:

    cd ~/.vim/bundle
    git clone git://github.com/thiderman/vim-troves.git

## Vim :: Troves :: Requirements

You need `curl` installed and executable. If you don't have it, the plugin will
not load at all.

## Vim :: Troves :: FAQ

* **Q**: Do you really do this so often that you need a plugin for it?
* **A**: Probably not, but now that I've used it I've found it very useful.
  Plus, it was fun to get to know how to write completion functions for vim.

## Vim :: Troves :: License

Copyright (c) Lowe Thiderman.  Distributed under the same terms as Vim itself.
See `:help license`.

[pathogen]:     https://github.com/tpope/vim-pathogen
[vundle]:       https://github.com/gmarik/vundle
[troves]:       https://pypi.python.org/pypi?%3Aaction=list_classifiers

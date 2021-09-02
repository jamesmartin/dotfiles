# Dotfiles

## Install

`rake install`

To install vim submodules:

`git submodule init`
`git submodule update`

## Adding Vim Packages

Vim plugins are managed by the built-in Vim `packages` system (`:help
packages`).

To add a new package:

```
git submodule add https://github.com/some/vim.plugin.git \
  vim/pack/jamesmartin/start/vim.plugin
git commit -m "Add some vim plugin"
```

## Removing Vim Packages

```
git submodule deinit ./vim/pack/jamesmartin/start/vim.plugin
git rm ./vim/bundle/vim.plugin
# Note: asubmodule (no trailing slash)
# or, if you want to leave it in your working tree
git rm --cached ./vim/bundle/vim.plugin
rm -rf .git/modules/vim/bundle/vim.plugin
```

Commit your changes.

## Other Vim dependencies

- [FZF fuzzy finder](https://github.com/junegunn/fzf#installation)
- [RipGrep (rg)](https://github.com/BurntSushi/ripgrep#installation)


## Colors

[Solarized](http://ethanschoonover.com/solarized): Used for Vim and
Terminal.app. There is a [Solarized Dark.terminal profile](extras/Solarized\
Dark.terminal) that has been tweaked for Terminal.app on macOS.

## Font

[Adobe Source Code Pro](https://github.com/adobe-fonts/source-code-pro): 18pt.

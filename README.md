# Dotfiles

## Install

`rake install`

To install vim submodules:

`git submodule init`
`git submodule update`

## Adding Vim Packages

Vim plugins are managed by [pathogen](https://github.com/tpope/vim-pathogen).
To add a new plugin:

```
cd ./vim/bundle
git submodule add https://github.com/some/vim.plugin.git
git commit -m "Add some vim plugin"
```

## Removing Vim Packages

```
git submodule deinit ./vim/bundle/vim.plugin
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

[Solarized](http://ethanschoonover.com/solarized): Used for Vim and iTerm.

## Font

[Adobe Source Code Pro](https://github.com/adobe-fonts/source-code-pro): 18pt.

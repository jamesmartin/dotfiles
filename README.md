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

## Colors

[Solarized](http://ethanschoonover.com/solarized): Used for Vim and iTerm.

## Font

[Adobe Source Code Pro](https://github.com/adobe-fonts/source-code-pro): 18pt.

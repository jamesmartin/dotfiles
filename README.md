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
Terminal.app. The Terminal profile from the canonical package doesn't really work anymore but I've had good luck with a [3rd-party clone](https://github.com/lysyi3m/macos-terminal-themes/blob/8c0b2d15070e00c9d61688063145942b60621f96/themes/Solarized%20Dark.terminal).

## Font

[Adobe Source Code Pro](https://github.com/adobe-fonts/source-code-pro): 18pt (Light).

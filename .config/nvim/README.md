# nvim-setup

Most of the plugins will work on the go, but there are some problematic plugins that require additional setup that is not scriptable or storable in stow. This is a list of thos plugins and how to set them up.

## Neorg
This plugin requires luarocks and luajit.
```bash
brew install luarocks
brew install luajit
```

If it still doesn't work, try updating your gcc compiler with:
```bash
brew install gcc
```

Then, on neovim, run:
```vim
:Neorg sync-parsers
```

## Obsidian
This plugin requires [pngpaste](https://github.com/jcsalterego/pngpaste) to work.
```bash
brew install pngpaste
```

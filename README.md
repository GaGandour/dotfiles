# My dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them. This video on [YouTube](https://www.youtube.com/watch?v=y6XCebnB9gs) from _Dreams of Autonomy_ explains how to use Stow to manage dotfiles.

## Requirements

### Zsh
I use Zsh as my shell.

### Kitty
I use [Kitty](https://sw.kovidgoyal.net/kitty/) as my terminal emulator. You can install it with:
```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

### Stow
Stow can be found on [GNU Stow](https://www.gnu.org/software/stow/). Install it with:
```bash
brew install stow
```

### Neovim
I use [Neovim](https://neovim.io/) as my text editor. You can install it with:
```bash
brew install neovim
```

### Powerlevel10k
I use [Powerlevel10k](https://github.com/romkatv/powerlevel10k). You can install it with:
```bash
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc_suffix
```

### Tmux
```bash
brew install tmux
```

### JetBrains Mono Nerd Font
I use the JetBrains Mono Nerd Font with ligatures.

## Installation

```bash
git clone github@gagandour/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

Then, reference the `.zshrc_suffix` file in your `.zshrc` file:
```bash
echo "source ~/.zshrc_suffix" >> ~/.zshrc
```

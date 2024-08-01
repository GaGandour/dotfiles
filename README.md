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

### Mac Mouse Fix
[Mac Mouse Fix](https://macmousefix.com/) is an app that conceals an external mouse with the motions on the trackpad. It also defines some special movements for the mouse. For linux, this won't be necessary.

### Aerospace (Not using for now, it's buggy)
[Aerospace](https://github.com/nikitabobko/AeroSpace) is a window tiling manager for macOS. For linux, this won't work.

### Stow
Stow can be found on [GNU Stow](https://www.gnu.org/software/stow/). Install it with:
```bash
brew install stow
```

### Raycast
Raycast is an improved MacOS Spotlight.
```bash
brew install --cask raycast
```

### Neovim
I use [Neovim](https://neovim.io/) as my text editor. You can install it with:
```bash
brew install neovim
```
Remember to set the ChatGPT secret key accordingly so that the ChatGPT plugin works.

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

To make use of the tmux plugins in our setup, we'll need tpm (tmux plugin manager). We install it with `git`:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
After that, enter tmux and press `Ctrl-A` and then `Shift-I` to install the plugins.


### Terminal additional add ons
I use `zoxide` as my `cd` command.
```bash
brew install zoxide
```

I use `eza` as my `ls` command.
```bash
brew install eza
```

My telescope (neovim plugin) configuration uses ripgrep.
```bash
brew install ripgrep
```

My lazygit neovim plugin needs lazygit.
```bash
brew install lazygit
```

One of my formatters (prettier) needs `npm` to be installed.
```bash
brew install npm
```

(Optional) I also normally have `bat` installed.
```bash
brew install bat
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

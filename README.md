# .dotfiles
---
## My configuration files in bare repository.

Environment:
- gnome/bspwm
- tilix/urxvt
- bash & readline-lib
- tmux
- vim/neovim
- git
- fzf & ag
- bash-it, tldr, bat, exa, starship
- scripts

Tiling wm - bspwm includes:
- bspwm
- sxhkd
- polybar
- dmenu
- dunst
 
 To clone into new machine:
```bash 
git clone --bare https://github.com/raktom/.dotfiles.git $HOME/.dotfiles.git
function gitdf {
   /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
gitdf checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    gitdf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
gitdf checkout
gitdf config status.showUntrackedFiles no
```

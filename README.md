# .dotfiles

My configuration files in bare repository.

Environment:
- bash/readline-lib
- tmux
- vim/neovim
- git
- fzf
- scripts
 
 To clone into new machine:
 ```
git clone --separate-git-dir=~/.dotfiles.git https://github.com/raktom/.dotfiles.git ~
alias gitdf='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
gitdf config --local status.showUntrackedFiles no
gitdf checkout
 ```
 If config files are already present we can first backup them:
```
mkdir -p .dotfiles-backup && gitdf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

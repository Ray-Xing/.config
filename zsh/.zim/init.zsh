zimfw() { source /home/ray/.zim/zimfw.zsh "${@}" }
zmodule() { source /home/ray/.zim/zimfw.zsh "${@}" }
fpath=(/home/ray/.zim/modules/git/functions /home/ray/.zim/modules/duration-info/functions /home/ray/.zim/modules/git-info/functions /home/ray/.zim/modules/zsh-completions/src ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove duration-info-precmd duration-info-preexec coalesce git-action git-info
source /home/ray/.zim/modules/environment/init.zsh
source /home/ray/.zim/modules/git/init.zsh
source /home/ray/.zim/modules/input/init.zsh
source /home/ray/.zim/modules/termtitle/init.zsh
source /home/ray/.zim/modules/powerlevel10k/powerlevel10k.zsh-theme
source /home/ray/.zim/modules/duration-info/init.zsh
source /home/ray/.zim/modules/asciiship/asciiship.zsh-theme
source /home/ray/.zim/modules/completion/init.zsh
source /home/ray/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/ray/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/ray/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh

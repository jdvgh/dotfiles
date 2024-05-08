fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/romkatv/zsh-defer )
source /home/jonase/.config/zsh/.antidote/.plugins/romkatv/zsh-defer/zsh-defer.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/gitfast )
source /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/gitfast/gitfast.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/gcloud )
source /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/gcloud/gcloud.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/colored-man-pages )
source /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/command-not-found )
source /home/jonase/.config/zsh/.antidote/.plugins/ohmyzsh/ohmyzsh/plugins/command-not-found/command-not-found.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/jeffreytse/zsh-vi-mode )
source /home/jonase/.config/zsh/.antidote/.plugins/jeffreytse/zsh-vi-mode/zsh-vi-mode.plugin.zsh
if ! (( $+functions[zsh-defer] )); then
  fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/romkatv/zsh-defer )
  source /home/jonase/.config/zsh/.antidote/.plugins/romkatv/zsh-defer/zsh-defer.plugin.zsh
fi
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/Tarrasch/zsh-bd )
zsh-defer source /home/jonase/.config/zsh/.antidote/.plugins/Tarrasch/zsh-bd/bd.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/z-shell/zsh-navigation-tools )
source /home/jonase/.config/zsh/.antidote/.plugins/z-shell/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/romkatv/powerlevel10k )
source /home/jonase/.config/zsh/.antidote/.plugins/romkatv/powerlevel10k/powerlevel10k.zsh-theme
source /home/jonase/.config/zsh/.antidote/.plugins/romkatv/powerlevel10k/powerlevel9k.zsh-theme
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-completions )
source /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-completions/zsh-completions.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/sorin-ionescu/prezto/modules/completion )
source /home/jonase/.config/zsh/.antidote/.plugins/sorin-ionescu/prezto/modules/completion/init.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-autosuggestions )
zsh-defer source /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-syntax-highlighting )
zsh-defer source /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fpath+=( /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-history-substring-search )
zsh-defer source /home/jonase/.config/zsh/.antidote/.plugins/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

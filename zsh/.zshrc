# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit && compinit

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
# bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

#zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
#for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey -M vicmd ${key} history-search-backward
#for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey -M vicmd ${key} history-search-forward
for key ('k') bindkey -M vicmd ${key} history-search-backward
for key ('j') bindkey -M vicmd ${key} history-search-forward
#unset key
# }}} End configuration added by Zim install

# Created by newuser for 5.9

# vi mode
bindkey -v

## WSL2 proxy by clash for windows
#export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
##export all_proxy="http://${hostip}:7890"
#export https_proxy="http://${hostip}:7890"
#export http_proxy="http://${hostip}:7890"
#export socks5_proxy="socks5://${hostip}:7890"

# WSL2 browser
export BROWSER='/usr/bin/msedge'
# export BROWSER='chromium'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Folders
alias L='cd /mnt/c/Users/ray/Desktop/working/WSL_of_Surface'
alias W='cd /mnt/c/Users/ray/OneDrive/Working'
alias T='cd /mnt/c/Users/ray/OneDrive/Temp'
alias D='cd /mnt/c/Users/ray/Desktop'
alias onedrive='cd /mnt/c/Users/ray/OneDrive'
alias J='cd /mnt/c/Users/ray/OneDrive/julia'
alias fld='explorer.exe .'
alias ra='yazi'

# Ucseful shortcuts
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias ls='ls -atr --color=auto'
alias ll='ls -altr --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# list
alias ls='ls -atr --color=auto'
alias ll='ls -atrl --color=auto'

export PATH="$HOME/.local:$PATH"

export QT_QPA_PLATFORM=xcb

# Clash Verge Proxy Control
proxy_on() {
    export http_proxy="http://127.0.0.1:7897"
    export https_proxy="http://127.0.0.1:7897"
    export HTTP_PROXY="http://127.0.0.1:7897"
    export HTTPS_PROXY="http://127.0.0.1:7897"
    export ALL_PROXY="socks5://127.0.0.1:7897"
    echo "Proxy is ON (Clash Verge)"
}

proxy_off() {
    unset http_proxy
    unset https_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ALL_PROXY
    echo "Proxy is OFF"
}

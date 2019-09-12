
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


# Basic zsh config.
ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
BROWSER="chromium"
setopt NO_HUP
#setopt IGNORE_EOF
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB
setopt extended_glob

# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'


# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Completion.
autoload -Uz compinit
compinit
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'


# If running as root and nice >0, renice to 0.
if [ "$USER" = 'root' ] && [ "$(cut -d ' ' -f 19 /proc/$$/stat)" -gt 0 ]; then
renice -n 0 -p "$$" && echo "# Adjusted nice level for current shell to 0."
fi

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Nobody need flow control anymore. Troublesome feature.
stty -ixon
setopt noflowcontrol

# For autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

if command -v colordiff > /dev/null 2>&1; then
alias diff="colordiff -Nuar"
alias youtube-dl="noglob youtube-dl"
else
alias diff="diff -Nuar"
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'


### FUNCTIONS

# Easy extract
extract () {
  if [ -f $1 ] ; then
      case $1 in
            *.tar.bz2)      tar xvjf $1   ;;
            *.tar.gz)       tar xvzf $1   ;;
        *.tar.xz)       tar xvJf $1   ;;
            *.bz2)          bunzip2 $1    ;;
            *.rar)          unrar x $1    ;;
            *.gz)           gunzip $1     ;;
            *.tar)          tar xvf $1    ;;
            *.tbz2)         tar xvjf $1   ;;
            *.tgz)          tar xvzf $1   ;;
        *.txz)          tar xvJf $1   ;;
            *.rar)          unrar $1      ;;
            *.zip)          unzip $1      ;;
            *.Z)            uncompress $1 ;;
            *.7z)           7z x $1       ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }


## Aliases

alias ls='ls --color=auto' # color is useful.
alias cp='cp -R -i -v'
alias mv='mv -i -v'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -h -s'
alias reload='source ~/.zshrc'
alias rmd='"rm" -rf'
alias trashman='"rm" -rf ~/.local/share/Trash/files/*'
alias zshrc="$EDITOR ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias vimrc="$EDITOR ~/.vimrc"
alias mountiso="sudo mount -t iso9660 -o loop"
alias mine="sudo chown -R beerbin:users"
## changing dirs with just dots.
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias rsyncbackup='rsync -r -t -p -x -v --progress --ignore-existing --size-only -u -l -s'
alias rsyncquick='rsync -r -t --progress --delete -s --size-only'

alias ping='ping -c 3'
alias grep="egrep --color=auto"  # color grep output

## Package Manager - Uncomment for your distro
alias aurpkg='sudo pacman -U'
alias pi='sudo pacman -S'
alias pr='sudo pacman -R'
alias system_update='sudo pacman -Syu'
alias aurfind='yaourt -Ss'
alias pfind='sudo pacman -Ss'
alias pinfo='sudo pacman -Si'
alias installedby='sudo pacman -Ql'
alias whatfrom='sudo pacman -Qo'
alias showorphan='sudo pacman -Qdt'
alias removeuseless='sudo pacman -Rsnc $(pacman -Qdqt)'
alias giveswhat='sudo pkgfile --list'
## Misc
alias edit='nvim'

# key binding
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
#bindkey "\e[7~" beginning-of-line # Home
#bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line
# History
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


# Sets term colors
(cat ~/.cache/wal/sequences &)

#------------------------------------------////
# System Information:
#------------------------------------------////
clear
echo -ne "${blue}Today is:\t\t${darkgray}" `date`; echo ""
echo -e "${blue}Kernel Information: \t${darkgray}" `uname -smr`
echo -ne "${purple}";upinfo;echo ""
echo -e "${blue}"; cal -3

stty -ixon

alias tvirt='source ~/virtualenv/trader/bin/activate && cd ~/PycharmProjects/trader'
alias oldvim='/usr/bin/vim'
alias vim='nvim'
alias 7zall="ls *.7z | parallel -j+0 --eta '7z x {} >/dev/null'"
alias unzipall="ls *.zip | parallel -j+0 --eta 'zip x {} >/dev/null'"
alias sudo=' sudo '
alias trc='tremc'
alias dd='dd status=progress bs=4M '
alias mirrorupdate="sudo pacman-mirrors --geoip && sudo pacman -Syyu"
alias nmap-qsp='sudo nmap -sV -T4 -O -F --version-light'
alias gpm='tuijam'
eval $(thefuck --alias)
alias rarch='strat -r arch'
alias fbr='filebot -rename . --format "{n} - {s00e00} - {t}"'
alias fbrt='filebot -rename . --action test --format "{n} - {s00e00} - {t}"'
alias fbrm="filebot -rename . --format \"{n.colon(' - ')} ({y}){' CD'+pi}{subt}\""
alias fbrmt="filebot -rename . --action test --format \"{n.colon(' - ')} ({y}){' CD'+pi}{subt}\""
#alias scrot='grim "$(date +"%Y_%m_%d_%H%M").png"'
#alias sway='dbus-launch --sh-syntax --exit-with-session /usr/bin/sway'
#alias xclip='wl-copy -p'
alias archupdate='strat -r arch aurman -Syu --aur --devel'
alias beerbinConnect='ssh tsstt.ignorelist.com'
alias externalip='ipinfo.io/ip'
alias yaourt='aurman'


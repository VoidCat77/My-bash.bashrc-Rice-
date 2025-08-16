# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

# Default command line prompt.
PROMPT_DIRTRIM=2

# Test if PS1 is set to the upstream default value, and if so overwrite it with our 7default.
# This allows users to override $PS1 by passing it to the invocation of bash as an environment variable
[[ "$PS1" == '\s-\v\$ ' ]] && PS1='\[\e[1;33m\] \w \[\e[96m\]󰔛 \@ \[\e[91m\]Debian \[\e[32m\] $LAST_COMMAND_DURATION‮s
\[\e[0;40m\e[37m\]`whoami`\[\e[47m\e[30m\]\[\e[47m\e[31m\]@\e[0;37m\]\[\e[0m\] '

# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

[ -r /data/data/com.termux/files/usr/share/bash-completion/bash_completion ] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion


# Things that should run first
tere() {
    local result=$(command tere "$@")
    [ -n "$result" ] && cd -- "$result"
}

# Pop
export PATH="$HOME/go/bin:$PATH"
export RESEND_API_KEY=re_XkKsUEj7_GpEuzZ1c1of3K6GPRGeHVq6B
export POP_FROM=voidcatsvnsvn@gmail.com

export POP_SMTP_HOST=smtp.gmail.com 
export POP_SMTP_PORT=587 
export POP_SMTP_USERNAME=voidcatsvnsvn@gmail.com
export POP_SMTP_PASSWORD='slau jvab gomt hanx'

# Bat
BAT_THEME="Catppuccin Mocha"

# Custom Gum Aliases
alias microselect='micro < $(gum file -c  --directory.foreground="4" --selected.foreground="3" --cursor.foreground="3")'
alias pager='gum pager <'
alias pagerselect='gum pager < $(gum file -c  --directory.foreground="4" --selected.foreground="3" --cursor.foreground="3")'
alias write='gum write >'
alias launchmissle='gum input --cursor.foreground="9" --prompt.foreground="9" --placeholder "Where to Launch?" && gum confirm "Are you sure to launch the missle?" --prompt.foreground="9" --selected.background="9" && echo -e "\e[1;31mMissle Launch requires Root Password!" && gum input --cursor.foreground="9" --prompt.foreground="9" --password --placeholder "Enter Root Password..." && clear && gum spin --spinner.foreground="" --spinner minidot --title.background="1" --title "Launching missile..." -- sleep 10 && echo Missle Launched! | boxes -d critical || echo "Aborted."'
alias catselect='cat < $(gum file -c  --directory.foreground="4" --selected.foreground="3" --cursor.foreground="3")'
alias sudo='gum input --password --placeholder "Enter Root Password..." | echo Sudo requires Root Password...
echo sudo aint supported on this device, sorry!!!
echo try running your command without sudo, ok?
echo your command was'
alias selecter='gum file -c  --directory.foreground="4" --selected.foreground="3" --cursor.foreground="3"'

# Custom Aliases
alias dir='clifm --ls --no-clear-screen'
alias ls='lsd --group-dirs first'
alias cls=clear
alias ncdemo=notcurses-demo
alias nank=nano
alias froot=fakeroot
alias x11='am start -n com.termux.x11/com.termux.x11.MainActivity;termux-x11 :0 -xstartup '
alias loginreset='clear;login'
alias tree='lsd --tree'
alias win='am start -n com.visnalize.win7simu/com.visnalize.win7simu.MainActivity'
alias editbashrc='nano $PREFIX/etc/bash.bashrc'
alias pipes=pipes.sh
alias tstimg='cd ~/storage/shared/Test\ Images/'
alias ncdu='/data/data/com.termux/files/usr/bin/ncdu --color dark --confirm-quit'
alias neofetchmini=' neofetch --ascii_distro Debian_small'
alias cat=bat
alias cats='bat --style header'
alias die='echo yup. not dir, DIE!'
alias cmatrix='/data/data/com.termux/files/usr/bin/cmatrix -abu 1'
alias cbonsai="/data/data/com.termux/files/usr/bin/cbonsai -lim ' Be Happy'"
alias toast='termux-toast'
alias rubix=rubiks_cube
alias gpt='tgpt -m'
alias peaclock='/data/data/com.termux/files/usr/bin/peaclock --config-dir ~/root/peaclock'
alias talkomatic='python ~/Talkomatic-CLI-Edition/app.py --username 𝕍𝕠𝕚𝕕ℂ𝕒𝕥𝟟𝟟 --location MeoшHQ'

moire()
{ jp2a --chars="_-_" "$*"
}

eztoilet()
{ /data/data/com.termux/files/usr/bin/toilet -t "$*" | lolcat
}

video()
{ mpv "$*" | timg -V "$*"
} # This command is currently useless but i wont fix it until i find a solution to this

# Easy Colors
# - To make an echo have color, type "cecho hey ${colors below list}there"
nocolor='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
lightgray='\033[0;37m'
darkgray='\033[1;30m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
yellow='\033[1;33m'
lightblue='\033[1;34m'
lightpurple='\033[1;35m'
lightcyan='\033[1;36m'
white='\033[1;37m'

rainbow() { local text="$*"; local colors=($red $orange $yellow $green $cyan $blue $purple); local i=0; for ((c=0; c<${#text}; c++)); do printf "${colors[i]}%s" "${text:c:1}"; ((i=(i+1)%${#colors[@]})); done; printf "${nocolor}\n"; }

alias cecho='echo -e '

# Time execution for commands
PROMPT_COMMAND='lastcmd=$?; timer=${timer:-$SECONDS}; export LAST_COMMAND_DURATION=$((SECONDS - timer)); timer=$SECONDS'

# Commands to run automatically
if [ -z "$ZELLIJ" ] && [ -z "$TMUX" ]; then 
    exec zellij
fi # i got this from chatgpt lmao

if [ -z "$__VOID_ONCE_FLAG" ];
then
export __VOID_ONCE_FLAG=1
#gum spin --spinner.foreground="010" --spinner minidot --title "Starting all Necessary Components..." -- sleep 1
#gum spin --spinner.foreground="010" --spinner minidot --title "Loading Textures..." -- sleep 1.2
#gum spin --spinner.foreground="010" --spinner minidot --title "Checking bash.bashrc..." -- sleep 1.3
#gum spin --spinner.foreground="010" --spinner minidot --title "Loading startupanimation..." -- sleep 0.7
#gum spin --spinner.foreground="010" --spinner minidot --title "Initializing Prompt..." -- sleep 0.8
#gum spin --spinner.foreground="010" --spinner minidot --title "Finalizing Setup..." -- sleep 2
echo 'Welcome to Termux!
Please log in to continue...
'
user=$(gum input --cursor.foreground="010" --placeholder "Enter Username...")
pass=$(gum input --cursor.foreground="010" --password --placeholder "Enter Password...")
clear
gum spin  --spinner.foreground="010" --spinner minidot --title "Checking Login..." -- sleep 2
echo "u0_a325 logged in at $(date) with username as $user and password as $pass
" >> ~/login.logs
clear
figlet -f slant 'Welcome!' | boxes -d ansi-rounded | tte wipe
echo -e "\e[0;36m⚡=================================⚡\033[0m
  \e[1;36m\e[0m  Bash Version: \e[1;33m$BASH_VERSION"
echo -e  "  \e[1;31m\e[0m Termux Version: \e[1;33m$(dpkg -s termux-tools | grep '^Version:' | cut -d' ' -f2 | sed 's/+really.*//')"
echo -e "  \e[1;33m󰆧\e[0m Installed Packages: \e[1;33m$(dpkg -l | grep '^ii' | wc -l)"
echo -e '  \e[38;2;173;255;47mALL PROCESSES ARE ONLINE'
echo -e '\e[0;36m⚡=================================⚡\e[0m'
fi

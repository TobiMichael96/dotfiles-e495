#
# ~/.bashrc
#

cd ~/

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval "$(<~/.ssh-agent-thing)" >/dev/null
	ssh-add ~/.ssh/raspi &>/dev/null
	ssh-add ~/.ssh/gitlab &>/dev/null
	ssh-add ~/.ssh/github &>/dev/null
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias px='ps ax | grep '
alias cdc='cd $HOME/.config'
alias screenshot='sh ~/dotfiles/scripts/screenshot-tool.sh s'
alias ls='ls --color=auto'
alias httpd='hostname -i && python3 -m http.server 8001'
alias note='sh ~/dotfiles/scripts/notes.sh'
alias pacman-clean='sudo pacman -Sc && sudo pacman -Rns $(pacman -Qtdq) && sudo pacman -Sc'
alias ace='acestream-launcher -p vlc'
alias dotfiles='sh ~/dotfiles/dotfiles.sh'

alias homeserver='mosh 192.168.2.4'
alias homenet='sh ~/dotfiles/scripts/wireguard.sh'

alias raspi='ssh 192.168.2.77'

alias stickm='sh ~/dotfiles/scripts/stickm.sh'
alias stickum='sh ~/dotfiles/scripts/stickum.sh'

PS1='[\u@\h \W]\$ '

(cat ~/.cache/wal/sequences &)

# extract archives
e() {
 if [ -f $1 ] ; then
  case $1 in
   *.tar.bz2)   tar xjvf $1 ;;
   *.tar.gz)    tar xzvf $1 ;;
   *.tar.xz)    tar xJvf $1 ;;
   *.bz2)       bunzip2 $1 ;;
   *.rar)       unrar xv $1 ;;
   *.gz)        gunzip $1 ;;
   *.tar)       tar xvf $1 ;;
   *.tbz2)      tar xjvf $1 ;;
   *.tgz)       tar xzvf $1 ;;
   *.zip)       unzip $1 ;;
   *.7z)        7z $1 ;;
   *.xz)        xz -vd $1 ;;
   *)           echo "'$1' cannot be extracted via extract()" ;;
  esac
 else
  echo "'$1' is not a valid file"
 fi
}

# create folder and cd into
mkd() { mkdir -p "$@" && cd "$@"; }


mullvad() {
old_service=$(systemctl | grep wg-quick@mullvad | awk '{print $1}')
sudo systemctl stop $old_service
new_service=wg-quick@mullvad-$1.service
sudo systemctl start $new_service
}

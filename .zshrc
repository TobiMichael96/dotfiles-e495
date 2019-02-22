#
# ~/.bashrc
#

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval "$(<~/.ssh-agent-thing)" >/dev/null
	ssh-add ~/.ssh/raspi &>/dev/null
	ssh-add ~/.ssh/gitlab &>/dev/null
	ssh-add ~/.ssh/github &>/dev/null
fi

autoload -Uz compinit promptinit
compinit
promptinit

alias px='ps ax | grep '
alias cdc='cd $HOME/.config'
alias screenshot='sh ~/dotfiles/scripts/screenshot-tool.sh s'
alias ls='ls --color=auto'
alias httpd='hostname -i && python3 -m http.server 8001'
alias note='sh ~/dotfiles/scripts/notes.sh'
alias pacman-clean='sudo pacman -Rns $(pacman -Qtdq)'
alias ace='acestream-launcher -p vlc'
alias dotfiles='sh ~/dotfiles/dotfiles.sh'

alias homeserver='ssh 192.168.2.4'
alias homenet='sh ~/dotfiles/scripts/wireguard.sh'

alias stickm='sh ~/dotfiles/scripts/mount-stick.sh'
alias stickum='sh ~/dotfiles/scripts/umount-stick.sh'

(cat ~/.cache/wal/sequences &)

powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

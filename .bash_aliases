# aliases

alias px='ps ax | grep '
alias cdc='cd $HOME/.config'
alias screenshot='sh ~/dotfiles/scripts/screenshot-tool.sh s'
alias pic-uploader='sh ~/dotfiles/scripts/pic-uploader.sh'
alias ls='ls --color=auto'
alias httpd='hostname -i && python3 -m http.server 8001'
alias note='sh ~/dotfiles/scripts/notes.sh'
alias pacman-clean='sudo pacman -Sc && sudo pacman -Rns $(pacman -Qtdq) && sudo pacman -Sc'
alias ace='acestream-launcher -p vlc'
alias dotfiles='sh ~/dotfiles/dotfiles.sh'

alias list_wifi='sh ~/dotfiles/scripts/get_wifis.sh'

alias homeserver='mosh 192.168.2.4'
alias homenet='sh ~/dotfiles/scripts/wireguard.sh'

alias mullvad='sh ~/dotfiles/scripts/mullvad.sh $1'

alias network_scan='python ~/dotfiles/scripts/network_scan.py $1'

alias raspim='ssh 192.168.2.77'
alias raspiled='ssh 192.168.2.50'
alias raspitemp='ssh 192.168.2.55'

alias stickm='sh ~/dotfiles/scripts/stickm.sh'
alias stickum='sh ~/dotfiles/scripts/stickum.sh'

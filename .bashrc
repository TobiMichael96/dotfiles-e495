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

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi



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

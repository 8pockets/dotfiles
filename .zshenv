# $LS_COLORS
if [ "$LS_COLORS" -a -f /etc/DIR_COLORS ]; then
  eval $(dircolors /etc/DIR_COLORS)
fi

# go
export PATH=$PATH:/usr/local/bin/go
export GOPATH=$HOME/go
export GO15VENDOREXPERIMENT=1
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

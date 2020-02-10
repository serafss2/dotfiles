ZSH_THEME="evan"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias ll="ls -l"

declare -a work_profiles=(
    ".gcpprofile"
    ".azureprofile"
    ".edoxaprofile"
    ".bellprofile"
)

for profile in "${work_profiles[@]}"
do
    if [ -f $HOME/$profile ]; then
        source $profile
    fi
done

# Python stuff
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
alias python=python3
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Source vte.sh when using Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

if [ uname = "Linux" ] && systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi

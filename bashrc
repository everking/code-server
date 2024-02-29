# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "$(dircolors)"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

if [ -z "${HOST_USER}" ]
then
    HOST_USER="root"
fi
if [ -z "${HOST_PORT}" ]
then
    HOST_PORT="22"
fi

alias login-host="ssh -o StrictHostKeyChecking=accept-new ${HOST_USER}@host.docker.internal -p ${HOST_PORT}"
if [ -z "${WIN_USER}" ]
then
    echo "WIN_USER variable not set."
else
    # When SSH enabled at the Windows level. User Windows user.
    alias powershell="ssh -o StrictHostKeyChecking=accept-new ${WIN_USER}@host.docker.internal -p 22"
fi
echo
echo "Welcome to Eric's Code Server!"
echo "Type 'login-host' if you want to access the WSL host (to run docker commands, etc.)."
echo "Type 'powershell' if you want to access the Windows host (run other commands)."
echo

#!/usr/local/bin/bash

# version 2005.07.01

# .bashrc -- initialization for each bash shell invoked.
# nothing here should output anything to the screen.
# if it does, things like sftp (secure ftp) will fail with some weird errors

# this is a pretty bare-bones .bashrc.  We don't really support bash;
# we mainly want to make sure the shell is halfway functional.  You can
# make it spiffy and pretty. :-)  If you have suggestions for some fundamental
# settings here, mail support@engr.orst.edu.   thx


############################################################
# First we set a pretty basic path that should work on all
# OS's.  We will be pre and post-pending to it below, with
# OS-specific paths.
############################################################
export PATH=~/bin:/bin:/sbin:/usr/local/bin:/usr/bin:/usr/local/apps/bin:/usr/bin/
PATH=/usr/local/common/vim-7.4/bin:$PATH
export MANPATH=/usr/local/man:/usr/man
export LESS="QMcde"
export MORE="-c"
export PAGER=less
umask 007

############################################################
# here we figure out which OS we're running on and make
# appropriate settings.  Our goal here is to keep the
# environment consistent.
# no real reason to export TEMP_OS; only used briefly
############################################################
TEMP_OS=`/bin/uname`
if [ "$TEMP_OS" == "Linux" ]; then
    export MANPATH=$MANPATH:/usr/share/man
fi
if [ "$TEMP_OS" == "SunOS" ]; then
    export PATH=/usr/ccs/bin:$PATH:/opt/SUNWspro/bin:/usr/sfw/bin:/usr/ucb:/usr/local/X11R6/bin
    export MANPATH=$MANPATH:/usr/dt/man:/opt/SUNWspro/man:/usr/sfw/man:/usr/local/X11R6/man
fi
if [ "$TEMP_OS" == "HP-UX" ]; then
    export PATH=/usr/ccs/bin:$PATH:/opt/fortran90/bin:/usr/local/X11R6/bin
    export MANPATH=$MANPATH:/usr/dt/man:/opt/ansic/share/man:/opt/fortran90/share/man:/usr/local/X11R6/man
    alias who='/bin/who -R'
    alias df='/bin/bdf'
fi

############################################################
# Now we add a personal bin directory and '.', which is the
# current directory.  This would be a good place to add
# any other special directories to your path or MANPATH
############################################################
export PATH=$PATH:~/bin:.
#export MANPATH=$MANPATH:
PS1="\n\[\033[0;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;31m\]\u'; fi)\[\033[1;37m\])\342\224\200(\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias z="suspend"
alias la="ls -aF"
alias lf="ls -F"
alias lfa="ls -AF"
alias ll="ls -gl"
alias lla="ls -agl"
alias chpro="ps aux | grep $LOGNAME | grep -v root"
alias chshm="ls -la  /dev/shm/ | grep burgebra"
alias te="tar zxvf"
alias tc="tar zcvf"
alias untar="tar xjvf"
alias llg="ls -lAG"
alias fbterm="fbterm -- bash -c 'TERM=fbterm tmux'"
alias capswap="sudo loadkeys /usr/share/keymaps/capswap.map"

# added by Anaconda 2.3.0 installer
export PATH="$PATH:/home/bburgess/anaconda/bin:/usr/games"

http_proxy='http://proxyb.micron.com:8080/'
https_proxy='https://proxyb.micron.com:8080/'
export http_proxy
export https_proxy

GCC_INCLUDE_DIR=/usr/include/
export GCC_INCLUDE_DIR
fortune | cowsay

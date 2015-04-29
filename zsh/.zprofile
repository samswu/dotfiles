#!/usr/bin/zsh

# For login shells. Sourced before zshrc.

export TERM=xterm-256color
export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\""
export AWT_TOOLKIT=MToolkit  # bugfix for dwm and AWT/Swing
# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

if [[ `uname -s` == 'Darwin' ]]; then
    export GOPATH=/data/go GOARCH=amd64 GOOS=darwin
else
    export GOPATH=/data/go GOARCH=amd64 GOOS=linux
fi

for dir in \
    /sbin \
    /usr/local/sbin \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/lib/node_modules/coffee-script/bin \
    /Library/PostgreSQL/9.4/bin \
    /Library/Frameworks/Python.framework/Versions/3.4/bin \
    $HOME/.cabal/bin \
    /data/languages/go/bin \
    /data/go/bin \
    $HOME/local/*/bin \
    $HOME/bin
do
    [[ -d $dir ]] && path=($dir $path)
done

for dir in \
    /usr/local/opt/coreutils/libexec/gnuman
do
    [[ -d $dir ]] && manpath=($dir $manpath)
done
#!/usr/bin/env bash
if [ -a ${HOME}/.emacs ]; then
	mv ${HOME}/.emacs ${HOME}/_emacs
	mv ${HOME}/.emacs.d ${HOME}/_emacs.d
fi

cp _emacs ${HOME}/.emacs
cp -r _emacs.d ${HOME}/.emacs.d

## install external tools
function gentoo_install() {
    echo "Need the password for super user:"
    sudo USE="emacs" emerge cscope git
    sudo emerge w3m
}

gentoo_install

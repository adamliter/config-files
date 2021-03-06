#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
# -----------------------------------------------------------------------
# Exiting and debugging
# -----------------------------------------------------------------------
### Exit when a command fails
set -o errexit
### Exit when a command in a series of pipes fails
set -o pipefail
### Exit when there is an undeclared variable
set -o nounset
### Trace what gets executed (for debugging)
#set -o xtrace

# -----------------------------------------------------------------------
# Define a list of the files to be looped over
# -----------------------------------------------------------------------
FILES="bash_aliases \
bash_completion \
bash_profile \
bash_prompt \
bashrc \
.emacs.d \
gitconfig \
gitignore_global \
profile \
tmux.conf \
zlogin \
zshrc \
KeyBindings/DefaultKeyBinding.dict \
MailMate/Security.plist \
MailMate/Layouts/verticalThreadCorr.plist \
MailMate/Layouts/verticalThreadTag.plist \
MailMate/Layouts/widescreenThreadCorr.plist \
MailMate/Layouts/widescreenThreadTag.plist \
OpenPGP/gpg.conf \
ssh"

# -----------------------------------------------------------------------
# Create directory for MailMate layouts
# -----------------------------------------------------------------------
echo "Creating directory for MailMate layouts"
mkdir -p "${HOME}/Library/Application Support/MailMate/Resources/\
Layouts/Mailboxes"

# -----------------------------------------------------------------------
# Create directory for keybindings
# -----------------------------------------------------------------------
echo "Creating directory for key bindings"
mkdir -p "${HOME}/Library/KeyBindings"

# -----------------------------------------------------------------------
# Symlink all of the files
# -----------------------------------------------------------------------
echo "Symlinking configuration files and dotfiles based on the OS..."
for i in $FILES; do
    if [[ "${i}" == ".emacs.d" ]] ; then
	## Put Emacs directory in the right place
	ln -sf "${HOME}/config-files/${i}" "${HOME}"
    elif [[ "${i}" == "ssh" ]]; then
	ln -sf "${HOME}/config-files/${i}" "${HOME}/.${i}"
    elif [[ "${i}" == "OpenPGP/gpg.conf" ]] ; then
	## Put gpg.conf in the right place
	ln -sf "${HOME}/config-files/${i}" "${HOME}/.gnupg"
    elif [[ "${i}" == "MailMate/Security.plist" ]] ; then
	## Put security config for MailMate in the right place
	ln -sf "${HOME}/config-files/${i}" \
	   "${HOME}/Library/Application Support/MailMate"
    elif echo "${i}" | grep -q "MailMate/Layouts/" ; then
	## Put Layout stuff in the right place
	ln -sf "${HOME}/config-files/${i}" \
	   "${HOME}/Library/Application Support/MailMate/Resources/Layouts/Mailboxes"
    elif [[ "${i}" == "KeyBindings/DefaultKeyBinding.dict" ]] ; then
	ln -sf "${HOME}/config-files/${i}" \
	   "${HOME}/Library/KeyBindings"
    else
	## All other dotfiles
	ln -sf "${HOME}/config-files/dotfiles/${i}" "${HOME}/.${i}"
    fi
done

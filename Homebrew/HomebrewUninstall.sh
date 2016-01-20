#!/usr/bin/env bash
# -*- mode: sh; fill-column: 72 -*-
#
#
########################################################################
## This is a bash script for uninstalling Homebrew|Linuxbrew.         ##
##                                                                    ##
##                                                                    ##
## (c) Adam Liter 2015 under Creative Commons                         ##
## Attribution-NonCommercial-ShareAlike 4.0 International License     ##
########################################################################
#
#


########################################################################
## This file is not intended for direct execution                     ##
########################################################################
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    echo "This file is not intended for direct execution..."
    echo "Exiting..."
    exit
fi

########################################################################
## Uninstall Homebrew|Linuxbrew                                       ##
########################################################################
if type brew >/dev/null 2>&1; then
    if [ "${BASH_OS_TYPE}" = "MacOSX" ]; then
	echo "Uninstalling Homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    elif [ "${BASH_OS_TYPE}" = "Linux" ]; then
	echo "Uninstalling Linuxbrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall)"
    fi
else
    if [ "${BASH_OS_TYPE}" = "MacOSX" ]; then
	echo "Homebrew is not installed..."
    elif [ "${BASH_OS_TYPE}" = "Linux" ]; then
	echo "Linuxbrew is not installed..."
    fi
fi
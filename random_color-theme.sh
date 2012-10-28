#!/bin/sh

##########################################################################
#
# random apply color-theme from ./color-theme-*/*.sh
#
COLOR_THEME=`ls ./color-theme-*/*.sh|sort -R | head -n1`
echo $COLOR_THEME
source ${COLOR_THEME}


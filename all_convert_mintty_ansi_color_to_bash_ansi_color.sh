#!/bin/sh

##########################################################################
#
# random apply color-theme from ./color-theme-*/*.sh
#
for RC in `ls ./color-theme-*/*.minttyrc` ;
do
    echo $RC
    OUT=${RC%.minttyrc}
    sh convert_mintty_ansi_color_to_bash_ansi_color.sh $RC > $OUT.sh
done


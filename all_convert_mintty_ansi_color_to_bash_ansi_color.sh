#!/bin/sh

##########################################################################
#
# convert all mintty ANSI Color settings to bash ANSI Color code
#
for RC in `ls ./color-theme-*/*.minttyrc` ;
do
    echo $RC
    OUT=${RC%.minttyrc}.sh
    if [ -e $OUT ]; then
	sh convert_mintty_ansi_color_to_bash_ansi_color.sh $RC #> $OUT
    else
    	echo "${OUT} is aleady exist."
    fi
done


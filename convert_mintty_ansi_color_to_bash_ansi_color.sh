#!/bin/sh

##########################################################################
#
# convert mintty ANSI Color settings to bash ANSI Color code
#

COLOR_ESC="4;"
declare -A BASH_CODE=([Black]="${COLOR_ESC}0" [Red]="${COLOR_ESC}1" [Green]="${COLOR_ESC}2" [Yellow]="${COLOR_ESC}3" [Blue]="${COLOR_ESC}4" [Magenta]="${COLOR_ESC}5" [Cyan]="${COLOR_ESC}6" [White]="${COLOR_ESC}7" [BoldBlack]="${COLOR_ESC}8" [BoldRed]="${COLOR_ESC}9" [BoldGreen]="${COLOR_ESC}10" [BoldYellow]="${COLOR_ESC}11" [BoldBlue]="${COLOR_ESC}12" [BoldMagenta]="${COLOR_ESC}13" [BoldCyan]="${COLOR_ESC}14" [BoldWhite]="${COLOR_ESC}15" [ForegroundColour]="10" [BackgroundColour]="11" [CursorColour]="12")

while read LINE ;
do
    if echo $LINE | grep -e "^[^# ]" 2>&1 > /dev/null ;then
	COLOR_SET=( `echo $LINE | tr -d ' '|tr "=" " "`)

	COLOR_NAME=${COLOR_SET[0]}
	COLOR_HEX=${COLOR_SET[1]}
	
	echo "echo -ne '\e]${BASH_CODE[$COLOR_NAME]};$COLOR_HEX\a'"
    else
       	echo $LINE
    fi
done<$1

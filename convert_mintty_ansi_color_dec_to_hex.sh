#!/bin/sh

##########################################################################
#
# convert mintty ANSI Color decimal to hexical
#

while read LINE ;
do
    if echo $LINE | grep -e "^[^# ]" 2>&1 > /dev/null ;then
	if echo $LINE | grep -e "#" 2>&1 > /dev/null ;then
	    COMMENT="#${LINE#*#}"
	fi
	SETTING=${LINE%%#*}

	COLOR_SET=( `echo $SETTING| tr -d ' '|tr "=" " "`)
	COLOR_NAME=${COLOR_SET[0]}
	COLOR_DEC=${COLOR_SET[1]}
	COLORS=(`echo $COLOR_DEC | tr "," " "`)
	HEX_COLOR=`printf "#%02X%02X%02X" ${COLORS[0]} ${COLORS[1]} ${COLORS[2]}`
	echo "$COLOR_NAME=$HEX_COLOR $COMMENT"
	COMMENT=""
    else
      	echo $LINE
    fi
done<$1

#!/bin/bash
SEDINPUT='s'$1
OFILENAME=$2
FORCE=$3
#ls $OFILENAME
#echo $FORCE
#CURRENTPATH=$(pwd)
NEWPATH=$(echo $(dirname $OFILENAME) | awk '{print $1}')
echo $NEWPATH
#ls $NEWPATH
cd $NEWPATH
pwd
#for i in $(ls $OFILENAME); do
#	echo $i
#done
for i in $(ls $OFILENAME); do
	b=`basename "$i"`;
	newfilename=$(echo $b | sed $SEDINPUT)
	if [ "$FORCE" == "[-f]" ]; then
		echo $b $newfilename | awk '{printf "mv -f %s %s\n",$1,$2}' |sh
	else
		echo $b $newfilename | awk '{printf "mv -i %s %s\n",$1,$2}' |sh
	fi
done

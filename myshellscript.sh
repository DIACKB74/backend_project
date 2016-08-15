#!/bin/bash
HW=$(date +%d-%m_%T)

usage() {
	echo """
	commands
	backup : make a backup of files in database, queue and webserver
	say_hello : say hello to the world
	"""

}

if [ -z $1 ]; then echo "ERROR: give us an argument";usage; exit 1; fi
case "$1" in
	backup )
		mkdir -p $HW/{database,webserver,queue}
		cp $HOME/database.text $HW/database/

		tar -zcvf backup_$HW.tar.gz $HW
		cp backup_$HW.tar.gz $HOME/
	;;
	say_hello )
		echo "Hello, World"
	;;
	* )
		usage
	;;
esac




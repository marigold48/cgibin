#!/bin/bash

olddir=$PWD;
declare -i dirdepth=1;
function listfiles {
	cd "$1";
	for file in *
	do
 	## Print directories with brackets ([directory])
		if [ -d "$file" ]
		then
			printf "$dirdepth::";
			printf "[$file]\n";
		else

				printf "$dirdepth::";
				printf "$file\n";
		fi

	##Work our way thru the system recursively
		if [ -d "$file" ]
		then
			dirdepth=$dirdepth+1;
			listfiles "$file";
			cd ..;
		fi
	done
	##Done with this directory - moving on to next file
	let dirdepth=$dirdepth-1;
}

cd "$1"
echo "0::[$PWD]"
cd $olddir
listfiles "$1";
##Go back to where we started
cd $olddir;
unset i dirdepth;


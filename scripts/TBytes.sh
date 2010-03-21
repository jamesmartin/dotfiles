#!/bin/bash
# Sum the number of bytes in a directory listing
TBytes=0
for Bytes in $(ls -l | grep "^-" | awk '{ print $5 }')
do
	let TBytes=$TBytes+$Bytes
done
TotalMeg=$(echo -e "scale=3\n$TBytes/1048576 \nquit"|bc)
echo -n "$TotalMeg"

#!/bin/bash
IFS=$'\n'

#This prints a list of IP addresses from a file, without duplicates.
#Note this will only work if it starts with the IP address and is followed by a space
#8.29.2018 g0ldleaf

#touch to open file
#for entry, cut so that everything separated by a space is considered a field
#only keep the first field, which hopefully is IP address
#when showing us the file, sort from smallest to largest number and only use unique IPs

touch <file>    #change <file> to be actual file you want to parse

for entry in $(cut -d " " -f 1 $1); do
    echo $entry >> <file>
done
cat <file> | sort -h | uniq

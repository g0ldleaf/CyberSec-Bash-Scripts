#!/bin/bash
IFS=$'\n'

#This script returns the count of how many times a source IP appears in a log, starting with the most common IP
#Note this will only work if it starts if Source IP is in the 3rd column separated by ;
#8.30.2018 g0ldleaf

#touch to open file
#for entry, cut so that everything separated by a semicolon is considered a field
#only keep the 3rd field, which hopefully is source IP address
#when showing us the file, sort from smallest to largest number and only use unique IPs

touch logfile1.txt    #change <file> to be actual file you want to parse

for entry in $(cut -d ";" -f 3 $1); do
    echo $entry >> logfile1-sorted.txt
done
#cat logfile1-sorted.txt | sort -h | uniq
#cat logfile1-sorted.txt | awk '{print $1}'| uniq -c |sort -n -k 1| tail
awk '{a[$1]++} END {for (i in a) print a[i],i | "sort -rnk1"}' logfile1-sorted.txt


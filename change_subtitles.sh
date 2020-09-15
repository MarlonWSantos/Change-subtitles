#!/bin/bash

file_en=$1
file_pt=$2
file_subtitle=$3
total_lines=$(cat $file_en | wc -l)
count=1

function read_subtitle {
  line_us=$(head -$count $file_en | tail -1)
  line_pt=$(head -$count $file_pt | tail -1)
}


read_subtitle

while [ True ];
do
    sed -i s/"^$line_us$"/"$line_pt"/ $file_subtitle
	let count++
	read_subtitle

    if [ $count -gt $total_lines ];then
	break
    fi
done 


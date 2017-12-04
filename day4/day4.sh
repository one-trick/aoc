#!/bin/bash

file="day4input"
part2file="non_duped_input"

# check to see if script has already been run
if [ -e $part2file ]
then
	# we use this file to solve part 2. If it's already there, we want a clean slate
	rm $part2file
fi

counter=0

while read -r line
do
	# get word count of line
	orig=`echo $line|wc -w`
	# get word count of line after duplicates are removed
	new=`echo $line| xargs -n1|sort -u|xargs|wc -w`
	# if the counts match, there weren't duplicated
        if [ $orig == $new ]
	then
		# for part 2, we are going to save off our non-duplicated input
		# it requires us to find words that aren't anagrams, so obviously duplicates aren't needed
		echo $line >> non_duped_input
		((counter++))
	fi
done < $file
echo "Part 1 counter: $counter"


# part 2
# reset counter
counter=0
while read -r line
do
	# get a total number of words in each line
	orig_number_of_words=`for i in $line; do echo $i; done | wc -l`
	# this will sort the characters in each word in alphabetical order. after that we remove duplicates and count
	sorted_number_of_words=`for i in $line; do echo $i | sed 's/\(.\)/\1\n/g' | sort|xargs|sed 's/ //g'; done | sort -u|wc -l`
	# If they match, there were no duplicated words
	if [ $orig_number_of_words == $sorted_number_of_words ]
	then
		((counter++))
	fi
done < $part2file
echo "Part 2 counter: $counter"

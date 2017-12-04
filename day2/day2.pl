#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;

# open file
# read one line
# load values into an array
# sort array and subtract
#
#
my $input_file = "day2input";
my $checksum = 0;

open(FH, $input_file) or die "failed to open bro";

while(<FH>)
{
    chomp($_);
    my @array = split(/\t/, $_);
    # Could have used sort, map, or several modules, but decided to do this the manual way for educational purposes
    my ($min, $max);
    for (@array)
    {
        # Logic for blocks below are if there isn't a current min/max set OR if the current value 
	# is lesser/greater than the current minx/max, change the value
        if(!$min || $_ < $min)
	{
            $min = $_;
	}
        if(!$max || $_ > $max)
	{
            $max = $_;
	}
    }

    # Add to checksum
    $checksum = $checksum + ($max-$min);
}

close FH;

print "Final checksum was $checksum\n";



# PART TWO
#
open(FH, $input_file) or die "failed to open bro";

my $pt2checksum = 0;
while(<FH>)
{
    chomp($_);
    my @array = split(/\t/, $_);
    # By default perl doesn't sort numbers correctly. It treats it as strings. So... a sample sort would be 182 193 194444444 202
    # sort { $a <=> $b } compares them as numbers. Swap $a and $b to change sort order
    my @sorted_array = sort { $b <=> $a }@array;
    my $finished = 0;
    my $current_index = 0;
    for (@sorted_array)
    {
	if ($finished == 1)
	{
	    $finished = 0;
	    last;
	}
	my $saved_index = $current_index;
	# Take the first value, look to see if the next value is smaller. If so, divide and check if theres a remainder
	# If not, we have our answer. Take the divided value and add to checksum, then set finished to go to next one
        while(1==1)
	{
	    my $remainder = $_ % $sorted_array[$current_index+1];
            if ($remainder != 0)
            {
	        # Number wasn't divisible
	        $current_index++;
		# TODO - There's 16 elements in the array, eventually, this shouldn't be hard-coded
	        if($current_index == 15)
	        {
		    $current_index = $saved_index+1;
		    last;
                }
	    }
            else
            {
		# Add to checksum, then skip outta this loop
		my $blah = $_ / $sorted_array[$current_index+1];
		$pt2checksum = $pt2checksum + $blah;
		$finished = 1;
		last;
            }		
	}
    }
}
# 261
print "Checksum = $pt2checksum\n";
close FH;


<?php

// For part two, just take the $current_state_string, put it into a file and tab delimit it, then change the input location value
// TODO Clean this code up and make it automatically pull in that input
$input_file = "day6input";
$fh = fopen($input_file, 'r');
while($line = trim(fgets($fh)))
{
	// explode splits a string by a delimiter and loads into an array. our input was tab delimited
	$blah = array_map('intval', explode("\t", $line));
}
fclose($fh);

$num_elements_in_array = count($blah);
print "Total elements in array is: $num_elements_in_array\n";

$counter = 0;
$state_array = [];
while(1)
{
	// Check out array state and see if a duplicate has already been stored
	if(count(array_unique($state_array)) < count($state_array) )
	{
		//Array had a duplicate, so add total number of array elements and subtract one (our duplicate)
		print "Duplicate value was: $current_state_string\n";
		// Decrementing counter since last input was a duplicate
		$counter--;
		print "Final counter was $counter\n";
		break;
	}
	// convert our current state into a string
	$current_state_string = implode(',', $blah);
	// Take our input and store the state of it in some manner
	$state_array[] = $current_state_string;
	// Perform operation on it to balance the blocks
	$max_loop_counter = 0;
	$max_val = 0;
	$max_key = 0;
	// Find the index with the highest number
	foreach($blah as $val)
	{
		if($val > $max_val)
		{
			$max_val = $val;
			$max_key = $max_loop_counter;
		}
		$max_loop_counter++;
	}

	//Now that we found our max value, we need to take that value and divide it through the other values
	$blah[$max_key] = 0;
	$rebalance_counter = 0;
	if($max_key == ($num_elements_in_array - 1))
	{
		$current_array_position = 0;
	}
	else
	{	
		$current_array_position = $max_key+1;
	}
	while($rebalance_counter < $max_val)
	{
		// Start at one past max_key, that is our starting point. iterate through the loop max_val times, adding one to each value
		// before adding, check to see if this is the last element. if so, loop
                // print "Rebalancing array position - $current_array_position\n";
		//print_r($blah);
		$blah[$current_array_position] += 1;
		if($current_array_position < ($num_elements_in_array - 1))
		{
		    $current_array_position++;
		}
		else
		{
			$current_array_position = 0;
		}
		$rebalance_counter++;
	}	
	$current_state_string = implode(',', $blah);
	// print "After rebalance state_string: " . $current_state_string."\n";

	$counter++;
}

?>

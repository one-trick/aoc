#!/usr/bin/ruby

# PART 1

input_data = File.readlines('day7input')
element_array ||= []
other_data ||= []

input_data.each do |c|
	# In order to solve the first challenge, have to find an item that supports other items, but in which no items supports it
	# Splitting on the first space. This will mean that the first split will be the element name, the second will be everything else
	element_name, everything_else = c.split(" ",2)
	element_array << element_name
	other_data << everything_else
end

element_array.each do |element|
	# If the element is a child element in our structure, it can't be the beginning element
	if other_data.index{|s| s =~ /#{element}/}
		# Do Nothing...
		# Side note, !~ doesn't seem to negate a match on my version of ruby. This is dumb. Ruby is dumb.
	else
		puts element + " was not a child element. Thus is our answer to Part 1."
	end
end


# PART 2

# The first thing we need to do is to get the name and weight of all elements this can be done with myarray
weight_hash = Hash.new
input_data.each do |c|
	element_name, weight, junk = c.split(" ", 3)
	# Strip weight of the surrounding ()
	weight.delete! '()'
	# Load element_name and weight into a hash table
	weight_hash[element_name] = weight
end

# Now that we have our weight hash, we need to figure out the structure or elements and what all they support
# I'll do this later...


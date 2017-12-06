console.log("Starting...beep boop");

var fs = require('fs');

// Sanity check
// Starting...beep boop
// Step count was: 359348
// Step count was: 27688760

// PART 1
// readFile(file, encoding, callback)
fs.readFile('day5input', {encoding: 'utf-8'}, function (err,data) {
    // I hate writing function blocks like this, but it looks better here
    if (err) {
        return console.log(err);
    }
    // Loading file into array, splitting on the newline
    var myarray = data.toString().split("\n");
    // Popping off the last element (which is NULL). This is probably due to how I did the split, but rather than
    // do that the right way, it's easier to just hack around it and write lengthy commentary on it afterwards
    myarray.pop();
    var arrayindex = 0;
    // cause it counts steps...get it? heh heh...
    var fitbit = 0;
    // Going to loop until our index ends up higher than the last possible element. At that point, we've "escaped the maze"
    while(arrayindex < (myarray.length))
    {
        // Save off current value
        var currentvalue = myarray[arrayindex];
        // Increment that value because we're going to use it (and that was the rules of the challenge)
        myarray[arrayindex] = parseInt(myarray[arrayindex]) + 1;
        // Now perform the jump - parseInt to ensure they're treated as integers. May not be necessary, but oh well
        arrayindex = parseInt(currentvalue) + parseInt(arrayindex);
        fitbit++;
    }
    console.log("Part 1 - Step count was: " + fitbit);    

});


//PART 2
fs.readFile('day5input', {encoding: 'utf-8'}, function (err,data) {
    if (err) {
        return console.log(err);
    }
    var myarray = data.toString().split("\n");
    // See commentary above
    myarray.pop();
    var arrayindex = 0;
    var fitbit = 0;
    while(arrayindex < (myarray.length))
    {
        var currentvalue = myarray[arrayindex];
        // The only thing that changes from the previous challenges is that previously, after a value was used, we incremented by one.
        // Now we decrement the value if it's greater than or equal to 3. Increment otherwise.
        if(parseInt(currentvalue) >= 3)
        {
            myarray[arrayindex] = parseInt(myarray[arrayindex]) - 1;
        }
        else
        {
            myarray[arrayindex] = parseInt(myarray[arrayindex]) + 1;
            
        }
        arrayindex = parseInt(currentvalue) + parseInt(arrayindex);
        fitbit++;
    }
    console.log("Part 2 - Step count was: " + fitbit);    

});


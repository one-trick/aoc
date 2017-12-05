$content = Get-Content $env:USERPROFILE\Documents\GitHub\aoc\day1\day1input.txt

$myarray = $content.ToCharArray()

$counter = 0
$total = 0

foreach($currentelement in $myarray)
{
    $counter++
    if($currentelement -eq $myarray[$counter])
    {
        #convert from char to the proper int value
        $int_val = [convert]::ToInt32($currentelement,10)
        $total = $int_val + $total
    }
}

#special logic for the circular aspect of the problem
$arraylength = $myarray.Length
if($myarray[0] -eq $myarray[$arraylength - 1])
{
    # Last and first matched.
    $myarray[0] / 1
    $total = $total + [convert]::ToInt32($myarray[0],10)
}

Write-Host "Total for part 1 is: $total"

# PART 2

# comparing values halfway around the circular input
# get the halfwaypoint of the input length
$halfwaypoint = $arraylength / 2

# Because it's circular, we're going to have to loop around so we don't start hitting an index that doesn't exist
# Loop through, if over arraylength, we need to figure out how much, and add that to 0
# example elements 0-2123
$counter = 0
$total = 0
foreach($currentelement in $myarray)
{
    $comparison = 0
    # Check to make sure we're not out of bounds
    # current index >= 1062
    if($counter -ge ($halfwaypoint))
    {
        # counter is 1062 or higher now we have to do math and add it to zero
        # 2123 - 1062 - 1 (because array index started with 0)
        $comparison = ($arraylength-1) - $counter
        $comparison = 0 + ($halfwaypoint - $comparison - 1)
    }
    else
    {
        # not over halfway point, just add it to our current index 
        $comparison = $counter+$halfwaypoint
    }
    if($currentelement -eq $myarray[$comparison])
    {
        #convert from char to the proper int value
        $int_val = [convert]::ToInt32($currentelement,10)
        $total = $int_val + $total
    }
    # increase our index
    $counter++
}

Write-Host "Part two total is $total"
#!/bin/bash

# Check if an input file is provided
if [ "$#" -gt 0 ]; then
    input_file="$1"
else
    echo "Usage: $0 input_file"
    exit 1
fi

awk 'BEGIN {
    FS = "\t"    # Set the field separator to tab
}
{
    # Split the first field into words to extract the agency name and date range
    split($1, arr, " ")
    agency = ""
    date_found = 0
    for (i = 1; i <= length(arr); i++) {
        if (match(arr[i], /^[0-9]+\/[0-9]+$/)) {
            # Date range starts here
            date_range = arr[i]
            if (arr[i+1] == "-" && match(arr[i+2], /^[0-9]+\/[0-9]+$/)) {
                date_range = date_range " " arr[i+1] " " arr[i+2]
                i += 2
            }
            date_found = 1
            break
        } else {
            # Build the agency name
            agency = (agency == "") ? arr[i] : agency " " arr[i]
        }
    }
    
    # Extract the start day from the date range
    if (date_found) {
        match(date_range, /[0-9]+\/([0-9]+)/, m)
        start_day = m[1]
    } else {
        start_day = 0  # Default if no date found
    }

    # Determine 'sep1' or 'sep2' based on the start day
    if (start_day < 15) {
        date_str = "sep2"
    } else {
        date_str = "sep1"
    }

    # Extract the number of respondents from the second field
    split($2, resp_arr, " ")
    num_respondents = resp_arr[1]

    # Extract the two numbers after the third field
    num1 = $4
    num2 = $5

    # Print the CSV line
    print agency "," date_str "," num_respondents "," num1 "," num2
}' "$input_file"

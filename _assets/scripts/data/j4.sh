#!/bin/bash

# Check if a file is provided as an argument
if [ "$#" -gt 0 ]; then
    # Use 'paste' to join every 4 lines from the file(s)
    paste -d ' ' - - - - "$@"
else
    # Use 'paste' to join every 4 lines from standard input
    paste -d ' ' - - - -
fi


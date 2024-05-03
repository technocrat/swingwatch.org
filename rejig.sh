#!/usr/bin/awk -f

BEGIN {
    FS = "[]=[:space:]+"
}

{
    if ($1 == "master_polls.data") {
        pollster = $2
        month = $3
        state = $5
        biden_support = $7
        trump_support = $9
        sample_size = $11
        printf "add_poll!(%s, %s, %s, %s, %s, %s)\n", month, state, pollster, biden_support, trump_support, sample_size
    }
}

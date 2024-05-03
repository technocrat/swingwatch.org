#!/usr/bin/awk -f

{
    FS = "[]=[ ]+"
    if ($1 == "master_polls.data") {
        pollster = $2
        month = $3
        state = $5
        poll_data = $7
        n = split(poll_data, poll_values, ",")
        if (n == 4) {
            # Trim "PollData(" and ")"
            poll_data = poll_values[2] "," poll_values[3] "," poll_values[4]
            printf "add_poll!(%s, %s, %s, %s)\n", month, state, pollster, poll_data
        }
    }
}

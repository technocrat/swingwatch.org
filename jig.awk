#!/usr/bin/awk -f

{
    FS = "[]=[ ]+"
    if ($1 == "master_polls.data") {
        pollster = $2
        month = $3
        state = $5
        poll_data = $7
        sub(/PollData\(/, "", poll_data)
        sub(/\)$/, "", poll_data)
        printf "add_poll!(%s, %s, %s, %s)\n", month, state, pollster, poll_data
    }
}

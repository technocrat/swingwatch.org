package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    if len(os.Args) < 2 {
        fmt.Println("Usage:", os.Args[0], "<input_file>")
        os.Exit(1)
    }

    inputFile, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Println("Error opening input file:", err)
        os.Exit(1)
    }
    defer inputFile.Close()

    scanner := bufio.NewScanner(inputFile)
    var pollster, month, state string
    for scanner.Scan() {
        line := scanner.Text()
        parts := strings.Split(line, "]")
        if len(parts) >= 3 && strings.HasPrefix(parts[0], "master_polls.data[") {
            pollsterAndMonth := strings.TrimPrefix(parts[0], "master_polls.data[")
            pollsterAndMonthParts := strings.Split(pollsterAndMonth, "][")
            if len(pollsterAndMonthParts) >= 2 {
                pollster = pollsterAndMonthParts[0]
                month = pollsterAndMonthParts[1]
                state = strings.TrimPrefix(parts[1], ".data[")
            } else {
                fmt.Println("Invalid pollster and month format, skipping line")
                continue
            }
        } else if strings.HasPrefix(line, "PollData(") {
            pollData := strings.TrimPrefix(line, "PollData(")
            pollData = strings.TrimSuffix(pollData, ")")
            pollValues := strings.Split(pollData, ",")
            if len(pollValues) == 3 {
                fmt.Printf("add_poll!(%s, %s, %s, %s, %s, %s)\n", month, state, pollster, pollValues[0], pollValues[1], pollValues[2])
            } else {
                fmt.Println("Invalid poll data format, skipping line")
            }
        }
    }

    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading input file:", err)
        os.Exit(1)
    }
}
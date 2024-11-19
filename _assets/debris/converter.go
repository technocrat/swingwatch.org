package main

import (
    "fmt"
    "strings"
)

func main() {
    inputLines := []string{
        "bl2,mar,AZ,42,49,788",
        "bi2,mar,PA,40,46,1305",
        "bi2,mar,MI,42,45,1218",
        "bl2,mar,PA,45,45,807",
        "bl2,mar,GA,42,49,788",
        "bl2,mar,NC,43,49,699",
        "bl2,mar,MI,44,46,447",
        "bl2,mar,AZ,42,49,788",
        "bl2,mar,WI,46,45,697",
        "bl2,mar,NV,43,49,699",
        "cb2,mar,GA,48,51,1133",
        "cn2,mar,PA,46,46,1132",
        "cn2,mar,MI,42,50,1097",
        "ec2,mar,PA,43,45,1000",
        "ec2,mar,GA,42,46,1000",
        "ec2,mar,MI,44,45,1000",
        "fm2,mar,PA,48,38,431",
        "fo2,mar,PA,45,49,1121",
        "hi2,mar,NC,38,44,1016",
        "ma2,mar,NC,48,51,1295",
        "mi2,mar,NC,44,47,626",
        "qi2,mar,MI,45,48,1487",
        "sp2,mar,MI,44,48,709",
        "wa2,mar,PA,45,50,736",
        "ws2,mar,PA,44,47,600",
        "ws2,mar,GA,43,44,600",
        "ws2,mar,NC,43,49,600",
        "ws2,mar,MI,45,48,600",
        "ws2,mar,AZ,44,47,600",
        "ws2,mar,WI,46,46,600",
        "ws2,mar,NV,44,48,600",
    }

    for _, line := range inputLines {
        parts := strings.Split(line, ",")
        if len(parts) == 6 {
            pollster, month, state, bidenSupport, trumpSupport, sampleSize := parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]
            fmt.Printf("add_poll!(%s, %s, %s, %s, %s, %s)\n", month, state, pollster, bidenSupport, trumpSupport, sampleSize)
        }
    }
}
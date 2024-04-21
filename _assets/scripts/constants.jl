# Set directory hierarchy

root = "."
code = root * "/code/"
made = root * "/objs/"
data = root * "/data/"

using CSV
using DataFrames
using Colors
using Combinatorics
using HTTP
using PlotlyJS


# Define the state abbreviations and their corresponding electoral votes

const STATES   = ["NV", "WI", "AZ", "GA", "MI", "PA", "NC"]
const VOTES    = [6, 10, 11, 16, 15, 19, 16]
const TIED     = 269
const FLAGRED  = "#B22234"
const FLAGBLUE = "#3C3B6E"
const PURPLE   = "#772F51"
const GREENBAR = "#2F774E"

# Initialize an object to hold the collected combinations
combos = Dict()

# To collect combinations for n = 1:7
for n in 1:7
    # Generate combinations of length n
    combinations_n = combinations(STATES, n)
    # Collect combinations and store them in the dictionary
    combos[n] = collect(combinations_n)
end

# Now `collected_combinations` holds all the collected combinations for n = 1:7
join(STATES,", ")
# gives: "NV, WI, AZ, GA, MI, PA, NC"

# votes in Electoral College
const COLLEGE = 538
const VICTORY = 270
const TIE     = 269

# biden won 6 of the 7 swing states
# trump won NC
const BLUE    = 225
const RED     = 220

# Create a color scale with discrete colors for each value

const PURPLES = ["#CFA2DB", "#B583A4", "#9A7AA0", "#886F90", "#7A5980", "#695070", "#5A4060"]
const GREENS  = ["#77DD77", "#8FBC8F", "#556B2F", "#6B8E23", "#4F7942", "#404627", "#2E5E21"]

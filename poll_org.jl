# these static types assure that only legal values can be accepted
@enum Month mar apr may jun jul aug sep oct nov
# 2 indicates polls using a Biden-Trump matchup
# 3 indicates polls including RJK Jr if he has qualified for the ballot
@enum Pollster bi2 bi3 bl2 bl3 cn2 cn3 ec2 ec3 hi2 hi3 ma2 ma3 moe qi2 qi3 sp2 sp3 su2 su3 ws2 ws3l ws3s
# the swing states
@enum State PA GA NC MI AZ WI NV


struct PollData
    biden_support::Union{Float64, Missing}
    trump_support::Union{Float64, Missing}
    sample_size::Union{Int, Missing}
end

struct MonthlyData
    data::Dict{State, Vector{PollData}}
    MonthlyData() = new(Dict(s => [PollData(missing, missing, missing)] for s in instances(State)))
end

struct MasterPolls
    data::Dict{Pollster, Dict{Month, MonthlyData}}
    MasterPolls() = new(Dict{Pollster, Dict{Month, MonthlyData}}())
end

master_polls = MasterPolls()

# Add poll data for a specific pollster, month, and state
master_polls.data[bi2] = Dict(
    mar  => MonthlyData(),
    apr  => MonthlyData(),
    may  => MonthlyData(),
    jun  => MonthlyData(),
    jul  => MonthlyData(),
    aug  => MonthlyData(),
    sep  => MonthlyData(),
    oct  => MonthlyData(),
    nov  => MonthlyData()
)

"""
# Add poll data for a specific pollster, month, and state
master_polls.data[bi2][mar].data[PA] = [
    PollData(0.40, 0.46, 1305),
    PollData(0.45, 0.45,  887),
    PollData(0.56, 0.46, 5200)
]
"""

# Access poll data for pollster bi2, month mar, and state PA

# pa_data = master_polls.data[bi2][mar].data[PA]

# save to file and read in from file to preserve state between
# session

using Serialization

"""
# Serialize and save the master_polls object to a file
serialize("master_polls.bin", master_polls)

# Load the serialized master_polls object from the file
loaded_master_polls = deserialize("master_polls.bin")
"""

"""
    save_master_polls(master_polls::MasterPolls, filename::String)

Serialize and save the `master_polls` object to a file specified by `filename`.

# Arguments
- `master_polls::MasterPolls`: The `MasterPolls` object to be serialized and saved.
- `filename::String`: The name of the file to save the serialized data.

# Examples
```julia
save_master_polls(master_polls, "master_polls.bin")
"""
function save_master_polls(master_polls::MasterPolls, filename::String)
    open(filename, "w") do f
        serialize(f, master_polls)
    end
    println("Master polls data saved to $filename")
end

"""
  load_master_polls(filename::String)

Load the serialized MasterPolls object from a file specified by filename.
Arguments

# Arguments

  - `filename::String`: The name of the file containing the serialized data.

# Returns

  MasterPolls: The deserialized MasterPolls object.

# Examples
```julia
codeloaded_master_polls = load_master_polls("master_polls.bin")
"""
function load_master_polls(filename::String)
    master_polls = open(filename, "r") do f
        deserialize(f)
    end
    println("Master polls data loaded from $filename")
    return master_polls
end

function enter_data(pollster::Pollster, month::Month, state::State)
    println("master_polls.data[$pollster][$month].data[$state] = [")
    println("    PollData( , , )")
    println("]")
end

"""
    enter_data(pollster::Pollster, month::Month, state::State)

Generate a template for entering poll data into the `master_polls` object.

The template includes the appropriate `master_polls.data` syntax with placeholders for the `biden_support`, `trump_support`, and `sample_size` values in a single `PollData` entry.

# Arguments
- `pollster::Pollster`: The pollster enum value for which the data is being entered.
- `month::Month`: The month enum value for which the data is being entered.
- `state::State`: The state enum value for which the data is being entered.

# Examples
```julia
enter_data(bi2, mar, PA)
# Output
master_polls.data[bi2][mar].data[PA] = [
    PollData( , , )
]
"""
function enter_data(pollster::Pollster, month::Month, state::State)
    println("master_polls.data[$pollster][$month].data[$state] = [PollData( , , ),]")
end

"""
    generate_templates(month::Month)

Generate templates for entering poll data into the `master_polls` object for all combinations of `Pollster` and `State` for a given `Month`.

This function iterates over the `Pollster` and `State` enums and calls the `enter_data` function for each combination, using the provided `month` argument.

# Arguments
- `month::Month`: The month enum value for which the templates are being generated.

# Examples
```julia
generate_templates(mar)

This will generate templates for all combinations of Pollster and State for the month of March like this

master_polls.data[bi2][mar].data[PA] = [
    PollData( , , )
] …

On completion, this is intended to be pasted from the system clipboard to a text editor for data entry

"""

function generate_templates(month::Month)
  templates = ""
  for pollster in instances(Pollster)
    for state in instances(State)
    templates *= "master_polls.data[$pollster][$month].data[$state] = [\n    PollData( , , )\n]\n\n"
    end
  end
  InteractiveUtils.clipboard(templates)
  println("Templates copied to clipboard.")
end
using CSV
using DataFrames
using HTTP

# URL of the raw CSV file from the GitHub Gist
gist_url = "https://gist.githubusercontent.com/technocrat/18810a6c1c3d6d2c443876f06df0ad28/raw/a4b7ebf2d6429c5224417a133caa61dedfaa433e/2020vote.csv"

# Fetch the CSV data from the Gist URL
csv_data = HTTP.get(gist_url).body

# Read the CSV data into a DataFrame
base = CSV.read(IOBuffer(csv_data), DataFrame)

# Now `df` contains the data from the CSV file
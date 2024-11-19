using DataFrames
using Dates

polls = DataFrame(
  state             = String[],
  biden             = Float64[],
  trump             = Float64[],
  n                 = Int64[],
  type              = String[],
  base_moe          = Float64[],
  house_moe         = Float64[],
  organization      = String[],
  url_hash          = String[],
  start             = Date[],
  finish            = Date[]
)

# example
hashed = shorten_url("https://pro-assets.morningconsult.com/wp-uploads/2024/03/Bloomberg_2024-Election-Tracking-Wave-6.pdf")

push!(polls, ["Arizona", 
              0.43, 
              0.48, 
              796,
              "TK",
              0.03,
              0.0,
              "Bloomberg", 
              hashed,
              Date(2024, 3,8), 
              Date(2024, 3, 5)])




# Create an empty DataFrame to store the URLs and their hash keys
urlhash = DataFrame(original_url = String[], hash_key = String[])

# Function to generate a unique hash key for a URL
function generate_hash_key(url)
    hash_key = bytes2hex(SHA.sha256(url))
    return hash_key[1:8]  # Use the first 8 characters of the hash as the key
end

# Function to shorten a URL and store it in the DataFrame
function shorten_url(url)
    hash_key = generate_hash_key(url)
    push!(urlhash, (original_url = url, hash_key = hash_key))
    return hash_key
end

# Function to retrieve the original URL from the DataFrame using the hash key
function expand_url(hash_key)
    row = filter(row -> row.hash_key == hash_key, urlhash)
    if nrow(row) > 0
        return row[1, :original_url]
    else
        return "URL not found"
    end
end

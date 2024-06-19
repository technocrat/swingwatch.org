using BSON: @load, @save
using CSV
using DataFrames
using Format
using GLMakie
using KernelDensity
using LinearAlgebra
using MCMCChains
using Missings
using PrettyTables
using Printf
using Serialization
using Statistics
using Turing
#------------------------------------------------------------------
const FLAGRED  = "rgb(178,  34,  52)"
const FLAGBLUE = "rgb( 60,  59, 110)"
const PURPLE   = "rgb(119,  47,  81)"
const GREENBAR = "rgb( 47, 119,  78)"
const LORANGE  = "rgb(225, 170, 110)"
#------------------------------------------------------------------

# Define the model
@model function election_model(num_votes::Int64, num_wins::Int64)
    # Prior: Beta(2, 2) equivalent to a close race going in
    p ~ Beta(2,2)
    # Likelihood
    num_wins ~ Binomial(num_votes, p)
end

sampler = NUTS(0.65)
num_samples = 10000
num_chains  = 4


init_params = [Dict(:p => 0.5)]

Month_names = Dict(
	"mar" => "March",
	"apr" => "April",
	"may" => "May",
	"jun" => "June",
	"aug" => "August",
	"sep" => "September",
	"oct" => "October")
#------------------------------------------------------------------

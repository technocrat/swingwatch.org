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
#------------

# Set the number of votes and wins
last_election = CSV.read("../objs/election_priors.csv", DataFrame)

# Define the model
include("models.jl")

# Set up the sampler
sampler = NUTS(0.65)

# Specify the number of samples and chains
num_samples = 10000
num_chains  = 4

# Sample from the posterior
init_params = [Dict(:p => 0.5)]
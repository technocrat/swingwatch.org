include("libr.jl") # libraries
include("strc.jl") # structures
include("enum.jl") # enumerations
include("impt.jl") # object imports
include("cons.jl") # constants
include("dict.jl") # dictionaries
include("poll.jl") # polling data
include("func.jl") # functions

prior_month = "aug2"
mon         =  sep1
MON         = "sep1"
Mon         = "sep1"
st          = "WI"
ST          =  WI

include("main.jl") # modeling
include("outp.jl") # output
include("insp.jl") # check results
include("save.jl") # save model

out       = Vector(p_df[1,:])
out       = round.(out,digits = 4)
p_df[1,:] = out
chain
summarystats(chain)
autocor(chain)
hpd(chain)

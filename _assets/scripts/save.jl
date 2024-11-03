save(("../img/models/"*"$st"*"_"*"$mon"*".png"), fig)
deep = deepcopy(chain)
@save ("objs/"*"$st"*"_"*"$mon"*"_p_sample.bson") deep

def ship_var(var_name, file_name):
	#var_string = [k for k,v in locals().items() if v is var_name][0]
	for k, v in list(globals().items()):
        	 if v is var_name:
             		var_string = k
	tex_var = "\\newcommand{\\" + var_string + "}{" + str(var_name) + "}"
	print(tex_var, file=open(file_name, "a"))
	return 0

py = 3.7
ship_var(py, "py_vars.tex")

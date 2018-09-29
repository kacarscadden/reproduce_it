R_outs = flight.pdf r_vars.tex
py_outs = py_vars.tex
all: the_ms.tex the_ms.pdf the_ms.docx $(R_outs) $(py_outs)

#snag two example citations styles from github
cell.csl:  
	wget https://raw.githubusercontent.com/citation-style-language/styles/master/cell.csl

apa.csl:
	wget https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl

#cell for funsies, but easy to change
my_csl=cell.csl


#produce figure and R variable
$(R_outs): flight.R
	Rscript flight.R

$(py_outs): python_too.py
	python python_too.py

#output to tex
the_ms.tex: the_ms.md metadata.yaml format.yaml simple.bib $(R_outs) $(py_outs)
	pandoc -s the_ms.md \
		metadata.yaml \
		format.yaml \
		-o the_ms.tex \
		--filter pandoc-fignos \
		--filter pandoc-tablenos \
		--bibliography simple.bib \
		--csl $(my_csl)



#output docx
the_ms.docx: the_ms.md metadata.yaml format.yaml simple.bib $(R_outs) $(py_outs)
	pandoc -s the_ms.md \
		metadata.yaml \
		format.yaml \
		-o the_ms.docx \
		--filter pandoc-fignos \
		--filter pandoc-tablenos \
		--bibliography simple.bib \
		--csl $(my_csl)


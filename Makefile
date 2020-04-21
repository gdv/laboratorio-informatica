TARGETS=SAS.pdf R.pdf
LATEXMK = latexmk -recorder -use-make

pdf: $(TARGETS)

vc.tex:	.git/logs/HEAD
	bash vc

%.pdf : %.tex
	$(LATEXMK) -pdf $<

%.pdf : %.md
	pandoc -t beamer --from markdown+grid_tables -V theme:metropolis --listings  -V aspectratio:169 -V themeoptions:titleformat=smallcaps --pdf-engine xelatex  $< -o $@

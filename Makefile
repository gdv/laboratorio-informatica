TARGETS=SAS.pdf
LATEXMK = latexmk -recorder -use-make

pdf: $(TARGETS)

vc.tex:	.git/logs/HEAD
	bash vc

%.pdf : %.tex vc.tex
	$(LATEXMK) -pdf $<

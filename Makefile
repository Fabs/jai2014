
BASE_NAME = introducao_empreendedorismo-2014

LATEX     = latex
PDFLATEX  = pdflatex
BIBTEX    = bibtex
MAKEINDEX = makeindex

OS := $(shell uname)

ifeq ($(OS),Darwin)
  VIEWER = open
else
  VIEWER = evince
endif

pdf: $(BASE_NAME).pdf
	$(VIEWER) $(BASE_NAME).pdf &
ps: $(BASE_NAME).ps

	

$(BASE_NAME).pdf: $(BASE_NAME).tex
	$(PDFLATEX) $<
	$(BIBTEX) $(BASE_NAME) 
	$(PDFLATEX) $< 
	$(PDFLATEX) $<
	$(PDFLATEX) $<

$(BASE_NAME).ps: $(BASE_NAME).tex 
	$(LATEX) $<
	$(BIBTEX) $(BASE_NAME) 
	$(MAKEINDEX) $(BASE_NAME) 
	$(LATEX) $< 
	$(LATEX) $<
	$(LATEX) $<
	
clean:
	rm -f $(BASE_NAME)*.ps $(BASE_NAME)*.dvi *.log \
	      *.aux *.blg *.toc *.brf *.ilg *.ind *.idx \
	      missfont.log $(BASE_NAME)*.bbl $(BASE_NAME)*.pdf $(BASE_NAME)*.out \
		  $(BASE_NAME)*.lof $(BASE_NAME)*.lot 

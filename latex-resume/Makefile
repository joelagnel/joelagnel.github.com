PDF_VIEWER := evince

all: preview

%.pdf: %.tex moderncvthemeclassic.sty
	pdflatex $<

preview: joel-resume.pdf
	$(PDF_VIEWER) joel-resume.pdf


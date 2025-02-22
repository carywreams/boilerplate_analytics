TEX:=$(sort $(wildcard reports/*.tex))
TEX_REPORTS:=$(subst reports,.,$(subst tex,pdf,$(TEX)))

# OPT_PANDOC:=-V "geometry:margin=0.75in" --template=templates/template.tex

breaker-panel.tex.pdf: reports/breaker-panel.tex



# latexmk will simply create the .pdf file, ignoring the desired .tex.pdf
# the last line in this recipe addresses that issue, by renaming final
# output to follow convention
%.tex.pdf: reports/%.tex
	@echo "-- $@"
	@cp $< ./
	@latexmk -gg $(notdir $<)
	@latexmk -c $(notdir $<)
	@rm -f $(subst .tex.pdf,.tex,$@)
	@mv $(subst .tex.pdf,.pdf,$@) $@

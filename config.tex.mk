TEX:=$(sort $(wildcard reports/*.tex))
TEX_REPORTS:=$(subst reports,.,$(subst tex,pdf,$(TEX)))

# OPT_PANDOC:=-V "geometry:margin=0.75in" --template=templates/template.tex

breaker-panel.tex.pdf: reports/breaker-panel.tex


%.tex.pdf: reports/%.tex
	@echo "-- $@"
	@cp $< ./
	@latexmk $(notdir $<)
	@rm -f $(subst .tex.pdf,.aux,$@)
	@rm -f $(subst .tex.pdf,.fdb_latexmk,$@)
	@rm -f $(subst .tex.pdf,.fls,$@)
	@rm -f $(subst .tex.pdf,.log,$@)
	@rm -f $(notdir $<)

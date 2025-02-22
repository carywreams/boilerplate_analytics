MD:=$(sort $(wildcard reports/*.md))
MD_REPORTS:=$(subst reports,.,$(subst md,md.pdf,$(MD)))

MD_OPT_PANDOC:=-V "geometry:margin=0.75in" --template=templates/template.tex

irrigation-runtimes.md.pdf: reports/irrigation-runtimes.md

%.md.pdf: reports/%.md templates/template.tex
	@echo "-- $@"
	@pandoc $(MD_OPT_PANDOC) $< -o $@

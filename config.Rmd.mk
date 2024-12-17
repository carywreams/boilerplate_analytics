## RMD REPORTS

RMD:=$(sort $(wildcard reports/*.Rmd))
RMD_REPORTS:=$(subst reports,.,$(subst Rmd,Rmd.pdf,$(RMD)))

# dependencies
water-usage-summary.pdf: reports/water-usage-summary.Rmd
water-usage-summary.pdf: data_models/water-usage/model.Rds

# build rule
%.Rmd.pdf: reports/%.Rmd
	@echo "-- $@"
	@/usr/local/bin/R --silent --no-save -e "library('rmarkdown'); render('$<',output_format='pdf_document',output_file='../$@')"

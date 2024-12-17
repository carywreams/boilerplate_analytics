.PHONY: clean clean_data reports clean_reports all echo

include config.data.mk
include config.Rmd.mk

# build target
data: $(MODELS) $(DERIVED_MODELS)

clean_data:
	rm -f $(MODELS)
	rm -f $(DERIVED_MODELS)

# build target
reports: $(RMD_REPORTS) $(MD_REPORTS) $(TEX_REPORTS)

clean_reports:
	rm -f $(RMD_REPORTS)
	rm -f $(MD_REPORTS)
	rm -f $(TEX_REPORTS)


clean: clean_data clean_reports

all: data reports

echo:
	@echo $(RMD_REPORTS) $(MD_REPORTS) $(TEX_REPORTS)

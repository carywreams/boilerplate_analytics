## DATA

RECORDS:=$(sort $(wildcard data_models/*/records.dat))
MODELS:=$(subst records.dat,model.Rds,$(RECORDS))
INTAKE:=data_models/lib/intake.Rscript
DDEXTRACT:=data_models/lib/data_dictionary_extraction.awk


# so the data_models/<model-name> exists
#    with a derive.Rscript instead of an intake.Rscript
#    and no records.dat file
DERIVED_MODELS:=$(subst derive.Rscript,model.Rds,$(sort $(wildcard data_models/*/derive.Rscript)))


# dependencies
data_models/water-usage/model.Rds: $(INTAKE)
data_models/water-usage/model.Rds: data_models/water-usage/records.dat
data_models/water-usage/model.Rds: data_models/water-usage/data_dictionary.R
data_models/water-usage/data_dictionary.R: $(DDEXTRACT)
data_models/water-usage/data_dictionary.R: data_models/water-usage/data_dictionary.dat


data_models/%/data_dictionary.R:
	@echo "-- $@"
	@$(DDEXTRACT) $(subst .R,.dat,$@) > $@


# build rule
data_models/%/model.Rds:
	@echo "-- $@"
	@$(INTAKE) $(subst model.Rds,records.dat,$@) $(subst model.Rds,data_dictionary.R,$@) $@


# derived models
# but for now, they each get their own make target
# data_models/<model-name>/model.Rds: data_models/<dependency-one-model>/model.Rds
# data_models/<model-name>/model.Rds: data_models/<dependency-two-model>/model.Rds
# data_models/<model-name>/model.Rds: data_models/<model-name>/derive.Rsscript
#	@echo "-- $@"
#	@$(subst model.Rds,derive.Rscript,$@)  model1locn model2locn  $@

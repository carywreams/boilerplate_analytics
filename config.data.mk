## DATA

RECORDS:=$(sort $(wildcard data_models/*/records.dat))
MODELS:=$(subst records.dat,model.Rds,$(RECORDS))

# so the data_models/<model-name> exists
#    with a derive.Rscript instead of an intake.Rscript
#    and no records.dat file
DERIVED_MODELS:=$(subst derive.Rscript,model.Rds,$(sort $(wildcard data_models/*/derive.Rscript)))


# dependencies
data_models/water-usage/model.Rds: data_models/water-usage/intake.Rscript
data_models/water-usage/model.Rds: data_models/water-usage/records.dat

# build rule
data_models/%/model.Rds:
	@echo "-- $@"
	@$(subst model.Rds,intake.Rscript,$@)  $(subst model.Rds,records.dat,$@) $@


# derived models
# but for now, they each get their own make target
# data_models/<model-name>/model.Rds: data_models/<dependency-one-model>/model.Rds
# data_models/<model-name>/model.Rds: data_models/<dependency-two-model>/model.Rds
# data_models/<model-name>/model.Rds: data_models/<model-name>/derive.Rsscript
#	@echo "-- $@"
#	@$(subst model.Rds,derive.Rscript,$@)  model1locn model2locn  $@

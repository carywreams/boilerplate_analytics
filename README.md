# README

## Work In Progress

+ based on [Evolutionary Database Design](https://martinfowler.com/articles/evodb.html) principles
+ coalescing several generations of this structure from multiple projects

## TODO

+ add a sample derived model
+ add a sample ``.tex`` file, along with home for template.tex(s)
+ add a sample ``.md`` file
+ decide how to handle raw data used to create ``data_model/records.dat``. Could be that a single collection of raw data (mysql slow logs) could create multiple data_models. There is no law of the universe enforcing a 1:1 relationship between raw data and data models.
+ other items as they become apparent, which is to say its a __WIP__
+ automate build dependencies for data_models in config.data.mk

## on data_dictionary's Opinionated Structure

+ each data_model now includes a data_dictionary.dat file
  + rows in same order as records.dat columns
  + columns in specific order for creating data_dictionary.R
+ allows for abstraction of intake.R to data_models/lib
+ future allows for more detailed data dictionary elements

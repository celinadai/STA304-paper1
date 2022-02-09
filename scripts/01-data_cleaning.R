#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(opendatatoronto)
library(dplyr)

package <- show_package("668434ee-9541-40a8-adb6-0ad805fcc9b6")
package

# get all resources for this package
resources <- list_package_resources("668434ee-9541-40a8-adb6-0ad805fcc9b6")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

budget_data <- data%>%
  filter(Fiscal_Year == "2021",
         Organization_Entity == "1 - Toronto Police Service",
         Command_Name == "Communities & Neighbourhoods Command",
         Budget_Type == "Approved Budget")%>%
  filter(Amount > 0)%>%
  select("_id", "Fiscal_Year", "Budget_Type","Organization_Entity", "Command_Name", "Feature_Category", "Amount")

head(budget_data)
         

#### What's next? ####



         
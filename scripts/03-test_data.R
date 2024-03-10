#### Preamble ####
# Purpose: Tests the cleaned data sets from "data/analysis_data"
# Author: Jeongwoo Kim, Jiwon Choi
# Date: 9 March 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R, 02-data_cleaning-post-strat.R, 01-data_cleaning-survey.R

#### Workspace setup ####
library(tidyverse)
library(lubridate)

### Test for the cleaned post-strat data ###
cleaned_data <- read_csv("data/analysis_data/usa_00002_cleaned.csv")

# Check if 'stateicp' contains only valid state abbreviations
all(cleaned_data$stateicp %in% state_abbreviations)

# Check if 'sex' contains only valid categories
all(cleaned_data$sex %in% sex_categories)

# Check if 'age_group' is categorized correctly
valid_age_groups <- c("18-29", "30-49", "50-64", "65+")
all(cleaned_data$age_group %in% valid_age_groups)

# Check if 'race' is categorized correctly
valid_races <- c("White", "Black", "American Indian", "Asian", "Others")
all(cleaned_data$race %in% valid_races)

# Check if 'education' is categorized correctly
valid_education_levels <- c("High School or Less", "Some College", "College Degree", "Postgrad")
all(cleaned_data$education %in% valid_education_levels)

# Check for absence of 'Unknown' in key columns
!any(cleaned_data$sex == "Unknown" | cleaned_data$age_group == "Unknown" | cleaned_data$race == "Unknown" | cleaned_data$education == "Unknown")

# Ensure that original 'age' and 'educd' columns are removed
!"age" %in% names(cleaned_data)
!"educd" %in% names(cleaned_data)

# Applying is.character to each column and checking if all are TRUE
columns_to_check <- c("sex", "stateicp", "race", "education", "age_group")
all(sapply(cleaned_data[columns_to_check], is.character))



### Test for the cleaned survey data ###
cleaned_data_survey <- read_csv("data/analysis_data/ns20191003_cleaned.csv")

# Check unique values for 'vote_intention'
valid_vote_intention <- c("Yes", "No", "Other")
all(cleaned_data_survey$vote_intention %in% valid_vote_intention)

# Check unique values for 'consider_trump'
valid_consider_trump <- c("Yes", "No", "Other")
all(cleaned_data_survey$consider_trump %in% valid_consider_trump)

# Check unique values for 'not_trump'
valid_not_trump <- c("Yes", "No", "Other")
all(cleaned_data_survey$not_trump %in% valid_not_trump)

# Check unique values for 'primary_party'
valid_primary_party <- c("Democratic", "Republican", "Other")
all(cleaned_data_survey$primary_party %in% valid_primary_party)

# Check unique values for 'education'
valid_education <- c("Highschool or less", "Some college", "College degree", "Postgrad", "Other")
all(cleaned_data_survey$education %in% valid_education)

# Check unique values for 'race_ethnicity'
valid_race_ethnicity <- c("White", "Black", "American Indian", "Asian", "Other")
all(cleaned_data_survey$race_ethnicity %in% valid_race_ethnicity)

# Check unique values for 'age_group'
valid_age_group <- c("18~29", "30~49", "50~64", "65+")
all(cleaned_data_survey$age_group %in% valid_age_group)

# Check unique values for 'gender'
valid_gender <- c("Female", "Male", "Unknown") # Including 'Unknown' if it was intentionally retained
all(cleaned_data_survey$gender %in% valid_gender)

# Ensure no 'Unknown' values in key columns
!any(cleaned_data_survey$vote_intention == "Unknown" |
                      cleaned_data_survey$consider_trump == "Unknown" |
                      cleaned_data_survey$not_trump == "Unknown" |
                      cleaned_data_survey$primary_party == "Unknown" |
                      cleaned_data_survey$education == "Unknown" |
                      cleaned_data_survey$race_ethnicity == "Unknown" |
                      cleaned_data_survey$age_group == "Unknown" |
                      cleaned_data_survey$gender == "Unknown")

#### Test result ####
# Result: All TRUE
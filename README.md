# Starter folder

## Overview

This repo contains the data, code, and analysis of the 2020 U.S. presidential election forecast, designed by Jiwon Choi and Jeongwoo Kim.  

## File Structure

The repo is structured as:

-   `data/analysis_data` contains the cleaned datasets that were constructed for the survey data from Democracy Fund + UCLA Nationscape of the Voter Study Group and post-stratification data of the U.S. Census data from IPUMS. 
-   `model` contains the fitted logistic regression models for our analysis. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document (paper.qmd) and reference bibliography file (references.bib), as well as the PDF of the paper (peper.pdf). 
-   `scripts` contains the R scripts used to simulate, download and clean data. This is categorized into two folders 'post_strat' and 'survey' as we have used two difference datasets for this research. 'post-strat' contains the R scripts to simulate the post-stratification data (00-somulation-poststratification.R), clean the data (01-data-cleaning-poststratification.R) and test the data (02-test-data-poststratification.R). Similarly, 'survey' contains the R scripts to simulate the survey data (00-simulation-survey.R), clean the data (01-data-cleaning-survey.R) and test the data (02-test-data-survey.R). 

## Raw Data details

The survey data from the Voter Study Group and the U.S. Census data from IPUMS cannot be shared so we are going to document the steps to get the original, unedited data here. 

- Survey data from the Voter Study Group: To obtain this data, you can click https://www.voterstudygroup.org/data/nationscape, scroll down the page and type in your First Name, Last Name, and e-mail address to submit a request to download the full data set. This could take a day or two. They will send you a link to download the data. Once you have the access and click the link, you will have 5 files that include weekly crosstabs, a codebook, variables, and instructions in addition to the data file. We suggest you to download .dta files. The week data that we have decided to use for this analysis is 'ns20191003'. 

- U.S. Census data from IPUMS: To obtain this data, you can visit the link: https://usa.ipums.org/usa/index.shtml. You willl need to create an account by filling in your name, organization and e-mail address and the purpose of the usage. Once you have completed this step, you can click 'Get Data' on the middle of the page. 

## Statement on LLM usage

No LLMs were used. 

# Chicago Crime Analysis (SQL + Python)
Analysis of Chicago crime and socioeconomic datasets 
using SQL and Python.

## Introduction
This project uses SQL and Python to explore relationships 
between crime rates, types and whether they change depending on 
factors such as Community Area and Income.

## Questions of Interest
Which communities experience the highest and lowest crime rates?
What types of crimes occur most frequently?
Is there a relationship between crime rates and per capita income?

## Data Sources
The projects uses versions of two datasets: 

- Chicago Crime Data
  This dataset looks at reported incidents of crime, including 
  type of crime and location.


- Socioeconomic Indicators In Chicago
  This dataset contains information on six socioeconomic indicators
  and a "hardship index" for each community area.

Both of these datasets are available on the city of Chicago's 
data portal. For this project, subsets of the original data
are used as they are more database friendly.

## Exploratory Data Analysis
Initial investigation of the data was conducted using SQL 
queries to explore the datasets.

## Key Findings
Crime rates differ dramatically by Community Area. There is   
a large spike of crime in Austin for the highest crime rates,  
followed by Humblodt Park and Englewood. The communities 
with the lowest crime rates are Forest Glen, Near South Side,
Hegewisch, Burnside and Bridgeport.

The most common types of crime reported in Chicago are theft
and battery. These together account for the majority of all
crime in Chicago.

Community Areas with lower per capita income tend to experience
higher crime rates. Community Areas with higher per capita
income tend to experience lower crime rates. 
The community area with the highest crime rate, Austin, has 
a per capita income of 15957, compared to the community with 
the lowest crime rate, Forest Glen, with a per capita income 
of 44164. However, there is not a perfectly linear relationship and 
the data has considerable variability.



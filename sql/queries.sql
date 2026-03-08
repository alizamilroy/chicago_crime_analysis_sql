#install required libraries

!pip install pandas   
!pip install ipython-sql prettytable   
!pip install seaborn 

import pandas as pd
import sqlite3
import prettytable
prettytable.DEFAULT = 'DEFAULT'



#load libraries and establish a connection to FinalDB.db


con = sqlite3.connect("FinalDB.db")
cur = con.cursor()

%load_ext sql


#read files into pandas dataframes

Insert data into the table

census = pandas.read_csv('C:\Users\aliza\OneDrive\Desktop\sql_python\chicago_crime_analysis_sql\data\ChicagoCensusData.csv')
census.to_sql("CENSUS_DATA", con, if_exists='replace', index=False,method="multi")
census

school = pandas.read_csv('C:\Users\aliza\OneDrive\Desktop\sql_python\chicago_crime_analysis_sql\data\ChicagoPublicSchools.csv')
school.to_sql("SCHOOL_DATA", con, if_exists='replace', index=False,method="multi")
school

crime = pandas.read_csv('C:\Users\aliza\OneDrive\Desktop\sql_python\chicago_crime_analysis_sql\data\ChicagoCrimeData.csv')
crime.to_sql("CRIME_DATA", con, if_exists='replace', index=False,method="multi")
crime


%sql sqlite:///FinalDB.db


#verify successful table creation

%sql SELECT name FROM sqlite_master WHERE type='table'




#Find the total number of crimes recorded

%sql select count(*) from CRIME_DATA 



#List community area names and numbers with per capita income less than 11000
%sql SELECT COMMUNITY_AREA_NUMBER, COMMUNITY_AREA_NAME FROM CENSUS_DATA WHERE PER_CAPITA_INCOME < 11000


#List all case numbers for crimes involving minors?(children are not considered minors for the purposes of crime analysis)
%%sql
SELECT CASE_NUMBER
FROM CRIME_DATA
WHERE DESCRIPTION LIKE '%MINOR%'


#List all kidnapping crimes involving a child?
%%sql
SELECT *
FROM CRIME_DATA
WHERE PRIMARY_TYPE = "KIDNAPPING"
AND DESCRIPTION LIKE "%CHILD%"

#List the kind of crimes that were recorded at schools. (No repetitions)
%%sql
SELECT DISTINCT PRIMARY_TYPE
FROM CRIME_DATA
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%'


#List the type of schools along with the average safety score for each type
%%sql
SELECT "Elementary, Middle, or High School", 
       AVG(Safety_Score) AS AVG_SAFETY_SCORE
FROM SCHOOL_DATA
GROUP BY "Elementary, Middle, or High School"



#List 5 community areas with highest % of households below poverty line
%%sql
SELECT COMMUNITY_AREA_NAME FROM CENSUS_DATA ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC LIMIT 5

#Which community area is most crime prone? Display the community area number only
%%sql
SELECT COMMUNITY_AREA_NUMBER
FROM CRIME_DATA
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY COUNT(*) DESC
LIMIT 1


#Use a sub-query to find the name of the community area with highest hardship index
%%sql
SELECT COMMUNITY_AREA_NAME
FROM CENSUS_DATA
WHERE HARDSHIP_INDEX IN(SELECT MAX(HARDSHIP_INDEX)
    FROM CENSUS_DATA)


#Use a sub-query to determine the Community Area Name with most number of crimes?
%%sql
SELECT COMMUNITY_AREA_NAME
FROM CENSUS_DATA
WHERE COMMUNITY_AREA_NUMBER IN
(
    SELECT COMMUNITY_AREA_NUMBER
    FROM CRIME_DATA
    GROUP BY COMMUNITY_AREA_NUMBER
    ORDER BY COUNT(*) DESC
    LIMIT 1
)























learned how to work with a real word dataset using SQL and Python. You learned how to query columns with spaces or special characters in their names and with mixed case names. You also used built in database functions and practiced how to sort, limit, and order result sets, as well as used sub-queries and worked with multiple tables.




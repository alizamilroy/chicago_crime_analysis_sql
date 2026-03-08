import pandas as pd
import sqlite3

con = sqlite3.connect("FinalDB.db")

census = pandas.read_csv('C:\Users\aliza\OneDrive\Desktop\sql_python\chicago_crime_analysis_sql\data\ChicagoCensusData.csv')
census.to_sql("CENSUS_DATA", con, if_exists='replace', index=False,method="multi")


school = pandas.read_csv('C:\Users\aliza\OneDrive\Desktop\sql_python\chicago_crime_analysis_sql\data\ChicagoPublicSchools.csv')
school.to_sql("SCHOOL_DATA", con, if_exists='replace', index=False,method="multi")


crime = pandas.read_csv('C:\Users\aliza\OneDrive\Desktop\sql_python\chicago_crime_analysis_sql\data\ChicagoCrimeData.csv')
crime.to_sql("CRIME_DATA", con, if_exists='replace', index=False,method="multi")

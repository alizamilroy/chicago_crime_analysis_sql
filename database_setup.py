import pandas as pd
import sqlite3

con = sqlite3.connect("FinalDB.db")

census = pd.read_csv("data/ChicagoCensusData.csv")
census.to_sql("CENSUS_DATA", con, if_exists="replace", index=False)

school = pd.read_csv("data/ChicagoPublicSchools.csv")
school.to_sql("SCHOOL_DATA", con, if_exists="replace", index=False)

crime = pd.read_csv("data/ChicagoCrimeData.csv")
crime.to_sql("CRIME_DATA", con, if_exists="replace", index=False)

print("Database created successfully.")
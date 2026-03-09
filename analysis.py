import pandas as pd
import sqlite3
import seaborn as sns
import matplotlib.pyplot as plt

#connect to databse
con = sqlite3.connect("FinalDB.db")

#store data as dataframe

crime_df = pd.read_sql("SELECT * FROM CRIME_DATA", con)
census_df = pd.read_sql("SELECT * FROM CENSUS_DATA", con)

print(crime_df.head())




# Question 1: Which community areas have the most crime?

crime_counts = pd.read_sql("""
SELECT COMMUNITY_AREA_NUMBER, COUNT(*) AS crime_count
FROM CRIME_DATA
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY crime_count DESC
""", con)

plt.figure(figsize=(10,6))

sns.barplot(
    x="COMMUNITY_AREA_NUMBER",
    y="crime_count",
    data=crime_counts
)

plt.title("Crime Counts by Community Area")
plt.xlabel("Community Area Number")
plt.ylabel("Number of Crimes")

plt.tight_layout()
plt.savefig("figures/crime_by_area.png")
plt.show()


# Question 2: What types of crimes occur most frequently?

crime_types = pd.read_sql("""
SELECT PRIMARY_TYPE, COUNT(*) AS crime_count
FROM CRIME_DATA
GROUP BY PRIMARY_TYPE
ORDER BY crime_count DESC
LIMIT 10
""", con)

plt.figure(figsize=(10,6))

sns.barplot(
    x="crime_count",
    y="PRIMARY_TYPE",
    data=crime_types
)

plt.title("Most Common Crime Types")
plt.xlabel("Number of Crimes")
plt.ylabel("Crime Type")

plt.tight_layout()
plt.savefig("figures/crime_types.png")
plt.show()


# Question 3: Do poorer areas experience more crime?

income_vs_crime = pd.read_sql("""
SELECT C.COMMUNITY_AREA_NUMBER,
       C.PER_CAPITA_INCOME,
       COUNT(CR.CASE_NUMBER) AS crime_count
FROM CENSUS_DATA C
JOIN CRIME_DATA CR
ON C.COMMUNITY_AREA_NUMBER = CR.COMMUNITY_AREA_NUMBER
GROUP BY C.COMMUNITY_AREA_NUMBER
""", con)

plt.figure(figsize=(10,6))

sns.scatterplot(
    x="PER_CAPITA_INCOME",
    y="crime_count",
    data=income_vs_crime
)

plt.title("Crime vs Income by Community Area")
plt.xlabel("Per Capita Income")
plt.ylabel("Crime Count")

plt.tight_layout()
plt.savefig("figures/crime_vs_income.png")
plt.show()

con.close()





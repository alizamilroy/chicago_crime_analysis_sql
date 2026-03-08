
-- Total number of crimes recorded
%sql select count(*) from CRIME_DATA 


-- Community area names and numbers with per capita income less than 11000
%sql SELECT COMMUNITY_AREA_NUMBER, COMMUNITY_AREA_NAME FROM CENSUS_DATA WHERE PER_CAPITA_INCOME < 11000


-- Case numbers for crimes involving minors (children are not considered minors for the purposes of this analysis)
%%sql
SELECT CASE_NUMBER
FROM CRIME_DATA
WHERE DESCRIPTION LIKE '%MINOR%'


-- Kidnapping crimes involving a child
%%sql
SELECT *
FROM CRIME_DATA
WHERE PRIMARY_TYPE = "KIDNAPPING"
AND DESCRIPTION LIKE "%CHILD%"


-- Types of crimes that were recorded at schools
%%sql
SELECT DISTINCT PRIMARY_TYPE
FROM CRIME_DATA
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%'


-- Type of schools along with the average safety score for each type
%%sql
SELECT "Elementary, Middle, or High School", 
       AVG(Safety_Score) AS AVG_SAFETY_SCORE
FROM SCHOOL_DATA
GROUP BY "Elementary, Middle, or High School"


-- Five community areas with highest % of households below poverty line
%%sql
SELECT COMMUNITY_AREA_NAME FROM CENSUS_DATA ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC LIMIT 5


-- Which community area is most crime prone? 
%%sql
SELECT COMMUNITY_AREA_NUMBER
FROM CRIME_DATA
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY COUNT(*) DESC
LIMIT 1


-- Community area with highest hardship index
%%sql
SELECT COMMUNITY_AREA_NAME
FROM CENSUS_DATA
WHERE HARDSHIP_INDEX IN(SELECT MAX(HARDSHIP_INDEX)
    FROM CENSUS_DATA)


-- Community Area Name with most number of crimes?
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



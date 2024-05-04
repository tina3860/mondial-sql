--Q1. Select the country code of the country, followed by the province that the city is in, along with the city name and find the city or cities with the highest population.--

Select * 
From Country country
Inner Join City city on country.Province = city.Province

Select Country.Code AS country_code, Country.Capital AS country_capital, City.Name AS city_name, MAX(city.population) AS population
From Country country 
Inner Join City city on country.Capital = city.Name

Group by country.Code, country.Capital, city.Name
Order by population desc




--Q2 part A. Pull each country together with the count of neighboring countries. For simplicity exclude the countries that have no neighbors. Your resulting Select clause should have the country code, followed by the count of neighboring countries.--

Select * 
From borders

Select * 
From Country

--Final Answer--
Select Country.Name as CountryName, country.Code as CountryCode, COUNT(country1) as num_bordering_countires
From Country country
Inner Join borders borders on country.Code = borders.Country1

Group by country.Name, country.Code
Order by num_bordering_countires desc

--Q2 part b. Now also include the countries with no neighbors. Hint: Use an outer join. Select the country code of the country followed by the count of neighboring countries.--

Select Country.Name as CountryName, country.Code as CountryCode, COUNT(Country2) as num_bordering_countires
From Country country
Full Outer Join borders borders on country.Code = borders.Country1

Group by country.Name, country.Code
Order by num_bordering_countires desc



--Q3. List the name and percentage of all the ethnic groups in the United States such that the percentage of the population of each of the ethnic group is lower than the average percentage across all ethnic groups in the United States?--

Select *
From EthnicGroup

--To view all the data in the USA--
Select *
From EthnicGroup
Where Country = 'USA'
Order by Percentage desc

--Calculate the avg ethnic percentage in the USA. Results should be less than 3.746%--
Select AVG(percentage) as avg_percentage
From EthnicGroup
Where Country = 'USA'

--Final Answer--
Select Name as EthnicGroup, Percentage
From EthnicGroup
Where Country = 'USA'
AND Percentage < (select AVG(percentage) as AvgUSAEthnicPercentage from EthnicGroup where Country = 'USA')

Group by name, Percentage
Order by Percentage desc 



--Q4. Which African countries have an inflation rate that is greater than or equal to the average across all African countries? List the country and the inflation rate--

Select * 
From Economy

Select *
From encompasses

--View all data in Africa in the encompasses table to see which countries are in Africa--
Select *
From encompasses
Where Continent = 'Africa'

--inflation rate in all african countries--
Select economy.Country as African_Countries, Economy.Inflation as Inflation_Rate
From Economy economy 
Inner Join encompasses encompasses on economy.Country = encompasses.Country
Where Continent = 'Africa'
AND Inflation IS NOT NULL
Order by Inflation_Rate desc 

--avg inflation rate in all african countries. Results >= 5.89--
Select AVG(inflation) as AvgInflation
From Economy economy
Inner Join encompasses encompasses on economy.Country = encompasses.Country
Where Continent = 'Africa'

--Final Answer--
Select Economy.Country as African_Countries, Economy.Inflation as Inflation_Rate 
From Economy economy
Inner Join encompasses encompasses on economy.Country = encompasses.Country
Where Continent = 'Africa'
AND Inflation >= (Select AVG(inflation) as AvgInflation From Economy economy Inner Join encompasses encompasses on economy.Country = encompasses.Country Where Continent = 'Africa')

Group By economy.Country, economy.Inflation
Order by Inflation_Rate desc 




-- Q5.  Provide a list of all pairs of countries that are members of the same organizations. List each pair (A, B) only once by including only (A, B) but not the symmetric pair (B, A) in the result (hint: use "<" to compare the strings). Exclude countries that are members of no organizations. Select the pair of country codes. --

Select *
From organization

Select *
From isMember

Select distinct org.country as HQ_Country, mem.country as MemberCountry
From Organization org 
Inner Join isMember mem on org.Abbreviation = mem.Organization

Where 
org.Country IS NOT NULL
AND mem.Type = 'member'
AND org.Country < mem.Country

Order by org.Country asc 
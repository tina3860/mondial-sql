# mondial-sql
Mondial Dataset SQL Analysis 
Youtube Explanation: https://youtu.be/naO43Crytjw


# About This Project

This project demonstrates my ability to build and query a relational database using SQL Server Management Studio (SSMS). I created and populated the **Mondial** database from provided schema and input scripts, then wrote SQL queries to answer analysis questions using joins, grouping, subqueries, and filtering logic. The work emphasizes correct table relationships, validating outputs, and troubleshooting query issues to ensure accurate results.

---

# Project Summary – Mondial SQL Midterm (SSMS)

## Overview

In this project, I created the *Mondial* database in **SQL Server Management Studio**, loaded the schema and data, and solved five SQL questions requiring multi-table joins, aggregations, subqueries, and data validation. The analysis focuses on extracting meaningful results from relational data (countries, cities, borders, ethnic groups, economic indicators, and organizations) while handling duplicates and null values.

---

## Tools Used

* SQL Server Management Studio (SSMS)
* SQL (joins, group by, aggregates, subqueries, filters)
* Mondial relational dataset (schema + data scripts)

---

## Database Setup (ETL Process in SSMS)

1. Opened the input and schema SQL scripts in SSMS
2. Created a new database using:

   * `CREATE DATABASE mondial;`
3. Executed schema script to create tables
4. Executed input script to insert dataset values
5. Verified correct load by querying core tables (ex: `SELECT * FROM City`)

---

## Queries & Key Results

### 1) Highest population city (with country + province)

Goal: Return the **country code**, **province**, and **city name** for the city with the **highest population**.

Approach:

* Joined **City** and **Country**
* Validated relationships using schema diagram
* Fixed duplicates by correcting join logic using capital-related relationship rules

Result:

* **Beijing** was identified as the highest population city.

---

### 2) Count bordering countries (neighbor counts)

Goal: List each country with its **count of neighboring countries** and exclude countries with no neighbors.

Approach:

* Started with `Borders` table
* Realized borders table only includes countries with neighbors
* Joined `Country` → `Borders` to ensure correct neighbor counts
* Used **inner join** (exclude no-neighbor countries) and **outer join** for validation including all countries

Outcome:

* Produced a clean table showing each country code and its number of borders
* Confirmed countries like **Cuba** appear only when using outer join logic (correct validation step)

---

### 3) US ethnic groups below the US average

Goal: List ethnic groups in the **United States** where the group percentage is **below the US average**.

Approach:

* Filtered `EthnicGroup` to USA
* Calculated average percent using a subquery
* Returned results where `Percentage < AVG(Percentage)` (USA-specific)

Result:

* Returned **18 ethnic groups**, ordered by percent descending.

---

### 4) African countries with inflation >= Africa average

Goal: Identify African countries where inflation is **greater than or equal** to the average inflation across African countries.

Approach:

* Used `Encompasses` to filter **Africa** (continent classification)
* Joined `Economy` + `Encompasses`
* Excluded null inflation rates
* Computed average inflation using a subquery

Debugging highlight:

* Initially got incorrect countries included (below average inflation)
* Fixed by adding the same `Encompasses` join inside the **subquery** to correctly calculate Africa-only average

Result:

* Corrected list of African countries with inflation **>= 5.89 average**.

---

### 5) Country pairs in the same organization (AB only once)

Goal: List all pairs of countries that belong to the **same organization**, listing each pair **only once** (AB but not BA), excluding countries with no org memberships.

Approach:

* Worked with `Organization` and `IsMember`
* Identified join key: **abbreviation**
* Filtered out null organization values
* Used ordering constraint like:

  * `MemberA.Country < MemberB.Country` to enforce AB-only output

Outcome:

* Produced unique country pairs based on shared organizational membership.

---

## Key Skills Demonstrated

* Database creation + loading SQL schema/data scripts
* Understanding relational schemas and table relationships
* Building correct joins (inner vs outer join use cases)
* Aggregations: `COUNT()`, `AVG()`, `MAX()`
* Subquery filtering and correcting logic errors
* Null-handling + validation techniques
* Producing clean query outputs with clear column naming

---

## Notes / Assumptions

* Focus was on correct relational querying and validation
* Null values were handled explicitly (ex: inflation rates)
* For organization pairing, symmetric duplicates were removed using ordering logic (AB only)



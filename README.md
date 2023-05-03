# Background & Objective
This project was built to illustrate a basic implementation of **E**xtract-**L**oad-**T**ransform (ETL) using data taken from the [politics & war game](https://politicsandwar.com/), with the end goal of using the data gathered to create analyses and generate visualizations. Having played this game for quite a while, I was particularly interested in extracting key metrics regarding the state of the in-game world. Wanting to stray from already existing avenues provided by the game or the community, I decided to gradually build my own as practice for future projects with these technologies.
# Data Sources
All the data I need for now comes from the V3 GraphQL API. Important resources for locating and testing endpoints can be found on the pnwkit-py repository and [documentation](https://docs.pnwkit-py.mrvillage.dev/en/latest/index.html) as well the [API playground](https://api.politicsandwar.com/graphql-playground).
# Schema ERD
![Schema ERD](https://github.com/Franklin-Muhuni/Nation-Sim-ETL-Project/blob/main/PnWDB%20ER%20Diagram.png?raw=true)
# Extract
Using the pnwkit-py module I was able to query for specific attributes for each of the endpoints called, which saved the need for dropping any unnecessary data from the tables. So far I focussed on the following fields:
- Alliances
- Nations
- Cities
- Treaties
# Transformation
The data had been appended to empty dictionaries that were converted into dataframes and the columns datatypes were modified to more appropriate formats. Initial dataframes consisted of information related to over 47K+ simulated nations, but roughly 37K of them were excluded from the final sets to conform to integrity constraints in the database. I intend to amend this in the future as null values and inconsistencies in the data have not been accounted for in the script.
# Load
This step involved using SQLAlchemy to connect to SQL Server and writing the records within the finalized dataframes to a local database consisting of matching tables and columns. See the schema ERD.
# Next Steps
The project's basic foundation is complete but several points of improvement or advancement include:
- Modify the script to load all the data extracted from the API.
- Deploy the database to the cloud.
- Write exploratory queries and begin analysis.

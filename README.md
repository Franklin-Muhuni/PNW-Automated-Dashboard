# Background & Objective
This project was built to illustrate a basic implementation of **E**xtract-**T**ransform-**L**oad (ETL) using data taken from the [politics & war game](https://politicsandwar.com/), with the end goal of using the data gathered to create analyses and generate visualizations. Having played this game for quite a while, I was particularly interested in extracting key metrics regarding the state of the in-game world. Wanting to stray from already existing avenues provided by the game or the community, I decided to gradually build my own as practice for future projects with these technologies.
# Data Sources
All the data I need for now comes from the V3 GraphQL API. Important resources for locating and testing endpoints can be found on the pnwkit-py repository and [documentation](https://docs.pnwkit-py.mrvillage.dev/en/latest/index.html) as well the [API playground](https://api.politicsandwar.com/graphql-playground).
# Schema ERD
![Schema ERD](https://github.com/Franklin-Muhuni/Nation-Sim-ETL-Project/blob/main/SQL/Schema%20ERD.png?raw=true)
# Extract
Using the pnwkit-py module I was able to query for specific attributes for each of the endpoints called, which saved the need for dropping any unnecessary data from the tables. So far I focused on the following fields:
- Alliances
- Nations
- Cities
- Treaties
# Transform
The data didn't require much cleaning and was appended to dictionaries and converted into dataframes. Initial dataframes consisted of information related to over 47 thousand simulated nations, but roughly only 10 thousand were included in the final sets as most were found to come from inactive accounts. At the moment only about 5 to 6 thousand nations are active and generate relevant data.
# Load
This step involved using SQLAlchemy to connect to SQL Server and writing the records within the finalized dataframes to a local database consisting of matching tables and columns. See the schema ERD.
# Dashboard
Data was queried and aggregated in this step to create table views that were imported into Power BI to be used in the construction of the data model. 

![Dashboard IMG](https://i.imgur.com/7CiGpI2.png)
# Next Steps
The project is nearly complete, and nearly all relevant data is in use. The following tasks remain:
- Gathering daily historical data to be plotted in the finalized dashboard.

# Dashboard-with-Docker-and-Metabase

Building a Dashboard with Metabase and Docker Compose. The dashboard summurizes data from the "Nothwind Traders" company.

![](dashboard.gif)

## Project description
A Postgres database was first created locally. The pg_dump file from this database was later used to load the data in the Docker Postgres container.

The docker-compose.yml file is running two containers - the Postgres container that contains the nordwind database and the Metabase dashboard that runs in a separate container.

## Usage:
Run *docker-compose up* and go to your browser on http://localhost:3000. You should see the Metabase
welcome screen. Sign in and start working with the data.

## Keywords
- Docker
- Postgres
- SQL
- Metabase

The data can be found here:

https://github.com/pawlodkowski/northwind_data_clean


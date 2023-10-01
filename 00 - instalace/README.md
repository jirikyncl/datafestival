# Instalace pgAdmin - databázový klient

Stáhnout a nainstalovat: https://www.pgadmin.org/download/

# Databáze

Spustíme **lokálně** přes docker - je připravený image `kyncl/datafestival-postgis` - https://hub.docker.com/r/kyncl/datafestival-postgis 
nebo využijeme připravenou databázi na **AWS či Azure cloudu**.

## Docker

- host: localhost
- port: 5432
- user: datafestival
- pass: Datafestival.2023
- dbname: datafestival

Spustit příkazem: `sudo docker run --name "datafestival-postgis" -p 5432:5432 -d -t kyncl/datafestival-postgis:latest`

Připojení: [docker.png](docker.png)

## Azure

- host: datafestival-postgis.postgres.database.azure.com
- port: 5432
- user: test@datafestival-postgis
- pass: Datafestival.2023
- dbname: postgres

Připojení: [azure.png](azure.png)

## AWS

- host: ec2-3-72-76-19.eu-central-1.compute.amazonaws.com
- port: 5432
- user: test
- pass: Datafestival.2023
- dbname: datafestival

Připojení: [aws.png](aws.png)

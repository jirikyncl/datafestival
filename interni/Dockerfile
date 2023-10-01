FROM kartoza/postgis:13.0

ENV POSTGRES_DBNAME=datafestival
ENV POSTGRES_PASS=Datafestival.2023
ENV POSTGRES_USER=datafestival

COPY base_data.sql /docker-entrypoint-initdb.d/base_data.sql

CMD ["postgres"]

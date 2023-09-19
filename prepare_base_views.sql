set search_path to df, common, public;

set max_parallel_workers_per_gather = 8;
set max_parallel_workers = 16;

drop view if exists df.crime_view;

create view crime_view as
select
    m.code,
    m.name,
    st_transform(m.definition_point, 4326) definition_point,
    st_transform(m.coordinates, 4326) coordinates,
    c.crime_count,
    c.year,
    p.person_count
from
    (
        select
             municipality_code,
             sum(crime_18_count) crime_count,
             "year"
        from crime group by municipality_code, "year"
    ) c
    join municipality m on c.municipality_code = m.code
    join population p on c.municipality_code = p.municipality_code and c.year = p.year;

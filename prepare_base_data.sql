set search_path to df, common, public;

set max_parallel_workers_per_gather = 8;
set max_parallel_workers = 16;

drop table if exists df.crime;
drop table if exists df.municipality;
drop table if exists df.population;

-- CRIME

create table crime as
select
    -- obec
    m.code municipality_code,

    -- cas
    extract(year from cm.measure_date) "year",
    extract(month from cm.measure_date) "month",

    -- trestne ciny celkem
    count(distinct cm.code) filter (where not 97 = any(cm.type)) crime_count,

    -- rozpad trestnych cinu
    count(*) filter (where 1 = any(cm.type) and not 97 = any(cm.type)) crime_1_count,
    count(*) filter (where 13 = any(cm.type) and not 97 = any(cm.type)) crime_13_count,
    count(*) filter (where 18 = any(cm.type) and not 97 = any(cm.type)) crime_18_count,
    count(*) filter (where 35 = any(cm.type) and not 97 = any(cm.type)) crime_35_count,
    count(*) filter (where 54 = any(cm.type) and not 97 = any(cm.type)) crime_54_count,
    count(*) filter (where 55 = any(cm.type) and not 97 = any(cm.type)) crime_55_count,
    count(*) filter (where 63 = any(cm.type) and not 97 = any(cm.type)) crime_63_count,
    count(*) filter (where 79 = any(cm.type) and not 97 = any(cm.type)) crime_79_count,
    count(*) filter (where 80 = any(cm.type) and not 97 = any(cm.type)) crime_80_count,
    count(*) filter (where 84 = any(cm.type) and not 97 = any(cm.type)) crime_84_count,
    count(*) filter (where 96 = any(cm.type) and not 97 = any(cm.type)) crime_96_count,

    -- prestupky celkem
    count(*) filter (where 97 = any(cm.type)) crime_97_count
from crime_map_data_2 cm
         join municipality m on st_contains(m.coordinates, cm.definition_point)
where cm.relevance in (1, 4) and cm.state not in (5, 6, 7)
group by
    m.code,
    extract(year from cm.measure_date),
    extract(month from cm.measure_date)
;

create index crime_municipality_code on crime (municipality_code);
create index crime_year on crime (year);

-- MUNICIPALITY

create table municipality as
select code, name, definition_point, coordinates from municipality;

create index municipality_municipality_code on municipality (code);

-- POPULATION

create table population as
select municipality_code, (man_count + woman_count) person_count, year from population_base;

create index population_municipality_code on population (municipality_code);
create index population_year on population (year);


set max_parallel_workers_per_gather = 8;
set max_parallel_workers = 16;

drop table if exists crime;
drop table if exists district;
drop table if exists population;

-- CRIME

create table crime as
    select
        -- obec
        d.code district_code,

        -- cas
        extract(year from cm.measure_date) "year",

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
    from common.crime_map_data_2 cm
    join common.district d on st_contains(d.coordinates, cm.definition_point)
    where cm.relevance in (1, 4) and cm.state not in (5, 6, 7)
    group by
        d.code,
        extract(year from cm.measure_date)
;

create index crime_district_code on crime (district_code);
create index crime_year on crime (year);

-- DISTRICT

create table district as
    select code, name, st_transform(definition_point, 4326) definition_point, st_transform(st_simplify(coordinates, 500), 4326) coordinates from common.district;

create index district_district_code on district (code);

-- POPULATION

create table population as
    select m.district_code, sum(man_count + woman_count) person_count, year
    from common.population_base pb
    join common.municipality m on m.code = pb.municipality_code
    group by m.district_code, year;

create index population_district_code on population (district_code);
create index population_year on population (year);


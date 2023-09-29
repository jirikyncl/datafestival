set max_parallel_workers_per_gather = 8;
set max_parallel_workers = 16;

drop table if exists crime;
drop table if exists district;
drop table if exists population;
drop table if exists unemployment;

-- CRIME

create table crime as
    select
        row_number() over () AS id,
        st_transform(definition_point, 4326) definition_point,
        count(*) crime_count,
        extract(year from cm.measure_date) "year"
    from common.crime_map_data_2 cm
    where
        cm.relevance in (1, 4)
        and cm.state not in (5, 6, 7)
        and 35 = any(cm.type) and not 97 = any(cm.type) -- kradeze TC
    group by
        cm.definition_point,
        extract(year from cm.measure_date)
;

alter table crime add primary key (id);

create index crime_district_definition_point on crime USING GIST (definition_point);
create index crime_year on crime (year);

-- DISTRICT

create table district as
    select row_number() over () AS id, code, name, st_transform(definition_point, 4326) definition_point, st_transform(st_simplify(coordinates, 500), 4326) coordinates from common.district;

alter table district add primary key (id);
create index district_district_code on district (code);
create index district_coordinates on district USING GIST (coordinates);

-- POPULATION

create table population as
    select row_number() over () AS id, m.district_code, sum(man_count + woman_count) person_count, year
    from common.population_base pb
    join common.municipality m on m.code = pb.municipality_code
    group by m.district_code, year;

alter table population add primary key (id);
create index population_district_code on population (district_code);
create index population_year on population (year);

-- UNEMPLOYMENT
create table unemployment as
    select
        row_number() over () AS id,
        avg(u.unemployment_percentage) unemployment_percentage,
        extract(year from u.measure_date) "year",
        m.district_code
    from common.population_unemployment u
    join common.municipality m on m.code = u.municipality_code
    group by m.district_code, extract(year from u.measure_date);

create index unemployment_district_code on unemployment (district_code);
create index unemployment_year on unemployment (year);
alter table unemployment add primary key (id);

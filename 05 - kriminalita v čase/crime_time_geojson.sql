with crime_view as (
    select
        c.crime_35_count crime_count,
        c.year,
        d.code district_code,
        d.name,
        d.definition_point,
        d.coordinates,
        p.person_count,
        (crime_count::numeric / person_count::numeric) rate,
        ntile(4) over (order by (crime_count::numeric / person_count::numeric)) as quartile
    from district d
    left join crime c on c.district_code = d.code
    left join population p on c.district_code = p.district_code and c.year = p.year
    where c.year > 2015 and c.year < 2023
)

select json_build_object(
   'type', 'FeatureCollection',
   'features', json_agg(
       json_build_object(
           'type', 'Feature',
           'geometry', st_asgeojson(definition_point)::json,
           'properties', json_build_object(
               'code', district_code,
               'name', name,
               'quartile', quartile,
               'rate', rate,
               'year', "year"
           )
       )
    )
) as feature_collection from crime_view cv

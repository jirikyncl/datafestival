with crime_view as (
    select
        c.crime_35_count crime_count,
        d.code district_code,
        d.name,
        d.definition_point,
        d.coordinates,
        p.person_count
    from district d
    left join crime c on c.district_code = d.code
    left join population p on c.district_code = p.district_code and c.year = p.year
    where c.year = 2022
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
                           'crime_count', crime_count,
                           'person_count', person_count
                       )
               )
       )
) as feature_collection from crime_view cv

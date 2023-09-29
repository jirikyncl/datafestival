with crime_view as (
    select
        sum(c.crime_count) crime_count,
        d.code,
        d.name,
        d.definition_point
    from district d
    left join crime c on st_contains(d.coordinates, c.definition_point)
    where c.year = 2022
    group by d.id
)

select json_build_object(
   'type', 'FeatureCollection',
   'features', json_agg(
           json_build_object(
                   'type', 'Feature',
                   'geometry', st_asgeojson(definition_point)::json,
                   'properties', json_build_object(
                           'code', code,
                           'name', name,
                           'crime_count', crime_count
                       )
               )
       )
) as feature_collection from crime_view cv

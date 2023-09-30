with crime_view as (
    select
        d.code,
        d.name,
        d.definition_point,
        [TODO],
        ntile(4) over (order by (sum(c.crime_count) / p.person_count)) as category
    from district d
    left join crime c on st_contains(d.coordinates, c.definition_point)
    left join population p on d.code = p.district_code and c.year = p.year
    where c.year = 2022
    group by [TODO]
)

select json_build_object(
   'type', 'FeatureCollection',
   'features', json_agg(
       json_build_object(
           'type', 'Feature',
           'geometry', st_asgeojson(coordinates)::json,
           'properties', json_build_object(
               'code', code,
               'name', name,
               'category', category
           )
       )
    )
) as feature_collection from crime_view cv

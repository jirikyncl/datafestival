with crime_view as (
    select
        d.code,
        d.name,
        d.definition_point,
        d.coordinates,
        ntile(4) over (order by (sum(c.crime_count)::numeric / sum(p.person_count)::numeric)) as quartile
    from district d
    left join crime c on st_contains(d.coordinates, c.definition_point)
    left join population p on d.code = p.district_code and c.year = p.year
    where c.year = 2022
    group by d.id
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
               'quartile', quartile
           )
       )
    )
) as feature_collection from crime_view cv

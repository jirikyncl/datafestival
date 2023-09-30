with crime_view as (
    select
        d.code,
        d.name,
        d.definition_point,
        d.coordinates,
        ntile(4) over (order by (sum(c.crime_count) / p.person_count)) as category,
        avg(unemployment_percentage) unemployment_percentage
    from district d
    left join crime c on [TODO]
    left join population p on d.code = p.district_code and c.year = p.year
    left join unemployment u on [TODO]
    where c.year = 2022
    group by d.id, p.id
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
               'category', [TODO],
               'unemployment_percentage', unemployment_percentage,
               'definition_point', st_asgeojson(definition_point)::json
           )
       )
   )
) as feature_collection from crime_view cv

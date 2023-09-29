select
    sum(c.crime_count) crime_count,
    d.code,
    d.name,
    d.coordinates
from district d
left join crime c on st_contains(d.coordinates, c.definition_point)
where c.year = 2022
group by d.id

select
    d.code,
    d.name,
    d.definition_point,
    d.coordinates,
    ntile(4) over (order by (sum(c.crime_count) / p.person_count)) as category,
    avg(unemployment_percentage) unemployment_percentage
from district d
    left join crime c on st_contains(d.coordinates, c.definition_point)
    left join population p on d.code = p.district_code and c.year = p.year
    left join unemployment u on d.code = u.district_code and c.year = u.year
where c.year = 2022
group by d.id, p.id

select
    d.code,
    d.name,
    d.definition_point,
    c.year,
    (sum(c.crime_count) / p.person_count) crime_person_rate
from district d
left join crime c on st_contains(d.coordinates, c.definition_point)
left join population p on d.code = p.district_code and c.year = p.year
where c.year > 2015 and c.year < 2023
group by d.id, p.id, c.year

select
    c.crime_35_count crime_count,
    d.code district_code,
    d.name,
    d.definition_point,
    d.coordinates
from district d
left join crime c on c.district_code = d.code
where c.year = 2022

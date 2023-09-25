select
    c.crime_35_count crime_count,
    d.code district_code,
    d.name,
    d.definition_point,
    d.coordinates,
    p.person_count,
    ntile(4) over (order by (crime_count::numeric / person_count::numeric)) as quartile
from district d
left join crime c on c.district_code = d.code
left join population p on c.district_code = p.district_code and c.year = p.year
where c.year = 2022

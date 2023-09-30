# 02 - prostorové dotazy

Cíl: Seznámit se s PostGIS prostorovými dotazy

Rozšíření databáze PostGIS poskytuje funkcionalitu pro práci s prostorovými daty. Často potřebujeme zjistit
kolik něčeho je uvnitř polygonu, s čím polygon sousedí, jak je velký...

https://postgis.net/docs/manual-1.5/ch08.html

Vypsání geometrie:

select st_astext(definition_point), name from district;

Plocha: 

select st_area(coordinates, true), name from district;

Obvod:

select st_perimeter(coordinates, true), name from district;

Obálka

select st_envelope(coordinates), name from district;

Sousedé:

select d1.name, count(*) neighbours
from district d1
left join district d2 on st_intersects(d1.coordinates, d2.coordinates)
group by d1.id

Vzdálenost:

select d1.name, avg(st_distance(d1.definition_point, d2.definition_point, true)) avg_distance
from district d1
left join district d2 on st_intersects(d1.coordinates, d2.coordinates)
group by d1.id

Obsahuje: 

select d.name, sum(crime_count) crime_count
from district d
left join crime c on st_contains(d.coordinates, c.definition_point)
group by d.id

Převod geometrie na GeoJSON:

select st_asgeojson(definition_point), name from district;

Převod geometrie na GML:

select st_asgml(definition_point), name from district;


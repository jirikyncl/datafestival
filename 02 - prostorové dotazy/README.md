# 02 - prostorové dotazy

**Cíl:** Seznámit se s PostGIS prostorovými dotazy

Rozšíření databáze PostGIS poskytuje funkcionalitu pro práci s prostorovými daty. Často potřebujeme zjistit
kolik něčeho je uvnitř polygonu, s čím polygon sousedí, jak je velký...

https://postgis.net/docs/manual-1.5/ch08.html

#### Vypsání geometrie:

`select st_astext(definition_point), name from district;`

#### Plocha: 

`select st_area(coordinates, true), name from district;`

#### Obvod:

`select st_perimeter(coordinates, true), name from district;`

#### Obálka

`select st_envelope(coordinates), name from district;`

#### Sousedé:

<code>select d1.name, count(*) neighbours<br>
from district d1<br>
left join district d2 on st_intersects(d1.coordinates, d2.coordinates)<br>
group by d1.id</code>

#### Vzdálenost:

<code>select d1.name, avg(st_distance(d1.definition_point, d2.definition_point, true)) avg_distance<br>
from district d1<br>
left join district d2 on st_intersects(d1.coordinates, d2.coordinates)<br>
group by d1.id</code>

#### Obsahuje: 

<code>select d.name, sum(crime_count) crime_count<br>
from district d<br>
left join crime c on st_contains(d.coordinates, c.definition_point)<br>
group by d.id</code>

#### Převod geometrie na GeoJSON:

`select st_asgeojson(definition_point), name from district;`

#### Převod geometrie na GML:

`select st_asgml(definition_point), name from district;`


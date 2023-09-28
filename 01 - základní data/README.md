# 01 - základní data

Cíl: Seznámení s datovými sadami.

## Data

Máme tři základní datové sady:
- district (okres)
- population (obyvatelstvo)
- crime (kriminalita)

Vyzkoušíme postupně:

select * from district;
select * from population;
select * from crime;

Kriminalita crime_id_count, kde id je:

- 1  - TČ - Násilná
- 13 - TČ - Požáry
- 18 - TČ - Vloupání
- 35 - TČ - Krádeže
- 54 - TČ - Podvody
- 55 - TČ - Jiná majetková
- 63 - TČ - Obecná
- 79 - TČ - Dopravní nehody
- 80 - TČ - Toxikománie
- 84 - TČ - Trestná činnost se zbraní
- 96 - TČ - Extremismus
- 97      - Přestupky

TODO - vizualizace relaci tabulek?

## Zobrazení dat

- Excel like editor
- Databázový klient

## Zobrazení geometrie

- databázový klient - select * from ...
- GeoJSON - jeden ze standardů (GML, KML, Spatial CSV, ...) třeba zde: https://geojson.tools/ (výstup help/district_point_geojson.json)
- district.html - rozumí CSV (spatial) i GeoJSON























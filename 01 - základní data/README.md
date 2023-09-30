# 01 - základní data

Cíl: Seznámení se s datovými sadami.

## Zdroje dat

- Okresy: https://vdp.cuzk.cz/vdp/ruian/vymennyformat (https://vdp.cuzk.cz/vdp/ruian/vymennyformat?crKopie=on&casovyRozsah=U&upStatAzZsj=on&uzemniPrvky=ST&dsKompletni=on&datovaSada=K&vyZakladniAOrigHranice=on&vyber=vyZakladniAOrigHranice&search=)
- Kriminalita: https://kriminalita.policie.cz/
- Populace: https://www.czso.cz/csu/czso/obyvatelstvo-k-3112-podle-pohlavi-v-obcich
- Nezaměstnanost: https://www.czso.cz/csu/czso/uchazeci-o-zamestnani-dosazitelni-a-podil-nezamestnanych-osob-podle-obci_090417

- Formáty XML, JSON, CSV.
- Vždy je potřeba ze zdroje vybrat jen to podstatné (filtrování) a opravit případné chyby a normalizovat (převedení na společný formát - databáze). Workflow. Zpracováním různých formátů a zdrojů se bavíme v G-Tix s.r.o.
- Pro účely tohoto workshopu jsme z těchto zdrojů připravili data s ohledem na okresy (agregace).
- Původně bylo v plánu členění po obcích, ale práci by to komplikovalo, zároveň data kriminality se týkají pouze trestných činů krádeže.

### Příklad zpracování populace
- stažení, rozbalení
- odfiltrování sloupců, které jsou k jinému členění než okres
- uložení do databáze

## Data

Máme tři základní datové sady:
- district (okres) - okresy mají jméno, hranice a centrum
- population (obyvatelstvo) - počty obyvatel ke každému okresu po rocích 
- crime (kriminalita) - počty trestných činů krádeží po rocích různě rozmístěné po ČR
- unemployment (nezaměstnanost) - průměrná roční nezaměstnanost ke každému okresu 

jak to vypadá - data.png

Vyzkoušíme postupně:

select * from district;
select * from population;
select * from crime;
select * from unemployment;

## Jednoduché zobrazení dat

- Excel like editor (viz csv v 00-instalace)
- Databázový klient (select * from ...)

## Zobrazení geometrie ve webové aplikaci

Pomocí GeoJSON - jeden ze standardů (GML, KML, Spatial CSV, ...) 
Struktura GeoJSON je jednoduchá:
- Feature
- Geometry
- Properties

### Vytvoření GeoJSON

Chceme zobrazit body nebo souřadnice okresů v mapě:
- district_point_geojson.sql
- district_coord_geojson.sql

(výstup ve složce help)

### Zobrazení GeoJSON

- třeba zde: https://geojson.tools/
- district.html - rozumí CSV (spatial) i GeoJSON























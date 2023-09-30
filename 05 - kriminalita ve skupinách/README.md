# Kriminalita ve skupinách

Cíl: Roztřídit okresy podle relativní kriminality do čtyřech skupin a zobrazit je barevně v mapě.

## Roztřídění do skupin

Potřebujeme doplnit sql dotaz crime_class_geojson.sql tak, aby obsahoval kvartily poměru trestných činů ku počtu obyvatel v okrese za rok 2022.

Vyexportujeme GeoJSON a zobrazíme.

## Zobrazení skupin

- pomocí barev polygonů v Leaflet - crime_class.html

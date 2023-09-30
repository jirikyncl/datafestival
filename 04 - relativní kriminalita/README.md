# 03 - Relativní kriminalita

Cíl: Vztáhnout údaje o kriminalitě k počtu obyvatel a použít další typy vizualizace.

## Propojení kriminality, okresů a počtu obyvatel

Potřebujeme dopnit sql dotaz crime_relative_point_geojson.sql tak, aby jsme ke každému okresu dostali počet trestných činů za rok 2022 a k tomu pro každý okres měli k dispozici i počet obyvatel.

Vyexportujeme jako GeoJSON.


## Vizualizace relativního počtu TČ

tj. kolik trestných činů připadá na jednoho obyvatele okresu (počet trestných činů / počet obyvatel)

- pomocí velikosti Leaflet - crime_relative_size.html
- pomocí sloupců - Azure maps - crime_relative_bar.html
- pomocí heatmap - Azure maps - crime_relative_heatmap.html



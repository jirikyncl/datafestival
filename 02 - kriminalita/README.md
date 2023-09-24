# Kriminalita

Cíl: Zobrazení kriminality (35 - krádeže) v absolutních číslech po okresech za rok 2022

## Propojení údajů o kriminalitě s okresem

Pustíme: crime_relative.sql
Vyexportujeme jako GeoJSON: crime_relative_point_geojson.sql (klidně zase zobrazíme https://geojson.tools/) (výstup help/crime_point_geojson.json)

Co tomu chybí? Vizuální informace o počtu TČ. Něco, z čeho si na první pohled uděláme 
obrázek o situaci - podstata vizualizace dat.

## Vizualizace počtu TČ

- Získaný GeoJSON uložíme.
- Máme připravenou HTML stránku crime_circle_size.html, kde pomocí JS knihovny Leaflet zobrazíme okresy, velikostí naznačíme počet TČ.

Místo velikosti jsme mohli použít také barvu, tvar, ikonu: 

- Vizualizace pomocí barev a velikosti: crime_color.html












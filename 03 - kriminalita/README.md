# Kriminalita

Cíl: Zobrazení kriminality (krádeží) v absolutních číslech po okresech za rok 2022

## Propojení údajů o kriminalitě s okresem

Potřebujeme dopnit sql dotaz crime_point_geojson.sql tak, aby jsme ke každému okresu dostali počet trestných činů za rok 2022.

Vyexportujeme jako GeoJSON a zobrazíme klidně zase https://geojson.tools/

Co tomu chybí? Vizuální informace o počtu TČ. Něco, z čeho si na první pohled uděláme 
obrázek o situaci - podstata vizualizace dat.

## Vizualizace počtu TČ

- Máme připravenou HTML stránku crime_circle_size.html, kde pomocí JS knihovny Leaflet zobrazíme okresy, velikostí naznačíme počet TČ.
- Vizualizace pomocí barev a velikosti: crime_color.html
- Vizualizace pomoci crime_cluster.html (obdoba - https://www.zasilkovna.cz/pobocky, https://www.postaonline.cz/vyhledat-pobocku, https://www.bezrealitky.cz/vyhledat)












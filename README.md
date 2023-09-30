# Workshop / Analýza prostorových dat a jejich vizualizace

Já: Jiří Kynčl, G-Tix s.r.o. https://g-tix.cz

Cíl: podívat se na pár otevřených datových sad ČR (okresy, kriminalita, nezaměstnanost, populace), 
propojit je a vyzkoušet různé typy vizualizací dat v prostoru.


## Vizualizace dat
Vizualizace dat - grafické vyjádření dat (hodnoty, kategorie, porovnání, ...), klasicky grafy
Proč vizualizujeme data - při vizualizaci chápeme velmi rychle souvislosti, oproti přístupu k samotným hodnotám (viz obrázek vizualizace-dat-1.png)
Jaké máme nástroje - vizualizace-dat-2.png


## Jak budeme postupovat
Workshop je rozdělen do několika kroků (složka s číselným označením), v každém z nich vytvoříme na základě 
zdrojových dat nový dataset, vyexportujeme ho do GeoJSON (jeden ze standardů GML, KLM, WKM) a ukážeme nějaký typ vizualizace v mapě. V každé části je podsložka help, 
ve které jsou umístěny databázové dotazy i výstupy (pro případ, že se někde zasekneme nebo nebudeme stíhat).

Začneme s propojením dat v databázi, zobrazením základních dat v prostoru a krůček po krůčku se dostaneme k porovnání 
kriminality a nezaměstnanosti nebo k vývoji kriminality v čase.


## S čím budeme pracovat
- Databáze PostgreSQL, rozšíření PostGIS
- Azure Maps, Leaflet - JavaScript map enginy

Poznámka: je hodně technologií pro práci s daty i grafickými výstupy. Vybrali jsme takové, které nevyžadují nějaké zvláštní 
HW prostředky, jsou opensource, nejsou placené... 


## Tipy & odkazy
- https://www.postgresql.org/
- https://postgis.net/
- https://leafletjs.com/
- https://samples.azuremaps.com/
- https://openlayers.org/
- https://www.cuzk.cz/
- https://www.czso.cz/
- https://qgis.org/
- https://www.arcgis.com/index.html


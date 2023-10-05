# Workshop / Analýza prostorových dat a jejich vizualizace

Jiří Kynčl, **G-Tix s.r.o.** https://g-tix.cz

https://github.com/jirikyncl/datafestival

**Cíl:** podívat se na několik otevřených datových sad ČR (okresy, kriminalita, nezaměstnanost, populace), 
propojit je a vyzkoušet různé typy vizualizací dat v prostoru.


## Vizualizace dat
- **Vizualizace dat** - Grafické vyjádření informací (hodnoty, kategorie, porovnání, ...), klasicky grafy
- **Proč vizualizujeme data** - při vizualizaci chápe mozek velmi rychle souvislosti (viz obrázek [vizualizace-dat-1.png](vizualizace-dat-1.png))
- **Jaké máme možnosti** - [vizualizace-dat-2.png](vizualizace-dat-2.png)
- **Grafy** - liniový, koláčový, sloupcový, ... [vis.png](vis.png) 
- **Prostorová data** - mají pozici (souřadnice x, y, z), hodnotu... [spatial-vis.png](spatial-vis.png)


## Jak budeme postupovat
Workshop je rozdělen do několika kroků (složka s číselným označením), v každém z nich vytvoříme na základě 
zdrojových dat nový **dataset**, vyexportujeme ho do **GeoJSON** (jeden ze standardů GML, KML, ...) a ukážeme nějaký **typ vizualizace v mapě**. 

V každé části je podsložka *help*, 
ve které jsou umístěny databázové dotazy i výstupy (pro případ, že se někde zasekneme nebo nebudeme stíhat).

Začneme s propojením dat v databázi, zobrazením základních dat v prostoru a krůček po krůčku se dostaneme k porovnání 
kriminality a nezaměstnanosti nebo k vývoji kriminality v čase.


## S čím budeme pracovat
- Databáze PostgreSQL, rozšíření PostGIS
- Azure Maps, Leaflet - JavaScript map enginy

**Poznámka:** je hodně technologií pro práci s daty i grafickými výstupy. Vybrali jsme takové, které nevyžadují nějaké zvláštní 
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


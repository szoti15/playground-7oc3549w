# DML utasitasok 3. resz:


# SELECT

amirol szo lesz: `ORDER BY`, `GROUP BY`, `HAVING`, aggregalas, fuggvenyek 

### ORDER BY

- az `ORDER BY` utan felsorolt oszlopok szerint lesz rendezve a vegeredmeny
- az alapertelmezett a novekvo sorrend, de a rendezes sorrendjet oszloponkent is beallithatjuk: <br>
`ASC` (ascending) - novekvo, `DESC` (descending) - csokkeno sorrend

listazzuk ki az orszagokat abc szerint visszafele
``` sql 
SELECT *
FROM o_orszagok 
ORDER BY orszag DESC;
``` 


listazzuk ki a versenyzoket, szuletesi helyuk abc sorrend szerint visszafele es nevuk abc sorrend szerint rendezve
``` sql 
SELECT * FROM O_VERSENYZOK 
ORDER BY szul_hely DESC, nev ASC;
```

### GROUP BY

- `GROUP BY` utan felsorol oszlopok alapjan csoportositjuk a sorokat
- ebben az esetben az eredmenyben (vagyis a select utan felsorolt oszlopok listajaban), csak az itt felsorolt oszlopokat hasznalhatjuk 
- az eredmenyben tovabba hasznalhatunk meg ugynevezett aggregalo (gyujto) fuggvenyeket (nem csak azokon az oszlopokon, amire group by-olunk)
- a csoportositas a `WHERE` -ben megtortent szures utan fut meg, tehat a `WHERE` altal levalogatott sorokat fogja csoportositani
- ha a csoportositas utan akarunk a csoportositott eredmenyen szurni, akkor a `HAVING` utan megadhatoak a feltetelek (`HAVING` ugyanaz, mint a `WHERE`, annyi kulonbseggel, h csak `GROUP BY` utan hasznalhato)
  
- gyakran hasznalt aggregalo fuggvenyek: SUM, AVG, COUNT, MAX, MIN
    - SUM: az itt megadott kifejezes erteket az egy csoportba tartozo soroknal osszeadja, annak a vegeredmenyet latjuk majd csoportonkent
    - AVG: (avarage - atlag) hasonlo a SUM hoz, azzal a kulonbseggel, h az eredmenyt elosztja a csoportban talalhato sorok szamaval
    - COUNT: a megadott oszlop(ok) darabszamat adja vissza a csoporton belul
    - MAX: a megadott oszlop csoportban megtalalhato legnagyobb erteket ajda eredmenyul  
    - MIN: a megadott oszlop csoportban megtalalhato legkisebb erteket ajda eredmenyul  
- aggregalo fuggvenyekhez nem muszaj csoportositast (`GROUP BY`) hasznalni, ilyenkor a `SELECT` egesz tartalma lesz a "csoport"


<br>
<br>

szamoljuk meg a versenyzoket:
``` sql 
SELECT COUNT(*) FROM O_VERSENYZOK;
```

csoportositsuk a versenyzoket, egyen-csapat szerint (az eredmenyben csak azt az oszlopot hasznalhatjuk, ami alapjan csoportositunk + aggregalo fuggvenyek)
``` sql 
SELECT egyen_csapat FROM O_VERSENYZOK GROUP BY egyen_csapat;
```    

az aggregalo fuggvenyek nelkul, a `GROUP BY` megfelel a `DISTINCT` hasznalataval <br> itt, az oszlopnak ket erteke van csak `e` es `c`, ezert 2 csoport lesz osszesen <br>
az eredmenyben pedig csak ezt az oszlopot hasznalhatjuk, ezert ugyanaz, mintha lekerdeznenk az oszlopban levo egyedi ertekeket
<br>
<br>
ez az egyezes akkor is igaz, h ha tobb oszlop szerint csoportositunk, pl:
`SELECT egyen_csapat, szul_hely FROM O_VERSENYZOK GROUP BY egyen_csapat, szul_hely;` = `SELECT DISTINCT egyen_csapat, szul_hely FROM O_VERSENYZOK;`
 

- `GROUP BY` hasznalata ket helyzetben lehet hasznos (ek. hasznaljuk a `DISTINCT`-et), az egyik az aggregalo fuggvenyek, masik a szures `HAVING` segitsegevel 

<br>
szamoljuk meg hany darab egyen/csapat jelentkezett szuletesi hely alapjan
(+ rendezzuk sorba oket jelentkezok szama alapjan)

``` sql 
SELECT egyen_csapat, szul_hely, COUNT(*) 
FROM O_VERSENYZOK 
GROUP BY egyen_csapat, szul_hely
ORDER BY COUNT(*) DESC;
```

eredmeny:
``` 
'e','Budapest',     '82'
'c','',             '49'
'e','',             '41'
'e','Miskolc',      '8'
'e','Pécs',         '5'
'e','Tatabánya',    '5'
```

most csak azokat a csoportokat kerdezzuk le, ahol legalabb 10 versenyzo szuletett
(a csoportositott eredmenyt tovabb szurjuk a HAVING segitsegevel)
``` sql 
SELECT egyen_csapat, szul_hely, COUNT(*) 
FROM O_VERSENYZOK 
GROUP BY egyen_csapat, szul_hely
HAVING COUNT(*) > 10
ORDER BY COUNT(*) DESC;
```

eredmeny:
``` 
'e','Budapest', '82'
'c','',         '49'
'e','',         '41'
```


//TODO: fuggvenyek: datumok, szovegek, convertalasok, alias



# FELADATOK:


Földrészenként írjuk ki az országok számát, a legnagyobb és legkisebb területet, a lakosok összegét és átlagát

::: megoldas
``` sql 
SELECT count(*), min(terulet), max(terulet), sum(lakossag), avg(lakossag)
FROM o_orszagok
GROUP BY foldresz;
```
:::

Az eredmények táblából versenyszámazonosítónként a legjobb és a legrosszabb helyezést írjuk ki.
::: megoldas
``` sql 
SELECT versenyszam_azon, min(helyezes), max(helyezes)
FROM o_eredmenyek
GROUP BY versenyszam_azon;
```
:::

Az eredmények táblából versenyszámazonosítónként a legjobb és a legrosszabb helyezést írjuk ki, de csak azokat, ahol a kettő nem egyezik meg egymással. A lista legyen a legjobb eredmény szerint rendezve.
::: megoldas
``` sql 
SELECT versenyszam_azon, min(helyezes), max(helyezes)
FROM o_eredmenyek
GROUP BY versenyszam_azon
HAVING min(helyezes) != max(helyezes)
ORDER BY min(helyezes) DESC;
```
:::

Számoljuk meg, hogy sportágazonosítónként hány versenyszám van.
::: megoldas
``` sql 
SELECT count(*), sportag_azon
FROM o_versenyszamok
GROUP BY sportag_azon;
```
:::

Számoljuk meg, hogy sportágazonosítónként hány versenyszám van. Különböztessük meg ezt a férfiaknál és a nőknél.
::: megoldas
``` sql 
SELECT count(*), sportag_azon, ferfi_noi
FROM o_versenyszamok
GROUP BY sportag_azon, ferfi_noi;
```
:::

Számoljuk meg, hogy sportágazonosítónként hány versenyszám van. Különböztessük meg ezt a férfiaknál és a nőknél, és csak a férfiakra vonatkozót listázzuk ki.
::: megoldas
``` sql 
SELECT count(*), sportag_azon, ferfi_noi
FROM o_versenyszamok
GROUP BY sportag_azon, ferfi_noi
HAVING ferfi_noi = 'férfi';

vagy

SELECT count(*), sportag_azon, ferfi_noi
FROM o_versenyszamok
WHERE ferfi_noi = 'férfi'
GROUP BY sportag_azon, ferfi_noi;
```
:::

Keressük meg azokat az országazonosítókat, amelyek a versenyzők táblában 3-nál többször szerepelnek. (azon országazonosítók, ahol 3-nál több versenyző indult.)
::: megoldas
``` sql 
SELECT count(*), orszag_azon
FROM o_versenyzok
GROUP BY orszag_azon
HAVING count(*) > 3;
```
:::

Számoljuk meg, hogy az egyes születési helyekről hány versenyző indult.
::: megoldas
``` sql 
SELECT count(*), szul_hely
FROM o_versenyzok
GROUP BY szul_hely;
```
:::

Listázzuk ki földrészenként az országok területének összegét és az átlagos népsűrűséget.
::: megoldas
``` sql 
SELECT foldresz, sum(terulet), avg(lakossag/terulet)
FROM o_orszagok
WHERE terulet != 0
GROUP BY foldresz;
```
:::

Az eredmények táblából versenyszámazonosítónként kérjük le a legjobb és a legrosszabb helyezést, de csak azokat, ahol a legrosszabb helyezés a 10-től kisebb.
::: megoldas
``` sql 
SELECT versenyszam_azon, min(helyezes), max(helyezes)
FROM o_eredmenyek
GROUP BY versenyszam_azon
HAVING max(helyezes) < 10;
```
:::

Számoljuk meg, országazonosítónként hány versenyző szerepel a versenyző táblában, de csak azokat írjuk ki, ahol 10-nél több versenyző van.
::: megoldas
``` sql 
SELECT orszag_azon, count(*)
FROM o_versenyzok
GROUP BY orszag_azon
having count(*)>10;
```
:::

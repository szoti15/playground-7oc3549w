# DML utasitasok 2. resz:
      
    
#### A feladatokhoz a kovetkezo adatbazist fogjuk hasznalni: 

(a sema es az adatok oracle sql-bol lett atemelve, ezert a kepen levo tipusok elterhetnek, pl INT helyett NUMBER)
![alt text](../pics/olimpia.png)

[olimpia adatbazis sema](https://github.com/szoti15/playground-7oc3549w/blob/master/sql/all_in_one.txt)

# SELECT

amirol szo lesz: `DISTINCT`, `LIMIT`, `WHERE`, where-en belul: `LIKE`, `AND`, `OR`, `NOT`, `BETWEEN`, `IS NULL`, `IN`

### select expression

- csak az itt felsorolt oszlopok adatait fogjuk latni
- legalabb egy oszlopot vagy `*`-ot kotelezo megadni
- tobb oszlop eseten, az oszlopneveket vesszovel elvalasztva felsoroljuk 
- specialis karakter `*`, ami megegyezik azzal, mintha felsorolnank az osszes oszlopot a tablabol
- a felsorolas sorrendjeben kapjuk vissza az eredmenyt

<br>

kerdezzuk le csak a versenyzok neveit:
``` sql 
    SELECT nev FROM O_VERSENYZOK;
```
eredmeny:
``` 
nev

'Adam Van Koeverden'
'Ana Maria Branza'
'Anasztaszja Szamuszevics'
'Andrea Minguzzi'
'Andrej Mojszejev'
'Andrejus Zadneprovskis'
'Aneta Konieczna'
'Anne-Laure Viard'
'Ara Abrahamian'
'Arn Gréta'
'Aubéli Ottó'
'Bácsi Péter'
'Baczkó Bernadett'
'Balog Gábor'
'Balogh Gábor'
'Barta Nóra'
'Beata Mikolajczyk'
'Bedák Pál'
...
```

<br>

most a versenyzok nevet es szuletesi helyet:
``` sql 
    SELECT nev, szul_hely FROM O_VERSENYZOK;
```
eredmeny:
``` 
nev                 szul_hely

'Arn Gréta',        'Budapest'
'Aubéli Ottó',      'Esztergom'
'Baczkó Bernadett', 'Budapest'
'Bácsi Péter',      'Budapest'
'Balog Gábor',      'Békéscsaba'
'Balogh Gábor',     'Budapest'
'Barta Nóra',       'Budapest'
'Bedák Pál',        'Budapest'
'Beé István',       'Budapest'
'Benedek Tibor',    'Budapest'
'Benkő Zoltán',     'Budapest'
'Berecz Zsombor',   'Budapest'
...
```


<br>

most a versenyzok minden adatat:
``` sql 
    SELECT azon, nev, orszag_azon, egyen_csapat, szul_hely FROM O_VERSENYZOK;
```

vagy:
``` sql 
    SELECT * FROM O_VERSENYZOK;
```

<br>
<br>

### DISTINCT

- az eredmenybol kiszuri a dupla sorokat
- fontos megjegyezni, h az "eredmeny" a felsorolt oszlopokra ertendoek, ha egy oszlop van csak akkor abbol szuri a dupla sorokat, ha ket oszlop van, akkor a ket oszlopbol egyuttesen lesz szurve

pl:

az osszes jelen levo orszag foldreszenek a nevet listazzuk, de egy folreszt csak egyszer
``` sql 
SELECT DISTINCT foldresz FROM O_Orszagok;
```

eredmeny:

```
foldresz

'Ázsia'
'Európa'
'Afrika'
'Észak- és Közép-Amerika'
'Ausztrália és Óceánia'
'Dél-Amerika'
```

ha a folresz mellett az orszag nevet is listazzuk es igy rakjuk ra a `DISTINCT` -et, akkor megkapjuk az osszes orszag es foldresz nevet,
hiszen minden foldreszhez egy orszag csak egyszer szerepel a tablaban (az orszag nevei egyebkent is egyediek):


``` 
SELECT DISTINCT foldresz, orszag FROM O_Orszagok;
``` 

<br>
<br>

### WHERE 

- az elobb bemutatott select kifejezessel az eredmenyben visszatero oszlopokat tudjuk meghatarozni, a `WHERE` segitsegevel pedig a sorokat tudjuk szurni
- a `WHERE` -nel megadott kifejezes a tabla minden sorara lefut, ahol pedig teljesul, ott a sor bekerul az eredmenybe
- a kifejezesnek logikainak kell lennie, azaz a kiertekelese utan egy igaz vagy hamis erteket kapunk
- tobb kifejezes osszekapcsolhato `AND` (es) es `OR` (vagy) operatorokkal, illetve a kifejezesek tetszolegesen egymasba agyazhatoak
- a tabla soraira ugy tudunk szurni, h hivatkozunk az oszlopban talalhato ertekre

``` sql 
SELECT * FROM O_Orszagok WHERE foldresz = 'Ausztrália és Óceánia';
```

eredmeny:
``` 
'Amerikai Szamoa (USA függő területe)'
'Ausztrália'
'Fidzsi-szigetek'
'Francia Polinézia (TOM)'
'Kiribati'
'Marshall-szigetek'
'Mikronézia'
'Nauru'
'Palau'
'Pápua Új-Guinea'
'Salamon-szigetek'
'Szamoa'
'Tonga'
'Tuvalu'
'Új-Zéland'
'Vanuatu'
'Wallis és Futuna (TOM)'
```

lekertuk az osszes resztvevo orszagot ami `Ausztrália és Óceánia` kontinensen helyezkedik el

#### LIKE

szoveg tipusu mezokon valo szuresnel hasznaljuk, ahol van ket specialis helyettesito karakter, a `%` es a `_`
- `%` helyere akarhany es barmilyen szoveg kerulhet
- `_` helyere egy darab barmilyen karakter kerulhet
- ha egy ilyen karakter sem szerepel a `like` utani kereso szovegben, akkor a feltetel megegyezik a sima `=` jellel, tehat teljes egyezest keres
- mivel a `_` es a `%` foglaltak igy ezeket a karaktereket csak specialisan tudjuk keresni a `\` segitsegevel, szoval `\%` es `\_` 
- tagadasa a `NOT` kulcsszoval, csak azokat a sorokat kapjuk vissza, amikre nem igaz a feltetel, pl: `nev NOT LIKE '% Tamas'`

    peldak: <br> 
     - `A` betuvel kezdodo orszagok: `... WHERE orszag like 'A%'` 
     - 6 betus orszagot keresunk, ahol a kozepso betu `l`: `... WHERE orszag like '___l__'` (pl: Anglia)
     - ha %-ot hasznalunk a fentebbi peldahoz: `... WHERE orszag like '%l%'`, igaz, h megtalaljuk Angliat, de mas ertekeket is megtalalhatunk, a szo hossza sincs meghatarozva illetve az l betu helye se, csak az, h a szo tartalmazzon l betut
     - teljes egyezes: `... WHERE orszag like 'Anglia' ` ez megegyezik ezzel:  `... WHERE orszag = 'Anglia' `
     - olyan szavakat keresunk, amikben van alahuzas: `WHERE orszag like '%\_%'` (% -> barmi a szo elejen es vegen, \_ egy darab `_` a szoban)

#### AND

logikai kifejezeseket ossze tudjuk kapcsolni az `AND` operatorral, aminek az erteke a kovetkezo lesz:
 
| Egyik operandus  |  Masik operandus | AND eredmenye |
|:-----------------|:-------------|:--------------|
| TRUE |	TRUE | TRUE |
| TRUE |	FALSE | FALSE |
| FALSE | FALSE | FALSE |
| NULL | TRUE | NULL |
| NULL | FALSE | FALSE |
| NULL | NULL | NULL |
(csak akkor igaz az eredmeny, ha mind2 fel igaz)

lekerdeztuk azokat a versenyzoket, akik 1990-ben (jan 1-jen vagy azutan) ES 1991 elott szulettek
(tehat azokat a sorokat, ahol mind2 feltetel teljesult, azaz true volt)
``` sql 
SELECT * FROM O_VERSENYZOK WHERE szul_dat >= '1990-01-01' AND szul_dat <= '1991-01-01';
```
eredmeny:
``` 
'851','Balog Gábor','1990-09-02','131','e','Békéscsaba'
'866','Bor Katalin','1990-02-10','131','e','Budapest'
'877','Dara Eszter','1990-05-30','131','e','Budapest'
'991','Szilágyi Áron','1990-01-14','131','e','Budapest'
```

<br>
<br>

most kerdezzuk le azokat, akik 1990-ben, (ES) Bekescsaban szulettek
``` sql 
SELECT * FROM O_VERSENYZOK 
WHERE szul_dat >= '1990-01-01' 
AND szul_dat <= '1991-01-01'
AND szul_hely = 'Békéscsaba';
```

eredmeny:
``` 
'851','Balog Gábor','1990-09-02','131','e','Békéscsaba'
```


#### OR

logikai kifejezeseket ossze tudjuk kapcsolni az `OR` operatorral, aminek az erteke a kovetkezo lesz:
 
| Egyik operandus  |  Masik operandus | AND eredmenye |
|:-----------------|:-------------|:--------------|
| TRUE |	TRUE | TRUE |
| TRUE |	FALSE | TRUE |
| FALSE | FALSE | FALSE |
| NULL | TRUE | TRUE |
| NULL | FALSE | NULL |
| NULL | NULL | NULL |
(akkor igaz az eredmeny, ha a ket parameter kozul legalabb az egyik igaz)


listazzuk ki az osszes A es B betuvel kezdodo orszagot <br> (azokat a sorokat, ahol az orszag neve A-val VAGY B-vel kezdodik, azert vagy - mivel egyszerre nem kezdodhet mind2vel, vagy az egyik vagy a masik)

``` sql 
SELECT * FROM O_Orszagok 
WHERE orszag like 'B%' OR orszag like 'A%';
```

#### BEAGYAZASOK

- a logikai kifejezeseket tetszoleges szammal egymasba epithetjuk, az osszetartozo kifejezeseket zarojellel tudjuk osszekapcsolni
- a zarojelezett kifejezesek kiertekelese mindig a legbelso zarojeltol indul es sorban halad kifele

pl:
azokat a versenyzoket keressuk, ahol a neve "Tamas" vagy "Zoltan" es a szuletesi helye "Budapest" vagy "Kisvarda":

``` sql 
SELECT * FROM O_VERSENYZOK 
WHERE (nev like '%Tamas' OR nev like '%Zoltan')
       AND 
      (szul_hely = 'Budapest' OR szul_hely = 'Kisvarda');
```

- az operatorok kozott van egy erosorrend, ami alapjan sorban vegre tudja hajtani az sql server a kifejezesek kiertekeleset
- ha nincs zarojel akkor a fobb operatorok erosorrendje roviden: NOT, AND, OR <br>
azaz, ha ezek az operatorok vannak egy kifejezesben, eloszor a NOT majd az AND es utana az OR hajtodik vegre

- a vegrehajtas sorrendje:
1. `nev like '%Tamas' OR nev like '%Zoltan'`, tegyuk fel, h ennek az erteke A (igaz vagy hamis)
2. `szul_hely = 'Budapest' OR szul_hely = 'Kisvarda'`, tegyuk fel, h ennek az erteke B (igaz vagy hamis)
3. igy az utolso kiertekelendo kifejezes: `A AND B`, hiszen mar csak ez maradt a ket zarojelezett resz feloldasa utan  


vizsgaljuk meg a fentebbi lekerdezest zarojelek nelkul:

``` sql 
SELECT * FROM O_VERSENYZOK 
WHERE nev like '%Tamas' OR nev like '%Zoltan'
       AND 
      szul_hely = 'Budapest' OR szul_hely = 'Kisvarda';
```

1. kiertekelendo: `nev like '%Zoltan' AND szul_hely = 'Budapest'` (hiszen az `AND` erosebb, mint a masik ket `OR`, es az `AND` ket oldalan a ket like van)
2. tegyuk fel, hogy az `AND` A (igaz vagy hamis) erteket adott vissza, igy a kifejezesunk igy nez ki: `nev like '%Tamas' OR A OR szul_hely = 'Kisvarda'`
3. mivel 2 db `OR` van a kifejezesben, aminek az ereje ugyanaz, igy balrol jobbra haladva ertekeli oket ki
4. tehat a kovetkezo, amit megvizsgal a server: `nev like '%Tamas' OR false`, tegyuk fel, h ennek az erteke B (igaz vagy hamis) lesz
5. az utolso kiertekelendo kifejezes pedig ez maradt: `B OR szul_hely = 'Kisvarda'` 

<br> 
<br> 
//TODO: egy szep beagyazott kifejezeses pelda 

#### NOT

- negalas, a kifejezes eredmenyenek a megforditasa TRUE -> FALSE, FALSE -> TRUE
- bezarojelezett kifejezes csoportokat is negalhatunk, pl: `WHERE NOT (oszlopnev1 = 1 OR oszlopnev2 = 3 OR oszlopnev3 = 3)`  

- bizonyos kifejezesek ugymond ekvivalensek egymassal, azaz a vegeredmenyuk mindig megegyezik (true/ false)
    - egyszeru pelda: `A AND B` ekvivalens `B AND A`-val, hiszen mindketto csak akkor lesz igaz, ha A es B is igaz
    
- van nehany ekvivalencian alapulo okolszabaly:
    - `NOT (A  AND  B  AND  C)` ekvivalens a ```NOT A    OR   NOT B     OR    NOT C```-vel <br> <br>
    bevisszuk a negalast, ami azt jelenti, h a tagok mindegyikere rakerul, es megfordul a koztuk levo operator `AND`-rol `OR`-ra <br> <br>
    pl: "NOT (varos = 'Kisvarda' AND nev = 'Zoltan' AND kor = 29)" - ahol a 29 eves, Zoltan nevu kisvardaiakat nem szeretnem megkapni <br> <br>
    megegyezik azzal, hogy "NOT varos = 'Kisvarda' OR  NOT nev = 'Zoltan' OR NOT kor = 29" - ahol a nev nem Zoltan vagy a varos nem Kisvarda vagy nem 29 eves (tehat pont csak a 29 eves kisvardai Zoltanokat szurjuk ki)
       
    - ugyanez igaz visszafele: `NOT (A  OR  B  OR  C)` ekvivalens a ```NOT A    AND   NOT B     AND    NOT C```-vel <br> <br>
    `OR`-rol `AND`-re fordulnak az operatorok es bekerult a negalas az egyes feltetelekhez    


#### BETWEEN

- szintaktikaja a kovetkezo: `BETWEEN begin_expr AND end_expr`
- hasznalata ha egy van egy folyamatos tartomanyunk, amiben szeretnenk hogy a keresett ertekunk szerepeljen (megadjuk a tartomany kezdetet es veget)
- a `BETWEEN` gyakorlatilag megfelel a kovetkezo utasitasnak: `oszlopnev >= begin_expr AND oszlopnev <= end_expr`
- a feltetelt egyszeruen tudjuk tagadni a `NOT` kulcsszoval: `oszlopnev NOT BETWEEN 1 AND 10` - ahol az oszlopban talalhato ertek nem lehet 1-10 kozott 
 
 
fentebbi peldat modositva kicsit:

``` sql 
SELECT * FROM O_VERSENYZOK 
WHERE szul_dat BETWEEN '1990-01-01' AND '1991-01-01';
```

#### IS NULL

- vannak oszlopok, amik tartalmazhatnak `NULL`-okat, specialis jelolok, amik azt jelolik, h nincs az adott helyen ertek
- ugy tudunk azokra a sorokra szurni, ahol nincs ertek, h az `IS NULL`-t hasznaljuk
- tagadasa a `NOT` kulcsszoval, ilyenkor csak azokat a sorokat kapjuk vissza, ahol az oszlopban talalhato ertek toltve van 

listazzuk ki az osszes versenyzot, akiknek nincs kitoltve a szuletesi idejuk
``` sql 
SELECT * FROM O_VERSENYZOK WHERE szul_dat IS NULL;
```

most azokat, akiknek ki van toltve
``` sql 
SELECT * FROM O_VERSENYZOK WHERE szul_dat IS NOT NULL;
```


#### IN

- `IN` utan zarojelben, vesszovel elvalasztva, felsorolhatunk tobb erteket is, ha az oszlopban talalhato ertek barmelyikkel egyezik, a feltetel igaz lesz
- tagadasa a `NOT` kulcsszoval, csak akkor lesz igaz a feltetel, h ha az oszlopban talalhato ertek a felsoroltak kozul egyel sem egyezik meg
- ez a kifejezes megegyezik a felsorolt ertekek `OR`-ral valo osszekapcsolasanak: <br>
`WHERE oszlopnev IN (1, 2, 3, 4)` megegyezik a <br> `WHERE oszlopnev = 1 OR oszlopnev = 2 OR oszlopnev = 3 OR oszlopnev = 4` <br>
mint lathato az `IN` segitsegevel sokkal atlathatobb, egyszerubben ertelmezheto lekerdezeseket tudunk irni

kerdezzuk le az osszes versenyszamot, amelyek neveben benne van, hogy "egyeni" (`IN`-t hasznalva es nem `LIKE`-ot):

``` sql 
SELECT * FROM O_versenyszamok 
WHERE versenyszam IN ('egyeni', 'kard egyeni', 'parbajtor egyeni', 'tor egyeni');
```

ugyanez `LIKE` segitsegevel (viszont ez mas eredmenyeket is hozhat kesobb, ha uj ertek bekerul "egyeni" vegzodessel):

``` sql 
SELECT * FROM O_versenyszamok 
WHERE versenyszam LIKE '%egyeni';
```

ugyanez `OR` segitsegevel:
``` sql 
SELECT * FROM O_versenyszamok 
WHERE versenyszam = 'egyeni' OR versenyszam = 'kard egyeni' 
      OR versenyszam = 'parbajtor egyeni' OR versenyszam = 'tor egyeni';

```

<br>
<br>
<br>

kerdezzuk le azokat az eredmenyeket, ahol a versenyzo nem lett dobogos:

``` sql 
SELECT * FROM O_eredmenyek WHERE helyezes NOT IN (1, 2, 3);
```

ennek megfeleloje ES-ekkel:
``` sql 
SELECT * FROM O_eredmenyek WHERE helyezes != 1 AND helyezes != 2 AND helyezes != 3;
```


ennek megfeleloje OR-okkal:
``` sql 
SELECT * FROM O_eredmenyek WHERE NOT (helyezes = 1 OR helyezes = 2 OR helyezes = 3);
```

<br>
<br>

#### LIMIT

`LIMIT [offset,] limit`

- a visszaadott sorok szamat limitalja le a megadott szamra (de nem tobbet, mint ahany sort tartalmaz az eredmeny)
- mindig a sorrendben az elso `limit` elemre limitalja le az eredmenyt: `LIMIT 10`
- megadhato egy `offset` ertek is, amivel beallithato, h hanyadik sortol kezdje el a szamolast, pl: 20. sortol az elso 10 elem `LIMIT 20, 10`

listazzuk ki az elso versenyzot
``` sql 
SELECT * FROM O_VERSENYZOK LIMIT 10;
```

listazzuk ki a 33-43. versenyzoket 
``` sql 
SELECT * FROM O_VERSENYZOK LIMIT 33, 10;
```

<br>
<br>
<br>

# FELADATOK:


1. Listázzuk ki azokat az országokat, amelyek területe 0.
::: megoldas
``` sql 
SELECT orszag, terulet
FROM o_orszagok
WHERE terulet = 0;
```
:::
2. Listázzuk ki azoknak az országoknak az adatait, ahol nincs megadva mennyi az ország területe.
::: megoldas
``` sql 
SELECT *
FROM o_orszagok
WHERE terulet IS NULL;
```
:::
3. Listázzuk ki azoknak az országoknak az adatait, ahol meg van adva mennyi az ország területe.
::: megoldas
``` sql 
SELECT *
FROM o_orszagok
WHERE terulet IS NOT NULL;
```
:::
4. Listázzuk ki Magyarország, Kína, és Japán adatait.
::: megoldas
``` sql 
SELECT *
FROM o_orszagok
WHERE orszag IN ('Magyarország', 'Kína', 'Japán');

vagy

SELECT *
FROM o_orszagok
WHERE orszag = 'Magyarország' OR orszag = 'Kína' OR orszag = 'Japán';
```
:::
5. Listázzuk ki az összes ország adatait, kivéve Magyarországot, Kínát, és Japánt.
::: megoldas
``` sql 
SELECT *
FROM o_orszagok
WHERE orszag NOT IN ('Magyarország', 'Kína', 'Japán');

vagy

SELECT *
FROM o_orszagok
WHERE orszag != 'Magyarország' AND  orszag != 'Kína' AND orszag != 'Japán';

vagy

SELECT *
FROM o_orszagok
WHERE NOT (orszag = 'Magyarország' OR orszag = 'Kína' OR orszag = 'Japán');
```
:::
6. Listázzuk ki azokat az országokat, amelyek neve A betűvel kezdődik.
::: megoldas
``` sql 
SELECT orszag
FROM o_orszagok
WHERE orszag LIKE 'A%';
```
:::
7. Listázzuk ki azokat az országokat, amelyek neve A betűvel kezdődik, és a 3. betűje e betű.
::: megoldas
``` sql 
SELECT orszag
FROM o_orszagok
WHERE orszag LIKE 'A_e%' ;
```
:::
8. Listázzuk ki azon egyéni versenyzők adatait, akiknek az országazonosítójuk 131, és Debrecenben születtek.
::: megoldas
``` sql 
SELECT *
FROM o_versenyzok
WHERE orszag_azon = 131 and egyen_csapat = 'e' and szul_hely = 'Debrecen';
```
:::
9. Listázzuk azon versenyzők adatait, akik Egerben születtek vagy a nevükben két 'e' betű van.
::: megoldas
``` sql 
SELECT *
FROM o_versenyzok
WHERE szul_hely = 'Eger' OR nev LIKE '%e%e%';
```
:::
10. Listázzuk ki azon versenyzők adatait, akiknek nincs megadva a születési helyük, az országazonosítójuk 4, és az egyen_csapat oszlopban nem 'c' betű szerepel.
::: megoldas
``` sql 
SELECT *
FROM o_versenyzok
WHERE szul_hely IS NULL and orszag_azon = 4 and egyen_csapat != 'c';
```
:::
11. Listázzuk ki azon csapatok adatait a versenyzők táblából, akiknek az országazonosítójuk 4 vagy 131 vagy 15 vagy 23.
::: megoldas
``` sql 
SELECT *
FROM o_versenyzok
WHERE egyen_csapat = 'c' 
and (orszag_azon = 4 OR orszag_azon = 131 OR orszag_azon = 15 OR orszag_azon = 23);

vagy

SELECT *
FROM o_versenyzok
WHERE egyen_csapat = 'c' AND orszag_azon IN (4, 131, 15, 23);
```
:::
12. Listázzuk ki az érem táblából azokat az országazonosítókat, ahol vagy 2 ezüstöt vagy 1 bronzot nyertek.
::: megoldas
``` sql 
SELECT orszag_azon, bronz, ezust
FROM o_erem_tabla
WHERE ezust=2 OR bronz=1;
```
:::
13. Listázzuk ki az éremtáblából azokat az országazonosítókat, ahol 5 és 10 közötti arany született.
::: megoldas
``` sql 
SELECT orszag_azon, arany
FROM o_erem_tabla
WHERE arany BETWEEN 5 and 10;
```
:::
14. Listázzuk ki az érem táblából azokat az országazonosítókat, amelyeknél az érmek összege több, mint 15.
::: megoldas
``` sql 
SELECT orszag_azon, arany, ezust, bronz
FROM o_erem_tabla
WHERE arany + ezust + bronz > 15;
```
:::
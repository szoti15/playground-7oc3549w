Az Sql utasitasoknak 3 nagy fajtajat kulonboztetjuk meg:
- **DDL** (Data definition language) Adatdefinicios nyelv
- **DML** (Data manipulation language) Adatmanipulacios nyelv
- **DCL es TCL** (Data/Transaction control language) Adat- Tranzakcio vezerlo nyelv

<br>
<br>
<br>

## DDL:
adatbazis strukturak es semak definialasara/modositasara hasznalt parancsok, ezekkel tudunk tulajdonsagait beallitani, jogot adni, stb...

fobb parancsok:
- **CREATE**      objektumok/strukturalt letrehozasara hasznalt parancs
- **ALTER**       a mar letezo objektumok strukturainak modositasara hasznalt parancs
- **DROP**        a letezo objektum torlesere hasznalt parancs
- **RENAME**      a letezo struktura atnevezesere hasznalt parancs

<br>

## DML:
a DDL nyelv segitsegevel letrehozott strukturak egyikeben (tablakban) tarolt adatok manipulalasara hasznalt parancsok

fobb parancsok:
- **SELECT**      az adatok kinyerese az adatbazisbol
- **INSERT**      adatok beszurasa az adatbazisba
- **UPDATE**      adatok modositasa a db (database rovidites) -ben
- **DELETE**      adatok torlese a db-bol

<br>

## DCL es TCL
tranzakciok es eleresi jogok kezelesere 

(tranzakcio: egy X lepesbol allo folyamat, melyet egy egysegkent kezelunk, a folyamatot vagy egeszben hajtjuk vegre vagy sehogy, annak ellenere, h a folyamat kozepen halt el a futtatas, minden korabban vegrehajtott valtozas visszagorgetheto a kezdopontig)
 
fobb parancsok TCL:
- **COMMIT**      a tranzakcio altal bekovetkezett valtozasok elmentese az adatbazisban
- **ROLLBACK**    az osszes valtozas visszagorgetese az elozo committig 
- **SAVEPOINT**   mentesi pont keszitese, ami arra hasznalhato, h eddig a pontig gorgessuk vissza a valtozasokat es ne pedig az utolso committig (nem lehet hamarabb gorgetni, mint az utolso commit)

fobb parancsok DCL:
- **GRANT**      valamilyen jog adasa egy objektumra egy usernek vagy groupnak
- **REVOKE**      valamilyen jog elvetele egy usertol vagy grouptol 
 
 <br>
 
 ## Egyeb
 
   * egy sql serveren tobb adatbazis is letezhet egyszerre, egy adatbazist ugy kell elkepzelni, mint egy mappat, ami tobb filet gyujt egybe
    <br>
    (altalaban 1 alkalmazas 1 kulon adatbazist hasznal, de ez nincs kobe vesve, 1 adatbazison dolgozhat tobb alkalmazas is illetve 1 alkalmazas hasznalhat tobb adatbazist is)
 
   * egy szerveren belul az objektumok elerese hasonloan mukodik, mint mas programnyelveknel vagy mint a windowsos konyvtarszerkezetnel csak per / helyett pontot hasznalunk
 
 igy egy adatbazison belul talalhato tabla elerheto a kovetkezo modon: **adatbazisNev.tablaNev**
 pl 
 ``` sql
 SELECT * FROM myDatabase.Users
 ```
 ---
 
   * a management toolban nyitott ablakot connectionnek (kapcsolatnak) vagy consolenak hivjuk, ezen keresztul tudunk kiadni parancsokat a server fele
   <br>
    a connection mindig csatlakozik egy adatbazisra, ha nincs megadva neki semmi, akkor ez az alapertelmezett `sys` adatbazis lesz
 
 az **adatbazisok kozott a `USE` parancscsal tudunk valtani**, igy ha azt kiadjuk, onnantol a konzolunk azon az adatbazison fogja kiadni a tovabbi parancsokat
 
 pl: 
 ``` sql
 USE myDatabase; 

 SELECT * FROM Users;
```
 szinten a myDatabase Users tablajabol fogja kiolvasni az adatokat, viszont igy nincs szuksegunk, hogy mindig megadjuk a tablanev elott az adatbazis nevet is
 

<br>

## pelda utasitasok ertelmezese:

``` sql
CREATE DATABASE [IF NOT EXISTS] database_name
   [CHARACTER SET charset_name]
   [COLLATE collation_name]
```
   * kulcsszavak/utasitasok altalaban nagybetuvel irandoak, ezek azok, amiket nem lehet valtoztatni, pl CREATE, DATABASE
   * kisbetuvel altban a szabadon (bizonyos szabalyokat betartva) valtoztathato nevek, valtozok vannak pl: database_name
   * a [ ] kozott talalhato resz opcionalis, ami azt jelenti, h nem kotelezo megadni, de ez azzal is jar, h mas eredmenyt fog hozni a kiadott parancs
pl:
``` sql
CREATE DATABASE valamiDbNev
```
teljesen szabalyos parancs a fenti minta alapjan, az osszes opcionalis resz kihagyasaval keszult

<br>

``` sql
CREATE DATABASE IF NOT EXISTS valamiDbNev
```
 ez is teljesen szabalyosnak szamit, hiszen ugy dontottunk hogy hasznalatba vesszuk az `IF NOT EXISTS` -et, viszont a masik ket opcionalis parancsot nem

   * az utasitasok vegen a **;** zarja le az adott utasitast, ha egy utasitas futtatasarol beszelunk, akkor ezt nem kotelezo kirakni
   * tablak, oszlopok elnevezesenel a szavakat **_**-sal valasztjuk el, pl: kereszt_nev
   * az utasitasokat nem szukseges tobb sorba tordelni azt csupan a konnyebb olvashatosag erdekeben tesszuk, a kovetkezo utasitasok mindegyike egyforman helyes (ezek kozul az elso a legelfogadottabb): 
   
   ```mysql-psql
    SELECT * FROM Users 
    WHERE user_name = 'zoltan' 
    ORDER BY user_id;

    SELECT * FROM Users WHERE user_name = 'zoltan' ORDER BY user_id;
    
    SELECT *
    FROM Users
    WHERE user_name 
    = 'zoltan' ORDER BY 
    user_id;
   ```



## NULL:

sql-ben van egy specialis ertek, a `null` ez jelzi, azt, h ha adott helyen nincs semmilyen adat/ertek
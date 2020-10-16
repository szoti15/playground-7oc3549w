# DDL utasitasok:

## Adatbazison vegzett muveletek:
      
- **CREATE**: adatbazis letrehozasa      
https://www.mysqltutorial.org/mysql-create-database/
    ``` sql 
    CREATE DATABASE [IF NOT EXISTS] database_name
    [CHARACTER SET charset_name]
    [COLLATE collation_name]
    ```

    * `CREATE DATABASE database_name` az alap parancs, ezutan kotelezo egy adatbazis nev megadasa (database_name helyere), ha mar letezik ezen a neven adatbazis, akkor egy hibat fogunk kapni
    * `IF NOT EXISTS` opcionalis, ha tartalmazza a parancs, akkor nem fogunk hibat kapni, ha mar letezik ezen a neven adatbazis
    * `CHARACTER SET charset_name` es `COLLACTE collation_name` opcionalisak, a karakter halmaz es az arra vonatkozo szabalyok meghatarozasara (pl ascii, utf-8, stb)
    kezdo szinten ez nem annyira fontos, emlites szintjen jo tudni rola, h ez is beallithato
    
    <br>
    <br>
    <br>
    
- **DROP**: adatbazis torlese    
https://www.mysqltutorial.org/mysql-drop-database/

    ``` sql
    DROP DATABASE [IF EXISTS] database_name
    ```
    
    * `DROP DATABASE database_name`, a megadott neven letezo adatbazis torlese, ha nem letezik hibat kapunk
    * `IF NOT EXISTS` opcionalis, ha tartalmazza a parancs, akkor nem fogunk hibat kapni, ha nem letezik ezen a neven adatbazis
    
---    
## Tablakon vegzett muveletek:

a tabla, hasonloan egy excel vagy access szintu tablahoz egy matrix, melynek az oszlopai az objektumokat leiro jellemzok, a sorai pedig az adatok
pl:

| keresztnev | vezeteknev |  emailcim |
|:----------|:-------------|:------|
| zoltan |  szotak | szoti15@gmail.com |
| viktoria |   nagy   |   nagyviktoria16@gmail.com |

a tabla a felhasznalok tarolasara lett letrehozva (maguk az objektumok a konkret felhasznalok)
1 objektum pl:  **zoltan   szotak  szoti15@gmail.com**, az o adatait az oszlopok hatarozzak meg (objektum tulajdonsagai)

<br>
<br>

- **CREATE**: tabla letrehozasa   
https://www.mysqltutorial.org/mysql-create-table/
    ``` sql
    CREATE TABLE [IF NOT EXISTS] table_name(
       column_1_definition,
       column_2_definition,
       ...,
       [table_constraints]
    ) 
    ``` 

    * `CREATE TABLE table_name`  az alap parancs, ezutan kotelezo egy tabla nev megadasa (table_name helyere), ha mar letezik ezen a neven adatbazis, akkor egy hibat fogunk kapni
    * `IF NOT EXISTS` opcionalis, ha tartalmazza a parancs, akkor nem fogunk hibat kapni, ha mar letezik ezen a neven tabla
    * `column_1_definition, column_2_definition`, oszlop definiciok, ezekkel tudjuk megmondani, h a tablanak milyen es hany oszlopa legyen
    * `table_constraints` opcionalis, tabla szintu megszoritasokat tudunk meghatarozni (megszoritas pl, egy oszlopon belul nem szerepelhet ketszer ugyanaz az ertek) 
    * tablat abban az adatbazison fogja letrehozni, ahova eppen a konzol mutat (korabban kiadott USE database)
    
    <br>
    <br>
    
     * #### oszlop definiciok (column definition):   
        `column_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] [column_constraint];`
        *  `column_name data_type(length)`: az oszlop neve a column_name helyere, data_type(lenght) helyere pedig az oszlop adattipusa
        * adattipusok: 
        https://www.mysqltutorial.org/mysql-data-types.aspx 

          legtobbhoz megadhato a maximalis hossza a tipusnak pl: INT(3) - 3 jegyu egesz szamok, VARCHAR(500) - 500 karakter hosszu szoveg
          <br>
          ezekbol a leggyakrabban hasznaltak: **INT**, (**BIGINT**, **TINYINT**), **FLOAT**/**DOUBLE**, **VARCHAR**, **DATE**, **DATETIME** (reszletesebb lista lent)
          
            * **INT**: egesz szamok tarolasara, ha esetleg tul keves, akkor **BIGINT**, ha tul nagy (pl csak true, false ertekhez, 0, 1), akkor **TINYINT**
            * **FLOAT** vagy **DOUBLE**, tort szamok tarolasara (double kepes nagyobb szamok tarolasara)
            * **VARCHAR** szoveg tarolasara, merete valtozo, mindig annak megfeleloen foglal le teruletet, ahany karaktert tarolunk benne
            * **DATE** datum tarolasra (ido nelkul), **DATETIME** datum es ido tarolasa
            
          <br>
        * `NOT NULL`, alapertelmezetten letrehozott oszlopok tartalmazhatnak NULL erteket (azaz, nem kotelezo, h tartalmazzanak adatot), a NOT NULL segitsegevel kikothetjuk, h az oszlopba mindig kotelezo erteket szurni (ezek mellett siman hasznalhatjuk a NOT nelkul a NULL-t is az oszlop definiciojaban, ami azt koti ki, h tartalmazhat az oszlop nullokat, mivel ez az alapertelmezett, ezert ezt nem kotelezo megadni)
        * `DEFAULT value`, az oszlopban talalhato alapertelmezett ertek lesz, value helyere a konkret ertek, ha nem adunk meg adatot, akkor ezzel jon letre a sor (pl szamoknal lehet a 0)
        * `AUTO_INCREMENT`, egy tablaban csak 1 ilyen oszlop lehet, szam tipusu oszlopra csak es az erteke minden egyes sor beszurasakor automatikusan noni fog egyel (mivel automatikusan beallitodik ez az ertek ezert altban ezeknel az oszlopoknak nem tudunk kezzel beallitani erteket) 
        
        <br>
        
        * `column_constraint` oszlop szintu megszoritasok: **UNIQUE**, **CHECK**, **PRIMARY KEY**, **GENERATED ALWAYS AS**
            * `UNIQUE`, az ilyen tipusu oszlopok ertekei egyediek, azaz egy ertek csak egyszer szerepelhet a tablaban ugyanabban az oszlopban (a unique nem zarja ki a null ertekeket, ezekbol lehet tobb is a tablaban, mivel ezek hianyzo ertekek)
            * `CHEK (expression)`: ahol az expression egy igaz-hamis ertekkel visszater kifejezes, az adat beszurasakor lefut ez az ellenorzes es ha nem teljesul, akkor hibat eredmenyez pl:  `cost INT NOT NULL CHECK (cost >= 0)`, csak 0 vagy attol nagyobb erteket lehet beszurni
            * `PRIMARY KEY`: a tabla elsodleges kulcsa, az elsodleges kulcs nem tartalmazhat nullokat es egyedinek kell lennie (ez az ami egy sort egyedileg meg tud hatarozni egy tablaban), emiatt csak 1 primary key lehet egy tablaban (ez nem jelenti azt, h csak egy oszlop... lasd kesobb), lenyegeben a PRIMARY KEY a UNIQUE es a NOT NULL kombinacioja
            * `GENERATED ALWAYS AS`: az oszlop erteket automatikusan generalhatjuk mas oszlopok ertekeibol, pl ket szam osszege/szorzata, stb..., AS utan a kifejezes, majd megadhato, h az ertek tarolva (`STORED`) legyen vagy minden egyes lekerdezeskor ujraszamolodjon (`VIRTUAL`), pelda: `bevetel INT GENERATED ALWAYS AS (fizetes + fusi_melo) STORED` 
  
  <br>
  
  * #### tabla szintu megszoritasok (table_constraints)
    tabla szintu megszoritasok, amiket az oszlop definiciok utan tudunk medadni, ezekbol 4 fele van (minimalisan kulonboznek az oszlop szintu megszoritasoktol)
    * `PRIMARY KEY (column_list)`: elsodleges kulcs megadasa, annyi kulonbseggel, h tobb oszlop egyuttesen beallithato egy kulcsnak, tehat egyutt kell teljesulnie, h nem null-osok es egyutt (az oszlopok kombinacioi) egyediek, ahol a column_list a vesszovel elvalasztott listaja az oszlopokak 
    * `UNIQUE (column_list)`: hasonloan az elozohoz, itt is a felsorolt oszlopok egyutt lesznek egyediek, annyi kulonbseg a primary keytol, h itt az oszlopokban talalhato ertekek lehetnek null-ok
    * `CHECK (expression)`: ugyanaz, mint az oszlop szintu check, annyi kulonbseggel, h tobb oszlopot is felhasznalhatunk a kifejezesben
    * `FOREIGN KEY [foreign_key_name] (column_name, ...) REFERENCES parent_table(colunm_name,...)`: roviden a kulso kulcsok a tabla 1-1 oszlopat kapcsoljak ossze egy masik tabla 1-1 oszlopaval ertek szerint, foreign_key_name lesz a kulso neve, parent_table a masik tabla amivel osszekapcsoljuk ezt, a column_name pedig a 2 oszlop neve amit osszekapcsolunk <br>
    * ami kozos meg a constraintekben az az, hogy el tudjuk oket nevezni (opcionalis), ugy ha a megszoritas ele a kovetkezot irjuk: `CONSTRAINT constraint_name`, ahol a contraint_name a megszoritas neve lesz, ha ezt nem tesszuk meg, akkor az sql server automatikusan elnevei a megszoritasunkat
    * **FOREIGN KEY kiegeszites**: 
      * hivatkozo -> hivatkozott -kent fogunk a kesobbiekben beszelni a kapcsolat ket felerol
      * a hivatkozo oszlopban csak olyan ertekeket szurhatunk be, amik leteznek a hivatkozott oszlopban
      * a hivatkozott oszlopbol csak akkor torolhetunk erteket, h ha nincs ra hivatkozo oszlopban olyan ertek
      * foreign keyek letrehozasanal megadhato 2 extra opcio: 
      ``` sql
      [ON DELETE reference_option]
      [ON UPDATE reference_option]
      ```
      
     * ON DELETE: meghatarozza, h mi tortenjen a hivatkozo oszlopban, ha a hivatkozott oszlopbol torolnek egy erteket
     * ON UPDATE: meghatarozza, h mi tortenjen a hivatkozo oszlopban, ha a hivatkozott oszlopban modositanak egy erteket
     * tobb reference_option is megadhato, mindegyik masfele viselkedest eredmenyez:
        * `CASCADE` ha a hivatkozott tablaban torlodik, valtozik egy sor, akkor a hivatkozottban is ugyanugy torlodik, valtozik az erintett sor
        * `SET NULL` ha a hivatkozott tablaban torlodik, valtozik egy sor, akkor a hivatkozottban NULL ertek kerul beallitasra
        * `RESTRICT` ha az ertekre van hivatkozas a hivatkozo tablaban, akkor a torles/modositas nem lehetseges
        * `NO ACTION` ugyanaz, mint a RESTRICT
        
<br>     
<br>     
<br>     

- **DROP**: tabla torlese   
https://www.mysqltutorial.org/mysql-drop-table 
  ```sql
  DROP TABLE [IF EXISTS] table_name [, table_name] ...
  ```     
  * `DROP TABLE table_name`  az alap parancs, ezutan kotelezo egy tabla nev megadasa (table_name helyere), vesszovel elvalasztva tobb tablat is torolhetunk egyszerr, ha nem letezik a tabla, akkor hibat kapunk
  * `IF NOT EXISTS` opcionalis, ha tartalmazza a parancs, akkor nem fogunk hibat kapni, ha mar nem letezik a tabla
  
  
<br>     
<br>     
<br>     

- **ALTER**: tabla modositasa   
https://www.mysqltutorial.org/mysql-alter-table.aspx
  ```sql
    ALTER TABLE table_name ...  
  ```     
  
  itt tudunk hozzaadni, torolni, modositani (atnevezni, tipust, megszoritasokat valtoztatni) oszlopokat, illetve tablat atnevezni <br>
  ami mindegyikben kozos az az `ALTER TABLE` es a modositani kivant tabla neve
  * **tabla atnevezese** 
      ``` sql
        ALTER TABLE table_name
        RENAME TO new_table_name;    
      ```
      `table_name` a tabla eredeti neve, a `new_table_name` pedig amire at akarjuk nevezni
  * **oszlop torlese** a tablabol
    ``` sql
        ALTER TABLE table_name
        DROP COLUMN column_name;
    ```
    `DROP COLUMN` letezo oszlop neve a tablaban (ha van ra hivatkozo foreign key, akkor eloszor azt kell torolni)
  * **oszlop atnevezese** a tablaban
    ```sql
        ALTER TABLE table_name
        CHANGE COLUMN original_name new_name column_definition
        [FIRST | AFTER column_name];
    ```
    `CHANGE COLUMN` utan az oszlop regi neve majd az uj, ezutan pedig a definicioja (tipus, megszoritasok) <br>
    `FIRST` (oszlop sorrendjenek beallitasa a tablaban) segitsegevel a tablaban ez lesz az elso oszlop <br>
    `AFTER column_name` (oszlop sorrendjenek beallitasa a tablaban) az uj oszlop a megadott oszlop nev utan fog elhelyezkedni <br>
    ha nincs beallitva se a `FIRST` se az `AFTER`, akkor az utolso oszlopkent jelenik majd meg a tablaban <br> 
    //ezzel az oszlop definiciojat is meg tudjuk valtoztatni 
    
     
  * **oszlop(ok) modositasa** a tablaban
    ``` sql
        ALTER TABLE table_name
        MODIFY column_name column_definition [ FIRST | AFTER column_name]   
        [, MODIFY column_name column_definition [ FIRST | AFTER column_name], ...];  
    ```   
    vesszovel elvalasztva akar tobb oszlopot is modosithatunk a `MODIFY` parancs segitsegevel <br>
    annyiban ter el a `CHANGE COLUMN` -tol, hogy itt nem tudjuk megvaltoztatni az oszlop nevet, csak a definiciojat (tipus, megszoritasok)
    
  * **oszlop(ok) hozzaadasa** a tablahoz
      ``` sql
        ALTER TABLE table_name
        ADD new_column_name column_definition
        [FIRST | AFTER column_name]
      ```  
    `ADD` parancs utan az uj oszlopunk neve, illetve annak definicioja (tipus, megszoritasok) <br>
     sorrendjet a tablaban hasonloan a korabbiakhoz a FIRST, AFTER segitsegevel tudjuk meghatarozni ha szukseges
     
----
## Ideiglenes (temporary) tablak:

- nagyon hasonlo a szimpla tablakhoz annyi kulonbseggel, h nem veglegesek, ezek a tablak automatikusan torlodnek a session/connection lezarasakor (egy connection pl a terminal, amit hasznalunk workbenchbol, minden terminal sajat connectiont hasznal)
- ez azt is jelenti, h a temp (ideiglenes) tabla, csak a connectionon belul letezik es csak onnan erheto el
- temp tablanak lehet ugyanaz a neve, viszont nem ajanlott ugyanazt hasznalni (tobb connectionon belul is lehet ugyanazt a temp tabla nevet hasznalni, hiszen az csak azon belul letezik)

    **TEMPORARY** kulcsszo megadasaval tudjuk letrehozni es torolni a temp tablakat:
    ```sql
    CREATE TEMPORARY TABLE ...;
  
    DROP TEMPORARY TABLE ...;
    ```
  
- ezek a tablak altalaban akkor nagyon hasznosak, ha nem akarunk egy nagyon nagy queryt irni, vagy azoknak az egymasba agyazasa tul sok eroforrast/idot eredemenyezne <br>
ilyenkor a reszeredmenyeket ki tujuk menteni egy ideiglenes tablaba, majd azt hasznalni a kesobbiekben  
  
  
----

**DESCRIBE**

meg egy utasitast erdemes megemlitenunk, a tabla strukturajat a workbenchben egyszeruen meg tudjuk tekinteni bal oldalt, a schema alatt, az adatbazison es a tablan belul lenyitogatva a fuleket
<br>
illetve egy mysql parancs segitsegevel: 
``` sql 
DESCRIBE table_name;
```
----

adattipusok:


|Szam tipusok | 	Megjegyzes|
|:----------|:-------------|
|TINYINT |	A very small integer |
|SMALLINT |	A small integer |
|MEDIUMINT |	A medium-sized integer |
|INT |	A standard integer |
|BIGINT |	A large integer |
|DECIMAL |	A fixed-point number |
|FLOAT |	A single-precision floating point number |
|DOUBLE |	A double-precision floating point number |
|BIT |	A bit field |

|Szoveges tipusok	| Megjegyzes |
|:----------|:-------------|
|CHAR |	A fixed-length nonbinary (character) string |
|VARCHAR |	A variable-length non-binary string |
|BINARY |	A fixed-length binary string |
|VARBINARY |	A variable-length binary string |
|TINYBLOB |	A very small BLOB (binary large object) |
|BLOB |	A small BLOB |
|MEDIUMBLOB |	A medium-sized BLOB |
|LONGBLOB |	A large BLOB |
|TINYTEXT |	A very small non-binary string |
|TEXT |	A small non-binary string |
|MEDIUMTEXT |	A medium-sized non-binary string |
|LONGTEXT |	A large non-binary string |
|ENUM |	An enumeration; each column value may be assigned one enumeration member |
|SET |	A set; each column value may be assigned zero or more SET members |

| Datum tipusok |	Megjegyzes |
|:----------|:-------------|
|DATE |	A date value in CCYY-MM-DD format |
|TIME |	A time value in hh:mm:ss format |
|DATETIME |	A date and time value inCCYY-MM-DD hh:mm:ssformat |
|TIMESTAMP |	A timestamp value in CCYY-MM-DD hh:mm:ss format |
|YEAR |	A year value in CCYY or YY format |     
    
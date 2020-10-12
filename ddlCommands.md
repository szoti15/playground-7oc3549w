###DDL utasitasok:

####Adatbazison vegzett muveletek:
      
- CREATE, adatbazis letrehozasa      
https://www.mysqltutorial.org/mysql-create-database/
    ```
    CREATE DATABASE [IF NOT EXISTS] database_name
    [CHARACTER SET charset_name]
    [COLLATE collation_name]
    ```

    * `CREATE DATABASE database_name` az alap parancs, ezutan kotelezo egy adatbazis nev megadasa (database_name helyere), ha mar letezik ezen a neven adatbazis, akkor egy hibat fogunk kapni
    * `IF NOT EXISTS` opcionalis, ha tartalmazza a parancs, akkor nem fogunk hibat kapni, ha mar letezik ezen a neven adatbazis
    * `CHARACTER SET charset_name` es `COLLACTE collation_name` opcionalisak, a karakter halmaz es az arra vonatkozo szabalyok meghatarozasara (pl ascii, utf-8, stb)
    kezdo szinten ez nem annyira fontos, emlites szintjen jo tudni rola, h ez is beallithato
    
- DROP, adatbazis torlese    
https://www.mysqltutorial.org/mysql-drop-database/

    `DROP DATABASE [IF EXISTS] database_name`
    
    * `DROP DATABASE database_name`, a megadott neven letezo adatbazis torlese, ha nem letezik hibat kapunk
    * `IF NOT EXISTS` opcionalis, ha tartalmazza a parancs, akkor nem fogunk hibat kapni, ha nem letezik ezen a neven adatbazis
    
    
####Tablakon vegzett muveletek:

a tabla, hasonloan egy excel vagy access szintu tablahoz egy matriz, melynek az oszlopai az objektumokat leiro jellemzok, a sorai pedig az adatok
pl:

| keresztnev   |     vezeteknev      |  emailcim |
|----------|:-------------:|------:|
| zoltan |  szotak | szoti15@gmail.com |
| viktoria |   nagy   |   nagyviktoria16@gmail.com |

a tabla a felhasznalok tarolasara lett letrehozva (maguk az objektumok a konkret felhasznalok)
1 objektum pl:  zoltan   szotak  szoti15@gmail.com, az o adatait az oszlopok hatarozzak meg (objektum tulajdonsagai)

- CREATE, tabla letrehozasa   
https://www.mysqltutorial.org/mysql-create-table/
    ```
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
    
 * oszlop definiciok:   
    `column_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] [column_constraint];`
    *  `column_name data_type(length)`: az oszlop neve a column_name helyere, data_type(lenght) helyere pedig az oszlop adattipusa
    * adattipusok: https://www.mysqltutorial.org/mysql-data-types.aspx (fobb tipusok:)
    
     |Numeric Types | 	Description|
     |----------|-------------:|
     |TINYINT |	A very small integer |
     |SMALLINT |	A small integer |
     |MEDIUMINT |	A medium-sized integer |
     |INT |	A standard integer |
     |BIGINT |	A large integer |
     |DECIMAL |	A fixed-point number |
     |FLOAT |	A single-precision floating point number |
     |DOUBLE |	A double-precision floating point number |
     |BIT |	A bit field |
     
      |String Types	| Description |
      |----------|-------------:|
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
      
      | Date and Time Types |	Description |
      |----------|-------------:|
      |DATE |	A date value in CCYY-MM-DD format |
      |TIME |	A time value in hh:mm:ss format |
      |DATETIME |	A date and time value inCCYY-MM-DD hh:mm:ssformat |
      |TIMESTAMP |	A timestamp value in CCYY-MM-DD hh:mm:ss format |
      |YEAR |	A year value in CCYY or YY format |
      
      legtobbhoz megadhato a maximalis hossza a tipusnak pl: INT(3) - 3 jegyu egesz szamok, VARCHAR(500) - 500 karakter hosszu szoveg
      
      * `NOT NULL`, alapertelmezetten letrehozott oszlopok tartalmazhatnak NULL erteket (azaz, nem kotelezo, h tartalmazzanak adatot), a NOT NULL segitsegevel kikothetjuk, h az oszlopba mindig kotelezo erteket szurni
  (ezek mellett siman hasznalhatjuk a NOT nelkul a NULL-t is az oszlop definiciojaban, ami azt koti ki, h tartalmazhat az oszlop nullokat, mivel ez az alapertelmezett, ezert ezt nem kotelezo megadni)
      * `DEFAULT value`, az oszlopban talalhato alapertelmezett ertek lesz, value helyere a konkret ertek, ha nem adunk meg adatot, akkor ezzel jon letre a sor (pl szamoknal lehet a 0)
      * `AUTO_INCREMENT`, egy tablaban csak 1 ilyen oszlop lehet, szam tipusu oszlopra csak es az erteke minden egyes sor beszurasakor automatikusan noni fog egyel (mivel automatikusan beallitodik ez az ertek ezert altban ezeknel az oszlopoknak nem tudunk kezzel beallitani erteket) 
      * `column_constraint` oszlop szintu megszoritasok: UNIQUE, CHECK, PRIMARY KEY
        * `UNIQUE`, az ilyen tipusu oszlopok ertekei egyediek, azaz egy ertek csak egyszer szerepelhet a tablaban ugyanabban az oszlopban (a unique nem zarja ki a null ertekeket, ezekbol lehet tobb is a tablaban, mivel ezek hianyzo ertekek)
        * `CHEK (expression)`: ahol az expression egy igaz-hamis ertekkel visszater kifejezes, az adat beszurasakor lefut ez az ellenorzes es ha nem teljesul, akkor hibat eredmenyez pl:  `cost INT NOT NULL CHECK (cost >= 0)`, csak 0 vagy attol nagyobb erteket lehet beszurni
        * `PRIMARY KEY`: a tabla elsodleges kulcsa, az elsodleges kulcs nem tartalmazhat nullokat es egyedinek kell lennie (ez az ami egy sort egyedileg meg tud hatarozni egy tablaban), emiatt csak 1 primary key lehet egy tablaban (ez nem jelenti azt, h csak egy oszlop... lasd kesobb), lenyegeben a PRIMARY KEY a UNIQUE es a NOT NULL kombinacioja
  
  
  * `table_constraints` tabla szintu megszoritasok, amiket az oszlop definiciok utan tudunk medadni, ezekbol 4 fele van (minimalisan kulonboznek az oszlop szintu megszoritasoktol):
    * `PRIMARY KEY`: elsodleges kulcs megadasa, annyi kulonbseggel, h tobb oszlop egyuttesen beallithato egy kulcsnak, tehat egyutt kell teljesulnie, h nem null-osok es egyutt (az oszlopok kombinacioi) egyediek 
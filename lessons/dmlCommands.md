# DML utasitasok (alapok):
      
- **SELECT**: adatok lekerdezese tablakbol
https://www.mysqltutorial.org/mysql-select-statement-query-data.aspx

    egyszerubb szintaxis:
    ``` sql 
    SELECT
    [DISTINCT]
    select_expr [, select_expr] ...
    [into_option]
    [FROM table_references
    [WHERE where_condition]
    [GROUP BY col_name_list]
    [HAVING where_condition]
    [ORDER BY col_name [ASC | DESC], ... ]
    [LIMIT row_count]

    ```
  
  - `SELECT` maga az utasitas
  - `DISTINCT` alapertelmezetten az sql nem szuri ki a dupla sorokat az eredmenybol, a `DISTINCT` megadasaval viszont ezt egyszeruen elerhetjuk
  - `select_expr` oszlopok nevei, vagy azzal megegyezo kifejezes vesszovel elvalasztva (ezek az oszlopok ertekei fognak latszodni az eredmenyben)
  - `into_option` az eredmenyt egybol kimenthetjuk egy valtozoba / tablaba 
  - `FROM table_references` FROM kulcsszo utan a tablak felsorolasa, amikbol szeretnenk kinyerni az adatokat
  - `WHERE where_condition` WHERE kulcsszo utan a feltetelek felsorolasa (logikai erteku kifejezesek, AND-del es OR-ral osszekapcsolva)
  - `GROUP BY col_name_list` GROUP BY kulcsszo utan felsorolt oszlopok ertekei alapjan csoportosithatjuk a sorokat
  - `HAVING where_condition` HAVING kulcsszo utan logikai kifejezesek, ugyanaz, mint a `WHERE`, annyi kivetellel, h a `GROUP BY` altal osszecsoportositott sorokon vegzi a szurest
  - `ORDER BY col_name` ORDER BY kulcsszo utan felsorolt oszlopok alapjan fogja rendezni az eredmenyt (oszloponkent megadhatoak rendezesre vonatkozo opciok: ASC (ascending) - novekvo, DESC (descending) - csokkeno sorrend)
  - `LIMIT row_count` LIMIT kulcsszo utan megadott szammal limitalhatjuk az eredmenyben visszakapott sorok szamat
  
- **INSERT INTO**: sorok beszurasa a tablaba <br>
https://www.mysqltutorial.org/mysql-insert-statement.aspx
   egyszerubb szintaxis:
  ``` sql   
  INSERT INTO table_name (c1,c2,...)
  [VALUES (v1,v2,...), ... | select_expression];
  ```
  
  - `INSERT INTO` maga az utasitas
  - `table_name` a tabla neve, ahova uj sor(oka)t akarunk beszurni
  - `(c1,c2,...)` sorrendben az oszlopok nevei, ahova az ertekeket akarjuk beszurni
  - `VALUES (v1, v2, ...)` ezutan vagy `VALUES` kulcsszo utan felsorolassal megadjuk a beszurando ertekeket pl: VALUES (1, 'Zoli', 3), (5, 'Totyi', 7)
  - `select_expression` vagy egy `SELECT` utasitas segitsegevel hozzaadjuk annak eredmenyet a tablahoz
  - a parametereknel sorrendi kotes van, tehat a c1 oszlopba a v1 erteket fogjuk beallitani, a c2-be a v2- es igy tovabb, mindig annyi erteknek kell lennie, ahany oszlopot felsoroltunk az utasitasban
  
 - **UPDATE**: adatok modositasa a tabla soraiban <br> 
 https://www.mysqltutorial.org/mysql-update-data.aspx
  egyszerubb szintaxis:
     ``` sql 
    UPDATE [LOW_PRIORITY] [IGNORE] table_name 
    SET 
        column_name1 = expr1,
        column_name2 = expr2,
        ...
    [WHERE condition];
    ```
   
   - `UPDATE` maga a parancs
   - `LOW_PRIORITY` a parancs addig varakozik, amig mar nem olvassa senki a tablat 
   - `IGNORE` a hibak figyelmen kivul hagyasa, (emlekezteto, ha barmikor hiba keletkezik, a futas megszakad, ezt azt is eredmenyezheti, h 1 hibas sor miatt, csak a tabla egy reszet sikerul befrissiteni, ha IGNORE be van kapcsolva, akkor a hiba ellenere is megprobalja az osszes erintett sor modositasat)
   - `SET column_name1 = expr1, ...` SET kucsszo utan az oszlop neve es = jel utan pedig az ertek, amire be szeretnenk allitani azt (itt nem csak konkret ertekeket hasznalhatunk, hanem hivatkozhatunk mas oszlopokban talalhato ertekekre) pl: `SET name = 'zoltan'` vagy `SET name = keresztnev + ' ' + vezeteknev` (a + jel a szovegek osszefuzese)
   - `WEHRE condition` WHERE kulcsszo utan felsorolhatunk felteteleket, amik megmondjak, h a tabla mely sorait akarjuk modositani
  
 - **DELETE**: adatok torlese a tablabol <br>
 https://www.mysqltutorial.org/mysql-delete-statement.aspx
  egyszerubb szintaxis:
     ``` sql 
     DELETE FROM table_name
     WHERE condition;   
    ```   
   - `DELETE FROM` maga a parancs
   - `table_name` a tabla neve, ahonnan torolni szeretnenk sorokat
   - `WHERE condition` hasonloan a `SELECT` es `UPDATE` -hez, meg tudjuk hatarozni, h mely sorokat akarjuk torolni
   
<br>
<br>   


---

#### Peldak

- keszitsunk egy tablat a korabban letrehozott `table_test` adatbazisunkban

    ``` sql 
       CREATE TABLE IF NOT EXISTS  Users(
           identification_number VARCHAR(100), 
           name VARCHAR(500),
           email VARCHAR(500),
           date_of_birth DATE,
           address VARCHAR(1000),
           gender TINYINT,
           salary INT
        ) ;
    ```
   
- `INSERT` segitsegevel szurjunk be nehany sort
    ``` sql 
    INSERT INTO Users (identification_number, name, email, date_of_birth, address, gender, salary)
    VALUES ('1234567-SA', 'Zoltan Szotak', 'szoti15@gmail.com', '1991-02-15', 'US. Bridgeport...', 1, 12345),    
           ('8912345-SA', 'Nagy Viktoria', 'nagyviktoria16@gmail.com', '1992-09-14', 'US. Bridgeport...', 0, 0);
    ``` 
 
<br>
 
- majd kerdezzuk le a tabla tartalmat:
    ``` sql 
    SELECT * FROM Users;    
    ```   
<br>

- kerdezzuk le csak a ferfiakat (ahol a gender oszlopban talalhato ertek 1):
    ``` sql 
    SELECT * FROM Users WHERE gender = 1;    
    ```   
<br>

- kerdezzuk le az adatokat nevsor szerint novekvo sorrendben:
    ``` sql 
    SELECT * FROM Users ORDER BY name ASC;    
    ```   
<br>

- allitsuk be viktoria fizeteset 500-ra
    ``` sql 
    UPDATE Users SET salary = 500 WHERE name = 'Nagy Viktoria';
      
    SELECT * FROM Users;    
    ```
- allitsuk at mindenki cimet ures szovegre (azaz toroljuk ki a cimeket)
    ``` sql 
    UPDATE Users SET address = '';
      
    SELECT * FROM Users;    
    ```     
 - toroljuk azokat, akik 1992 elott szulettek
     ``` sql 
     DELETE FROM Users WHERE date_of_birth < '1992-01-01';
       
     SELECT * FROM Users;    
     ```     
    (workbench alapbol nem engedi igy, a preferences / sql editor alatt ki kell venni a pipat a safe mode-bol:
    `Safe Updates (rejects UPDATEs and DELETEs wih no restrictions)`) <br>
    ha ez megvan, akkor ujra kell kapcsolodni a serverhez (fent a connection bezarasaval, workbench ujrainditasaval)
     
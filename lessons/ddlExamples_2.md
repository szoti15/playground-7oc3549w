# DDL peldak 2. resz:

Most hogy mar ismerjuk a DML utasitasok alapjait, reszletesebben ki tudjuk probalni a DDL utasitasokat es a veluk kapcsolatos opciokat.
<br>
<br>
<br>

---

**Order_status**
 
   - amit hasznalni fogunk: `AUTO_INCREMENT`, `PRIMARY KEY` (egyszeru kulcs), `UNIQUE`, `NOT NULL` 
 
 <br>
 <br>
 <br>
 
   a kovetkezo peldakat a korabban letrehozott adatbazisunkon fogjuk vegrehajtani
   ``` sql 
     USE table_test;
   ```
   
   kezitsuk el a kovetkezo tablat:
   
   ``` sql
     CREATE TABLE Order_status (
        status_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(500) UNIQUE
     );
   ``` 
   - a tabla fogja tartalmazni az elerheto statuszait egy rendelesnek, ezt a tipusu adatot Enumoknak (enumeration) nek is hivjuk, ami egy rendezett listaja olyan ertekeknek, amik nem vagy csak nagyon ritkan valtoznak
   - `status_id`: ez fogja azonositani a sort, egesz szam tipusu, elsodleges kulcs (egyedi es nem lehet null), illetve az erteke automatikusan noni fog egyel
   - `name`: ez lesz a statusz neve, 500 karakter hosszu szoveg, ertekenek egyedinek kell lennie 
    
<br>
<br>
    
   szurjunk be ertekeket a tablaba: 
   ``` sql 
   INSERT INTO Order_status (status_id, name)
   VALUES (1, 'RENDELES ALATT');
  
   SELECT * FROM Order_status;
   ```     
      
   itt jelenleg a status_id-nak adtunk konkret erteket, viszont rajta van az AUTO_INCREMENT, igy ha nem adunk meg erteket, az utolso hasznalt ertektol fogja folyatatni a sort, attol egyel nagyobb lesz a kovetkezo id <br> 
   ez akkor is igaz, h ha kozben kitoroltunk par sort, pl: beszurunk 1, 2, 3, 4, 5 id-kat, kitoroljuk az 5-ost, akkor a kovetkezo sor szama 6 lesz
   
   ``` sql 
  INSERT INTO Order_status (name)
  VALUES ('RENDELES FELDOLGOZAS ALATT'),
         ('CSOMAG OSSZEALLITASA FOLYAMATBAN'),
         ('KISZALLITAS FOLYAMATBAN'),
         ('RENDELES TELJESITVE');
 
  SELECT * FROM Order_status ORDER BY status_id;
  
  DELETE FROM Order_status WHERE status_id = 5;
  SELECT * FROM Order_status ORDER BY status_id;
  
  INSERT INTO Order_status (name)
  VALUES ('RENDELES TELJESITVE');
  
  SELECT * FROM Order_status ORDER BY status_id;
  ``` 
  
  eredmeny:
  ``` 
  1,'RENDELES ALATT'
  2,'RENDELES FELDOLGOZAS ALATT'
  3,'CSOMAG OSSZEALLITASA FOLYAMATBAN'
  4,'KISZALLITAS FOLYAMATBAN'
  6,'RENDELES TELJESITVE'
  ```
<br>
<br>  
  mivel a status_id elsodleges kulcs, ezert annak erteke nem lehet null, illetve egyedinek kell lennie:
  
   ``` sql 
  INSERT INTO Order_status (status_id, name)
  VALUES (1, 'RENDELES VISSZAMONDVA');
 
  SELECT * FROM Order_status ORDER BY status_id;
  
  
  INSERT INTO Order_status (status_id, name)
  VALUES (null, 'RENDELES VISSZAMONDVA');
    
  SELECT * FROM Order_status ORDER BY status_id;
  ``` 
    
  az elso insertnel hibat fogunk kapni:  `Duplicate entry '1' for key order_status.PRIMARY` <br><br>
  viszont a masodik parancsnal nem, ez azert lehetseges, mert az `AUTO_INCREMENT` miatt nem `NULL`-t akar beszurni, hanem olyan, mintha nem toltenenk ki ertekkel az oszlopot, igy automatikusan noveli es rendeli hozza az erteket<br>
  ez igaz akkor is, h ha `DEFAULT` van beallitva, annyi kulonbseggel, h a `DEFAULT` mindig ugyanazt az eredmenyt allitja be ilyenkor
  
  <br>
  <br>  
  
  a name `UNIQUE` megszoritast kapott, az ertekeknek egyedinek kell lennie (viszont tartalmazhat `NULL`-okat):
  
  ``` sql 
    INSERT INTO Order_status (name)
    VALUES ('RENDELES VISSZAMONDVA');
  ```     
  
  a kovetkezo hibat kapjuk, mivel mar tartalmazza a tabla ezt az erteket: `Duplicate entry 'RENDELES VISSZAMONDVA' for key order_status.name`
  
  <br>
  
  mivel a `NULL` egy specialis ertek, ami azt jelenti, h nincs kitoltve az adott sor oszlopa ertekkel, ezert ebbol tobbet is beszurhatunk (nem vonatkozik ra az egyediseg szabalya)
  
  ``` sql 
   INSERT INTO Order_status (name)
   VALUES (NULL);
  
   INSERT INTO Order_status (name)
   VALUES (NULL);
  
   SELECT * FROM Order_status ORDER BY status_id;
  ```  
  
  eredmeny:  
  ``` 
  1 ,'RENDELES ALATT'
  2 ,'RENDELES FELDOLGOZAS ALATT'
  3 ,'CSOMAG OSSZEALLITASA FOLYAMATBAN'
  4 ,'KISZALLITAS FOLYAMATBAN'
  6 ,'RENDELES TELJESITVE'
  7 ,'RENDELES VISSZAMONDVA'
  9 ,NULL
  10,NULL

  ```  
  <br>  
    
  el szeretnenk kerulni, h a `name` null ertekeket tartalmazzon (nincs ertelme olyan statusznak, aminek nincs neve) <br>
  ezert modositsuk ugy az oszlopot, h a `name` ne tartalmazhasson null ertekeket  
    
  ``` sql 
    ALTER TABLE Order_status 
    MODIFY name VARCHAR(500) NOT NULL UNIQUE;
  ```  
  ez az utasitas hibat fog eredmenyezni, hiszen egy olyan oszlopra szeretnenk a `NOT NULL` megszoritast rarakni, ami mar tartalmaz `NULL` ertekeket, <br>  
  ahhoz hogy ezt elerjuk, meg kell szabadulnunk a `NULL` ertekektol, ezert toroljuk oket (`UPDATE`-tel is ugyanugy elerheto ez, ha `NULL` helyett tenyleges erteket allitunk be nekik) <br>
  (`NULL` ertekekhez specialis operatorok tartoznak, nem hasznalhatjuk a = vagy != operatorokat, helyettuk az `IS NULL` es `IS NOT NULL` kell)
  
  ``` sql 
  DELETE FROM Order_status WHERE name IS NULL;

  ALTER TABLE Order_status 
  MODIFY name VARCHAR(500) NOT NULL UNIQUE;

  INSERT INTO Order_status (name)
  VALUES (NULL);
  ```  
    
  igy mar le tudjuk futtatni az `ALTER` parancsot, illetve megprobalhatunk ismet hozzaadni `NULL` name ertekkel egy uj sort, viszont ez hibat fog eredmenyezni: <br>
  `Column 'name' cannot be null`
     
  <br>
  <br>
  <br>
  <br>
  
---
  
  **Orders**
  - amit hasznalni fogunk: `AUTO_INCREMENT`, `PRIMARY KEY` (egyszeru kulcs), `UNIQUE`, `NOT NULL`, `DEFAULT`, `CHECK` (oszlopon es tablan), `GENERATED ALWAYS AS` (STORED es VIRTUAL), `FOREIGN KEY` 
  
  
  ``` sql 
    CREATE TABLE Orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE NOT NULL,
        shipped_date DATE NULL,
        status_id INT NOT NULL,
        comments VARCHAR(2000) DEFAULT 'no comment',
        tax DOUBLE NOT NULL DEFAULT 20.5,
        price DOUBLE NOT NULL CHECK(price > 0),
        total_price INT GENERATED ALWAYS AS (price + (price * tax / 100)) STORED,
        
        FOREIGN KEY (status_id) REFERENCES Order_status (status_id) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT tax_ellenorzes CHECK (tax > 0 AND total_price < 100000000)
    );    
  ```
  
  - a tabla fogja tartalmazni a rendeleseket
  - `order_id`: ez fogja azonositani a sort, egesz szam tipusu, elsodleges kulcs (egyedi es nem lehet null), illetve az erteke automatikusan noni fog egyel
  - `order_date`: a megrendeles napja, datum tipusu, erteke nem lehet null
  - `shipped_date`: csomag feladasanak napja, datum tipusu, erteke lehet null (kezdetben nem tudjuk, kesobb fogjuk beallitani az erteket)
  - `status_id`: megrendeles statuszanak azonositoja, szam tipusu, nem lehet null, `FOREIGN KEY` segitsegevel beallitjuk, h az Order_status (amit korabban csinaltunk) tablaban talalhato ertekek lehetnek csak az ertekei
  - `comments`: kommentek, 2000 karakter hosszu szoveg, ha `INSERT`-nel nincs meghatarozva az erteke, akkor alapertelmezetten `no comment` lesz beszurva
  - `tax`: afat tartalmazza, racionalis szam, erteke nem lehet null, ha nincs meghatarozva beszuraskor az erteke, akkor alapertelmezettkent 20.5 -t fog lementodni
  - `price`: a rendeles osszege, racionalis szam, nem lehet null, `CHECK` segitsegevel beallitottuk, hogy 0-tol csak nagyobb ertekeket vehet fel
  - `total_price`: a rendeles vegosszege (fizetendo), egesz szam, erteke a sor beszurasakor / modositasakor automatikusan generalodik es lementodik az oszlopba: price + (price * tax / 100) keplettel 
  - tabla szinten van meg egy kulso kulcs a status_id-ra, illetve egy ellenorzes: tax > 0 AND total_price < 100000000 <br>
  - tabla szintu megszoritasokban tobb oszlopra is hivatkozhatunk egyszerre, (a jelenlegi ellenorzeseket oszlop szinten is megadhattuk volna, vannak esetek, ahol ez nem lehetseges, illetve igy sajat nevet is tudunk adni a megszoritasunknak)
       
    <br>
    <br>
        
  szurjunk be ertekeket a tablaba: 
    
  ``` sql 
  INSERT INTO Orders (order_date, status_id, price)
  VALUES ('2020-10-16', 1, 1234.56);
   
  SELECT * FROM Orders ORDER BY order_id;
  ```  
    
  csak a kotelezo ertekeket szurtuk be, ahol nem volt `DEFAULT`, `AUTO_INCREMENT` vagy `GENERATED ALWAYS AS` beallitva, illetve az erteke nem lehet `NULL` <br>
  az automatikusan toltott ertekek kozul mar ismerjuk az `AUTO_INCREMENT`-et, viszont meg nem talalkoztunk a `GENERATED ALWAYS AS` es a `DEFAULT` megszoritassal: <br> <br>
  - `GENERATED ALWAYS AS` erteke a megadott kifejezesbol szamolodik, jelen esetben ez a total_price, aminek az erteke:  price * tax / 100 => 253.0848 plusz a price 1234.56, aminek az eredmenye: 1487.6448 <br>
  mivel a total_price, csak egesz szamokat tartalmazhat, ezert a szam kerekitodik, a tort resz automatikusan levagasra kerul, igy az oszlopban 1488 lesz az ertek  
  - `DEFAULT` ha az `INSERT`-nel nincs megadva az ertek, akkor ez kerul beallitasra, pl `comments` oszlopba bekerult a `no comment` ertek, illetve a `tax` oszlopba is bekerult a 20.5
  
  <br>
  
  szurjunk be ismet egy sort, am most toltsuk ki a default oszlopok ertekeit is
  
  ``` sql 
  INSERT INTO Orders (order_date, status_id, price, comments, tax)
  VALUES ('2020-10-16', 1, 1234.56, 'elso komment', 10);
   
  SELECT * FROM Orders ORDER BY order_id;
  
  ```
  
  az elozo sorral osszehasonlitva latjuk, hogy a comments es tax az `INSERT`-nel medadott ertekeket vette fel, illetve a `total_price` erteke, annak ellenere, h a price ugyanaz volt, a tax ertekehez merten valtozott
        
  <br>
  <br>
  <br>

  most vizsgaljuk meg a `CHECK` altal letrehozott megszoritasokat:
  
  ``` sql 
    INSERT INTO Orders (order_date, status_id, price, comments)
    VALUES ('2020-10-16', 1, -1, 'price osszege tul alacsony');
  ```

  a kovetkezo hibat kapjuk: `Check constraint 'orders_chk_1' is violated`, azaz sertettuk az `orders_chk_1` megszoritast, ezt a nevet az sql server generalta es rendelte hozza a megszoritashoz <br>
  a kovetkezo utasitas segitsegevel, lekerdezhetjuk az `Orders` tablahoz tartozo definiciot (sql server tarol):
  
  
  ``` sql 
    SHOW CREATE TABLE Orders;
  ```
  eredmeny:  
  ``` sql 
   CREATE TABLE `Orders` (
    `order_id` int NOT NULL AUTO_INCREMENT,
    `order_date` date NOT NULL,
    `shipped_date` date DEFAULT NULL,
    `status_id` int NOT NULL,
    `comments` varchar(2000) DEFAULT 'no comment',
    `tax` double NOT NULL DEFAULT '20.5',
    `price` double NOT NULL,
    `total_price` int GENERATED ALWAYS AS ((`price` + ((`price` * `tax`) / 100))) STORED,
    PRIMARY KEY (`order_id`),
    KEY `status_id` (`status_id`),
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `Order_status` (`status_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `orders_chk_1` CHECK ((`price` > 0)),
    CONSTRAINT `tax_ellenorzes` CHECK (((`tax` > 0) and (`total_price` < 100000000)))
  ) 
  ```
  itt lathato, h az oszlop szintu `CHECK`-et az sql server tabla szinten hozta letre es az `orders_chk_1` nevet generalta hozza, illetve a masik `CHECK`-nel, ahol megadtuk a nevet, ott azzal hozta letre a megszoritast `tax_ellenorzes`  
  
  <br>
  <br>
  probaljuk meg most a taxra letrehozott feltetelt megserteni:
  
  ``` sql 
    INSERT INTO Orders (order_date, status_id, price, comments, tax)
    VALUES ('2020-10-16', 1, 1, 'tax tul alacsony', -1);
  ```
    
   a kovetkezo hibat kapjuk: `Check constraint 'tax_ellenorzes' is violated`, "tax > 0 AND total_price < 100000000" erteke false lesz, hiszen taxnak -1 -et szerettunk volna lementeni
   
   <br>
   <br>
   <br>
   <br>
   
   vizsgaljuk meg a `FOREIGN KEY` altal letrehozott megszoritast, ez azt hatarozza meg, h ertekeit, csak az `Order_status` `status_id` oszlopabol veheti fel <br>
   jelenleg ezek az ertekek: 1, 2, 3, 4, 6, 7 
   
   ``` sql 
      INSERT INTO Orders (order_date, status_id, price, comments)
      VALUES ('2020-10-16', 5, 1, 'nincs ilyen status');
   ```
   
   a kovetkezo hibat kapjuk: `cannot add or update a child row: a foreign key contraint fails ...` <br>
   mivel olyan erteket (5) probaltunk beszurni, ami nem letezik
   
   <br>
   <br>
   
   hivatkozott tabla (Order_status) modositasakor bekovetkezo esemenyek vizsgalata, ehhez szurjunk be nehany teszt sort:
   
  ``` sql 
     INSERT INTO Orders (order_date, status_id, price)
     VALUES ('2020-10-16', 6, 1),
      ('2020-10-16', 6, 2),
      ('2020-10-16', 2, 3),
      ('2020-10-16', 2, 4);

     SELECT * FROM Orders ORDER BY order_id;
  ```
   eredmeny (csak az ujonnan beszurt sorokat kiemelve):
   ``` 
       2, '2020-10-16', NULL, 6,' no comment', 20.5, 1, 1
       3, '2020-10-16', NULL, 6,' no comment', 20.5, 2, 2
       4, '2020-10-16', NULL, 2,' no comment', 20.5, 3, 4
       5, '2020-10-16', NULL, 2,' no comment', 20.5, 4, 5
   ```
   
   majd a hivatkozott (Order_status) tablaban modositsuk a 2-es status id-jat, illetve toroljuk ki a 6-os idju sort (parancsokat kulon-kulon futtatva):
   
   ``` sql 
        UPDATE Order_status SET status_id = 15 WHERE status_id = 2;

        DELETE FROM Order_status WHERE status_id = 6;
    
        SELECT * FROM Orders ORDER BY order_id;
   ```
   eredmeny (csak az ujonnan beszurt sorokat kiemelve):
  ``` 
      2, '2020-10-16', NULL, 6,' no comment', 20.5, 1, 1
      3, '2020-10-16', NULL, 6,' no comment', 20.5, 2, 2
      4, '2020-10-16', NULL, 15,' no comment', 20.5, 3, 4
      5, '2020-10-16', NULL, 15,' no comment', 20.5, 4, 5
  ``` 
    
  - az `UPDATE` eredmenyekent, az `Orders` tablaban levo soroknal, ahol 2 status_id volt, ott is megvaltozott 15-re, ez annak koszonheto, hogy az `ON UPDATE CASCADE` opcio meg volt adva a `FOREIGN KEY`-nel <br>
  tehat a hivatkozott tablaban torteno `UPDATE` megjelenik a hivatkozo tablaban is (a `CASCADE` miatt)
  
  - a `DELETE` parancs hibat eredmenyezett, mivel az `ON DELETE RESTRICT` be volt allitva, ami megakadalyozza a hivatkozott (Order_status) tablabol valo torlest, ha van ra hivatkozas, a 6-os ertekre pont volt, igy nem tudtuk torolni
  
  <br>
  
  ``` sql 
    DELETE FROM Orders WHERE status_id = 6;
    DELETE  FROM Order_status WHERE status_id = 6; 
  ```   
  miutan kitoroltuk az `Orders` (hivatkozo) tablabol a 6-os status_id-val rendelkezo sorokat, gond nelkul torolheto az `Order_status` (hivatkozott) tablabol is  
    
<br>
<br>

---

**Customers**
- amit hasznalni fogunk: `PRIMARY KEY` (osszetett kulcs), `UNIQUE` (tabla szintu, osszetett) 

  ``` sql 
  CREATE TABLE Customers (
	name VARCHAR(100) NOT NULL,
    address_city VARCHAR(100) NOT NULL,
    address_street VARCHAR(200) NOT NULL,
    address_number INT NOT NULL,
    email_address VARCHAR(500) NOT NULL,
	PRIMARY KEY (email_address, name),
	UNIQUE (name, address_city)
  );   
  ```

  - a tabla fogja tartalmazni a megrendeloket
  - `name`: a megrendelo neve, 100 karakter hosszu szoveg, kotelezo kitolteni
  - `address_city`: megrendelo cimebol a varos, 100 karakter hosszu szoveg, kotelezo kitolteni
  - `address_street`: megrendelo cimebol az utcanev, 200 karakter hosszu szoveg, kotelezo kitolteni
  - `address_number`: megrendelo cimebol a hazszam, 100 karakter hosszu szoveg, kotelezo kitolteni
  - `email_address`: a megrendelo email cime, 500 karakter hosszu szoveg, kotelezo kitolteni
  - tabla szinten egy elsodleges kulcs megadva, ami osszetett, tehat az email es a nev egyuttesen kell, h egyedi legyen es egyik se tartalmazhat `NULL`-t
  - tabla szinten van meg egy osszetett `UNIQUE` megszoritas is, ahol a nev es a varos kell, h egyutt egyedi legyen (de tartalmazhatnak `NULL`-t, aminek nincs jelentosege, hiszen mindket oszlop`NOT NULL`-os)
  
  <br>
  <br>
  
  mivel minden sora `NOT NULL` es nincs egyikhez sincs beallitva automatikusan generalt ertek (`AUTO_INCREMENT`, `DEFAULT`), ezert kenytelenek vagyunk megadni az osszes oszlophoz erteket
  
  ``` sql 
      INSERT INTO Customers (name, address_city, address_street, address_number, email_address) 
      VALUES ('Szotak Tamas', 'Kisvarda', 'Martirok', 20, 'szoti13@gmail.com'),
     		 ('Szotak Adam', 'Kisvarda', 'Martirok', 20, 'szotakadam@gmail.com');
  ```
    
  <br>  
  
  mivel a `UNIQUE` es `PRIMARY KEY` kozott csak az a kulonbseg, hogy a `PK`-ben nem lehet `NULL`-os oszlopot hasznalni, ezert csak az egyiket nezzuk meg peldakon keresztul
  
  <br>
  probaljunk meg beszurni meg1 Szotak Tamas-t Kisvardarol:
  
  ``` sql 
    INSERT INTO Customers (name, address_city, address_street, address_number, email_address) 
                   VALUES ('Szotak Tamas', 'Kisvarda', 'Martirok', 20, 'uj@email.cim');
  ```
  a kovetkezo hibat kapjuk: `Duplicate entry: 'Szotak Tamas-Kisvarda' for key customers.name`, hiszen az elsodleges kulcsunk kimondja, hogy nev-varos parnak egyedinek kell lennie (ugyanabban a varosban nem lehet ket Szotak Tamas :P )
  
  <br>
  masik varosbol erkezo Szotak Tamast gond nelkul hozza tudunk adni a tablahoz
   
  ``` sql 
      INSERT INTO Customers (name, address_city, address_street, address_number, email_address) 
                     VALUES ('Szotak Tamas', 'Trahospuszta', 'Martirok', 20, 'uj@email.cim');
  ```
    
    



- adatbazis: adatok rendezett gyujtemenye amivel valamilyen dolgot vagy folyamatot modellezunk
- relacios adatbazis model fobb szempontjai:
    * relacios model a halmazelmelet relacioirol kapta a nevet
    * az adatok halmazonkenti kelezese es az azokon elvegzett halmazmuveletek a jellemzoek: (unio, metszet, kulonbseg...)
    * a relacio tablakkent jellennek meg, minden relacio rekordokbol (egyedekbol) es mezokbol (jellemzokbol) epul fel
    * a tablak az adatbazis fo elemei, minden tabla egy konkret targyat reprezental (objektum orientalt szemlelethez hasonloan)
    * tablan belul a mezok es a rekordok sorrendje nem szamit
    * egyeb alapfogalmak, amik kesobb jonnek: adatok elerese, modositasa, torlese, letrehozasa | transaction | keys | tablak osszekapcsolasa | index
    
- SQL: structured query language (nyers forditas: strukturalt lekeredezo nyelv), egy megvalositasa a relacios adatbasiz modelnek (az SQL osszenott a relacios adatbazisok fogalmaval)
- az adatok tarolasara es karbantartasara (muveletek elvegzesehez), szukseg van egy sql serverre
- sql serverek kozul tobb valtozat is kialakult az evek soran, attol fuggoen, h melyik ceg keszitette a servert, igy pl:
oracle server, microsoft sql server, mysql server, postgresql server, ezek kozul a mysql-nek van ingyenes valtozata
- sql serverenkent elterhetnek a kulcsszavak vagy utasitasok pl az elso x darab sor lekerdezese lehet TOP (ms sql) vagy LIMIT (postgre)  

- noSql megoldasok, az sql nyelvtol es a relacios adatbazisoktol elszakadtak, kiemelendoek a dokumentum alapu nyelvek, amik az adatokat altban json alapu fileokban taroljak
- jellemzo rajuk, h 1-1 objektum egyben kezelendo minden tulajdonsagaval, emiatt nincs szukseg az sql-ben hasznalt tablak joinolasara, legelterjedtebbek: mongodb, elasticsearch


- a jovoben mysql-el haladunk tovabb (teljesen ingyenes :D)

     
CREATE DATABASE Olimpia;

USE Olimpia;


CREATE TABLE O_ORSZAGOK(AZON INT,
	                    ORSZAG VARCHAR(50),
	                    TERULET INT,
	                    LAKOSSAG INT,
	                    FOVAROS VARCHAR(40),
                        FOLDRESZ VARCHAR(50),
	 CONSTRAINT O_ORSZ_PK PRIMARY KEY (AZON),
     CONSTRAINT O_ORSZ_UK_ORSZ UNIQUE (ORSZAG));

CREATE TABLE O_EREM_TABLA(ORSZAG_AZON INT,
	                      ARANY INT,
	                      EZUST INT,
	                      BRONZ INT,
	 CONSTRAINT O_ET_PK PRIMARY KEY (ORSZAG_AZON),
  	 CONSTRAINT O_ET_FK FOREIGN KEY (ORSZAG_AZON) REFERENCES O_ORSZAGOK (AZON));

CREATE TABLE O_VERSENYZOK(AZON INT,
                          NEV VARCHAR(50),
                          SZUL_DAT DATE,
                          ORSZAG_AZON INT,
                          EGYEN_CSAPAT VARCHAR(1),
                          SZUL_HELY VARCHAR(50),
    CONSTRAINT O_VERS_PK PRIMARY KEY(AZON),
    CONSTRAINT O_VNY_UK UNIQUE (NEV,ORSZAG_AZON,SZUL_DAT),
    CONSTRAINT O_VERS_FK_ORSZ FOREIGN KEY (ORSZAG_AZON) REFERENCES O_ORSZAGOK (AZON) );

CREATE TABLE O_CSAPATTAGOK(VERSENYZO_AZON INT,
	                       CSAPAT_AZON INT,
    CONSTRAINT O_CST_PK PRIMARY KEY (VERSENYZO_AZON, CSAPAT_AZON),
    CONSTRAINT O_CST_FK_CS FOREIGN KEY (CSAPAT_AZON) REFERENCES O_VERSENYZOK (AZON),
    CONSTRAINT O_CST_FK_T FOREIGN KEY (VERSENYZO_AZON) REFERENCES O_VERSENYZOK (AZON));

CREATE TABLE O_SPORTAGAK(AZON INT,
	                     NEV VARCHAR(50),
    CONSTRAINT O_SPAG_PK PRIMARY KEY (AZON),
    CONSTRAINT O_SPAG_UK UNIQUE (NEV));

CREATE TABLE O_VERSENYSZAMOK (AZON INT,
	                          SPORTAG_AZON INT,
	                          VERSENYSZAM VARCHAR(50),
	                          FERFI_NOI VARCHAR(5),
    CONSTRAINT O_VSZAM_PK PRIMARY KEY (AZON),
    CONSTRAINT O_VSZAM_UK UNIQUE (SPORTAG_AZON, VERSENYSZAM, FERFI_NOI),
    CONSTRAINT O_VSZAM_FK_SP FOREIGN KEY (SPORTAG_AZON) REFERENCES O_SPORTAGAK (AZON));

CREATE TABLE O_EREDMENYEK (VERSENYZO_AZON INT,
                           VERSENYSZAM_AZON INT,
                           HELYEZES INT,
                           MEGJEGYZES VARCHAR(150),
    CONSTRAINT O_E_PK PRIMARY KEY  (VERSENYZO_AZON, VERSENYSZAM_AZON),
    CONSTRAINT O_E_FK_VSZ FOREIGN KEY ( VERSENYSZAM_AZON) REFERENCES O_VERSENYSZAMOK (AZON),
    CONSTRAINT O_E_FK_VNY FOREIGN KEY (VERSENYZO_AZON) REFERENCES O_VERSENYZOK (AZON) );



INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (1, 'Afganisztán', 32738376, 647500,'Kabul', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (2, 'Albánia', 3619778, 28748,'Tirana', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (3, 'Algéria', 33769669, 2381740,'Algír', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (4, 'Amerikai Egyesült Államok', 304814512, 9631418,'Washington D.C.', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (5, 'Amerikai Szamoa (USA függő területe)', 57496, null,'', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (6, 'Amerikai Virgin-szigetek (USA függő területe)', 108210, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (7, 'Andorra', 81222, 468,'Andorra la Vella', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (8, 'Angola', 12537757, 1246700,'Luanda', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (9, 'Anguilla (Brit koronafüggőség)', 14108, null,'St. John''s', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (10, 'Antigua és Barbuda', 69842, 443,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (11, 'Argentína', 39745613, 2766890,'Buenos Aires', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (12, 'Aruba (Hollandia autonóm területe)', 101541, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (13, 'Ausztrália', 21310250, 7686850,'Canberra', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (14, 'Ausztria', 8334325, 83870,'Bécs', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (15, 'Azerbajdzsán', 8177717, 86600,'Baki', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (16, 'Bahama-szigetek', 307451, 13940,'Nassau', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (17, 'Bahrein', 718306, 665,'Manáma', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (18, 'Banglades', 153546901, 144000,'Dakka', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (19, 'Barbados', 281968, 431,'Bridgetown', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (20, 'Belgium', 10584534, 30528,'Brüsszel', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (21, 'Belize', 301270, 22966,'Belmopan', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (22, 'Benin', 8294941, 112620,'Porto Novo', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (23, 'Bermuda (Brit koronafüggőség)', 66536, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (24, 'Bhután', 682321, 47000,'Timpu', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (25, 'Bissau-Guinea', 1503182, 36120,'Bissau', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (26, 'Bolívia', 9247816, 1098580,'Sucre', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (27, 'Bosznia-Hercegovina', 4590310, 51129,'Szarajevó', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (28, 'Botswana', 1842323, 600370,'Gaborone', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (29, 'Brazília', 187078805, 8514876,'Brazíliaváros', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (30, 'Brit Virgin-szigetek (Brit koronafüggőség)', 24004, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (31, 'Brunei', 381371, 5770,'Bandar Seri Begawan', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (32, 'Bulgária', 7262675, 111002,'Szófia', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (33, 'Burkina Faso', 15264735, 274200,'Ouagadougou', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (34, 'Burundi', 8691005, 27830,'Bujumbura', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (35, 'Chile', 16763470, 756096,'Santiago de Chile', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (36, 'Ciprus', 792604, 9250,'Nicosia', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (37, 'Comore-szigetek', 731775, 2170,'Moroni', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (38, 'Cook-szigetek (Új-Zéland függő területe)', 21210, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (39, 'Costa Rica', 4195914, 51100,'San José', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (40, 'Csád', 10111337, 1284000,'N?Djamena', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (41, 'Csehország', 10381130, 78866,'Prága', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (42, 'Dánia', 5475791, 43094,'Koppenhága', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (43, 'Dél-afrikai Köztársaság', 47850700, 1219912,'Pretoria', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (44, 'Dél-Korea', 49232844, 98480,'Szöul', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (45, 'Dominikai Közösség', 72514, 754,'Roseau', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (46, 'Dominikai Köztársaság', 9507133, 48730,'Santo Domingo', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (47, 'Dzsibuti', 506221, 23000,'Dzsibuti', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (48, 'Ecuador', 13927650, 283560,'Quito', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (49, 'Egyenlítői-Guinea', 616459, 28051,'Malabo', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (50, 'Egyesült Arab Emirátusok', 4621399, 82880,'Abu-Dzabi', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (51, 'Egyesült Királyság', 59668000, 244820,'London', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (52, 'Egyiptom', 81713517, 1001450,'Kairó', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (53, 'El Salvador', 7066703, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (54, 'Elefántcsontpart', 18373060, 322460,'Yamoussoukro', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (55, 'Eritrea', 5028475, 121320,'Aszmara', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (56, 'Északi-Mariana-szigetek (USA függő területe)', 86616, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (57, 'Észak-Korea (KNDK)', 23479089, 120540,'Phenjan', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (58, 'Észtország', 1340935, 45226,'Tallinn', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (59, 'Etiópia', 77127000, 1127127,'Addis Abeba', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (60, 'Falkland-szigetek (Brit koronafüggőség)', 3140, 12173,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (61, 'Fehéroroszország', 9690000, 207600,'Minszk', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (62, 'Feröer-szigetek (Dánia)', 48547, null,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (63, 'Fidzsi-szigetek', 827900, 18270,'Suva', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (64, 'Finnország', 5310126, 338145,'Helsinki', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (65, 'Francia Guyana (DOM)', 209000, 91000,'', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (66, 'Francia Polinézia (TOM)', 259596, 4167,'', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (67, 'Franciaország', 64473140, 547030,'Párizs', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (68, 'Fülöp-szigetek', 88574614, 300000,'Manila', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (69, 'Gabon', 1485832, 267667,'Libreville', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (70, 'Gambia', 1735464, 11300,'Banjul', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (71, 'Ghána', 23382848, 239460,'Accra', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (72, 'Gibraltár (Brit koronafüggőség)', 28875, null,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (73, 'Görögország', 11171740, 131940,'Athén', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (74, 'Grenada', 90343, 344,'St. George''s', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (75, 'Grönland (Dánia)', 56326, 2166086,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (76, 'Grúzia', 4630831, 69700,'T''bilisi', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (77, 'Guadeloupe (DOM)', 451000, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (78, 'Guam (USA)', 175877, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (79, 'Guatemala', 13002206, 108890,'Guatemalaváros', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (80, 'Guernsey (Brit koronafüggőség)', 61029, null,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (81, 'Guinea', 10211437, 245857,'Conakry', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (82, 'Guyana', 770794, 214970,'Georgetown', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (83, 'Haiti', 8924553, 27750,'Port-au-Prince', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (84, 'Holland Antillák (Hollandia autonóm területe)', 225369, 960,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (85, 'Hollandia', 16424546, 41526,'Amszterdam', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (86, 'Honduras', 7639327, 112090,'Tegucigalpa', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (87, 'Hongkong (Kína)', 6963100, 1092,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (88, 'Horvátország', 4491543, 56542,'Zágráb', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (89, 'India', 1129132842, 3287590,'Újdelhi', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (90, 'Indonézia', null, 1919440,'Jakarta', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (91, 'Irak', 28221181, 437072,'Bagdad', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (92, 'Irán', 65875223, 1648000,'Teherán', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (93, 'Írország', 4339000, 70280,'Dublin', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (94, 'Izland', 316252, 103000,'Reykjavík', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (95, 'Izrael', 7273100, 20770,'Tel-Aviv-Jaffa', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (96, 'Jamaica', 2804332, 10991,'Kingston', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (97, 'Japán', 127730000, 377835,'Tokió', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (98, 'Jemen', 22400000, 527970,'Szanaa', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (99, 'Jersey(Brit koronafüggőség)', 88200, null,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (100, 'Jordánia', 6198677, 92300,'Ammán', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (101, 'Kajmán-szigetek (Brit koronafüggőség)', 47862, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (102, 'Kambodzsa', 14241640, 181040,'Phnompen', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (103, 'Kamerun', 18467692, 475440,'Yaoundé', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (104, 'Kanada', 33273617, 9984670,'Ottawa', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (105, 'Katar', 928635, 11437,'Doha', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (106, 'Kazahsztán', 15340533, 2717300,'Asztana', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (107, 'Kelet-Timor', 1108777, 15007,'Dili', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (108, 'Kenya', 37953838, 582650,'Nairobi', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (109, 'Kína', 1315844000, 9596960,'Peking', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (110, 'Kirgizisztán', 5356869, 198500,'Biskek', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (111, 'Kiribati', 110356, 811,'Bairiki', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (112, 'Kolumbia', 44094774, 1138910,'Bogotá', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (113, 'Kongói Demokratikus Köztársaság', 66514506, 2345410,'Kinshasa', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (114, 'Kongói Köztársaság', 3903318, 342000,'Brazzaville', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (115, 'Koszovó', 2126708, 10887,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (116, 'Közép-afrikai Köztársaság', 4434873, 622984,'Bangui', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (117, 'Kuba', 11423952, 110860,'Havanna', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (118, 'Kuvait', 2596799, 17820,'Kuvaitváros ', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (119, 'Laosz', 6677534, 236800,'Vientián', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (120, 'Lengyelország', 38115967, 312685,'Varsó', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (121, 'Lesotho', 2128180, 30355,'Maseru', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (122, 'Lettország', 2268600, 64589,'Riga', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (123, 'Libanon', 3971941, 10400,'Bejrút', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (124, 'Libéria', 3334587, 111370,'Monrovia', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (125, 'Líbia', 6173579, 1759540,'Tripoli', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (126, 'Liechtenstein', 35365, 160,'Vaduz', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (127, 'Litvánia', 3361100, 65200,'Vilnius', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (128, 'Luxemburg', 476200, 2586,'Luxembourg', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (129, 'Macedónia', 2061315, 25333,'Szkopje', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (130, 'Madagaszkár', 20042551, 587040,'Antananarivo', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (131, 'Magyarország', 10041000, 93036,'Budapest', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (132, 'Makaó (Kína)', 538100, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (133, 'Malajzia', 27452091, 329750,'Kuala Lumpur', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (134, 'Malawi', 13931831, 118480,'Lilongwe', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (135, 'Maldív-szigetek', 379174, 300,'Malé', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (136, 'Mali', 12324029, 1240000,'Bamako', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (137, 'Málta', 403532, 316,'Valletta', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (138, 'Man sziget (Brit koronafüggőség)', 80058, 572,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (139, 'Marokkó', 34343219, 446550,'Rabat', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (140, 'Marshall-szigetek', 63174, 181,'Dalap-Uliga-Darrit', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (141, 'Martinique (DOM)', 401000, 1100,'', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (142, 'Mauritánia', 3364940, 1030700,'Nouakchott', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (143, 'Mauritius', 1274189, 2040,'Port Louis', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (144, 'Mayotte (DOM)', 186452, null,'', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (145, 'Mexikó', 109955400, 1972550,'Mexikóváros', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (146, 'Mikronézia', 107665, 702,'Palikir', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (147, 'Moldova', 4324450, 33843,'Chişinău', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (148, 'Monaco', 32796, 2,'Monaco', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (149, 'Mongólia', 2996081, 1564116,'Ulánbátor', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (150, 'Montenegró', 678177, 13812,'Podgorica', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (151, 'Montserrat (Brit koronafüggőség)', 9638, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (152, 'Mozambik', 21284701, 801590,'Maputo', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (153, 'Myanmar', 47758181, 678500,'Nepjida', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (154, 'Namíbia', 2088669, 825418,'Windhoek', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (155, 'Nauru', 13770, 21,'Yaren', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (156, 'Németország', 82210000, 357021,'Berlin', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (157, 'Nepál', 26427399, 140800,'Katmandu', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (158, 'Nicaragua', 5785846, 129494,'Managua', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (160, 'Nigéria', 138283240, 923768,'Abuja', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (161, 'Niue (Új-Zéland függő területe)', 1444, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (162, 'Norvégia', 4763350, 385199,'Oslo', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (163, 'Nyugat-Szahara', 393831, 266000,'', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (164, 'Olaszország', 59448163, 301230,'Róma', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (165, 'Omán', 3311640, 212460,'Maszkat', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (166, 'Oroszország', 142008838, 17075200,'Moszkva', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (167, 'Örményország', 2968586, 29800,'Jereván', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (168, 'Pakisztán', 164284500, 803940,'Iszlámábád', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (169, 'Palau', 21093, 458,'Melekeok', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (170, 'Palesztina', 3761676, null,'', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (171, 'Panama', 3292693, 78200,'Panamaváros', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (172, 'Pápua Új-Guinea', 5931769, 462840,'Port Moresby', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (173, 'Paraguay', 6831306, 406750,'Asunción', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (174, 'Peru', 28750770, 1285220,'Lima', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (175, 'Pitcairn-szigetek (Brit koronafüggőség)', 48, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (176, 'Portugália', 10676910, 92391,'Lisszabon', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (177, 'Puerto Rico (USA társult állama)', 3958128, 9104,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (178, 'Réunion (DOM)', 793000, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (179, 'Románia', 23013376, 237500,'Bukarest', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (180, 'Ruanda', 10186063, 26338,'Kigali', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (181, 'S?o Tomé és Príncipe', 206178, 1001,'S?o Tomé', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (182, 'Saint Kitts és Nevis', 39619, 261,'Basseterre', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (183, 'Saint Lucia', 172884, 616,'Castries', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (184, 'Saint Vincent', 118432, 389,'Kingstown', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (185, 'Saint-Pierre és Miquelon (TOM)', 7044, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (186, 'Salamon-szigetek', 581318, 28450,'Honiara', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (187, 'Salvador', null, 21040,'San Salvador', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (188, 'San Marino', 29973, 61,'San Marino', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (189, 'Seychelle-szigetek', 82247, 455,'Victoria', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (190, 'Sierra Leone', 6294773, 71740,'Freetown', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (191, 'Spanyolország', 45283259, 504782,'Madrid', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (192, 'Srí Lanka', 21128773, 65610,'Colombo', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (193, 'Suriname', 475996, 163270,'Paramaribo', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (159, 'Niger', 13272679, 1267000,'Niamey', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (194, 'Svájc', 7612800, 41290,'Bern', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (195, 'Svédország', 9192088, 449964,'Stockholm', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (196, 'Szamoa', 188359, 2944,'Apia', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (197, 'Szaúd-Arábia', 28161417, 1960582,'Rijád', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (198, 'Szenegál', 12853259, 196190,'Dakar', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (199, 'Szent Ilona (Brit koronafüggőség)', 7601, null,'', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (200, 'Szerbia', 7397651, 77474,'Belgrád', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (201, 'Szingapúr', 4558600, 693,'Szingapúr', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (202, 'Szíria', 19747586, 185180,'Damaszkusz', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (203, 'Szlovákia', 5400998, 48845,'Pozsony', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (204, 'Szlovénia', 1967000, 20273,'Ljubljana', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (205, 'Szomália', 9558666, 637657,'Mogadishu', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (206, 'Szomáliföld', 3500000, null,'', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (207, 'Szudán', 40218455, 2505810,'Kartúm', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (208, 'Szváziföld', 1128814, 17363,'Mbabane', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (209, 'Tádzsikisztán', 7211884, 143100,'Dusanbe', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (210, 'Tajvan', 22978800, null,'Tajpej', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (211, 'Tanzánia', 40213162, 945087,'Dodoma', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (212, 'Thaiföld', 64233000, 514000,'Bangkok', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (213, 'Togo', 5858673, 56785,'Lomé', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (214, 'Tokelau (Új-Zéland függő területe)', 1433, null,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (215, 'Tonga', 119009, 748,'Nuku''alofa', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (216, 'Törökország', 70586256, 780580,'Ankara', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (217, 'Trinidad és Tobago', 1047366, 5128,'Port of Spain', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (218, 'Tunézia', 10383557, 163610,'Tunisz', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (219, 'Turks- és Caicos-szigetek (Brit koronafüggőség)', 22353, null,'', 'Észak- és Közép-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (220, 'Tuvalu', 12177, 26,'Vaiaku', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (221, 'Türkmenisztán', 5179571, 488100,'Asgabat', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (222, 'Uganda', 31367972, 236040,'Kampala', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (223, 'Új-Kaledónia (TOM)', 240390, 19060,'', '');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (224, 'Új-Zéland', 4028000, 268680,'Wellington', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (225, 'Ukrajna', 46287138, 603700,'Kijev', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (226, 'Uruguay', 3477778, 176220,'Montevideo', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (227, 'Üzbegisztán', 28268440, 447400,'Taskent', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (228, 'Vanuatu', 215446, 12200,'Port Vila', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (229, 'Vatikán', 1000, 0,'Vatikánváros', 'Európa');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (230, 'Venezuela', 27888149, 912050,'Caracas', 'Dél-Amerika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (231, 'Vietnam', 86116559, 329560,'Hanoi', 'Ázsia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (232, 'Wallis és Futuna (TOM)', 16448, null,'', 'Ausztrália és Óceánia');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (233, 'Zambia', 11669534, 752614,'Lusaka', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (234, 'Zimbabwe', 12382920, 390580,'Harare', 'Afrika');
INSERT INTO o_orszagok (azon,orszag,lakossag,terulet,fovaros,foldresz) VALUES (235, 'Zöld-foki-szigetek', 426998, 4033,'', 'Afrika');


INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (109,51,21,28);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (4,36,38,36);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (166,23,21,28);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (51,19,13,15);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (156,16,10,15);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (13,14,15,17);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (44,13,10,8);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (97,9,6,10);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (164,8,10,10);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (67,7,16,17);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (225,7,5,15);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (85,7,5,4);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (96,6,3,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (191,5,10,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (108,5,5,4);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (61,4,5,10);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (179,4,1,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (59,4,1,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (104,3,9,6);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (120,3,6,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (131,3,5,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (162,3,5,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (29,3,4,8);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (41,3,3,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (203,3,2,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (224,3,1,5);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (76,3,0,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (117,2,11,11);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (106,2,4,7);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (42,2,2,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (149,2,2,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (212,2,2,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (57,2,1,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (11,2,0,4);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (194,2,0,4);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (145,2,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (216,1,4,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (234,1,3,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (15,1,2,4);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (227,1,2,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (204,1,2,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (32,1,1,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (90,1,1,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (64,1,1,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (122,1,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (20,1,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (46,1,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (58,1,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (176,1,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (89,1,0,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (92,1,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (17,1,0,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (103,1,0,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (171,1,0,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (218,1,0,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (195,0,4,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (88,0,2,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (127,0,2,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (73,0,2,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (217,0,2,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (160,0,1,3);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (14,0,1,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (93,0,1,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (200,0,1,2);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (3,0,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (16,0,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (110,0,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (112,0,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (139,0,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (209,0,1,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (35,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (43,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (48,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (94,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (133,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (201,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (207,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (231,0,1,0);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (167,0,0,6);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (210,0,0,4);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (1,0,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (52,0,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (95,0,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (147,0,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (143,0,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (213,0,0,1);
INSERT INTO o_erem_tabla (ORSZAG_AZON,ARANY,EZUST,BRONZ) VALUES (230,0,0,1);


INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (847,'Arn Gréta',DATE_FORMAT('1979.04.13','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (848,'Aubéli Ottó',DATE_FORMAT('1975.03.31','%Y.%m.%d'),131,'e','Esztergom');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (849,'Baczkó Bernadett',DATE_FORMAT('1986.01.08','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (850,'Bácsi Péter',DATE_FORMAT('1983.05.15','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (851,'Balog Gábor',DATE_FORMAT('1990.09.02','%Y.%m.%d'),131,'e','Békéscsaba');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (852,'Balogh Gábor',DATE_FORMAT('1976.08.05','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (853,'Barta Nóra',DATE_FORMAT('1984.04.02','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (854,'Bedák Pál',DATE_FORMAT('1985.09.08','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (855,'Beé István',DATE_FORMAT('1972.07.04','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (856,'Benedek Tibor',DATE_FORMAT('1972.07.12','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (857,'Benkő Zoltán',DATE_FORMAT('1983.06.13','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (858,'Berecz Zsombor',DATE_FORMAT('1986.04.26','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (859,'Bernek Péter',DATE_FORMAT('1992.04.13','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (860,'Biros Péter',DATE_FORMAT('1976.04.05','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (861,'Boczkó Gábor',DATE_FORMAT('1977.04.01','%Y.%m.%d'),131,'e','Tapolca');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (862,'Bódi Bernadett',DATE_FORMAT('1986.03.09','%Y.%m.%d'),131,'e','Szeged');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (863,'Bodor Richárd',DATE_FORMAT('1979.03.10','%Y.%m.%d'),131,'e','Pécs');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (864,'Bodrogi László',DATE_FORMAT('1976.12.11','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (865,'Bor Barna',DATE_FORMAT('1986.12.12','%Y.%m.%d'),131,'e','Kerepestarcsa');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (866,'Bor Katalin',DATE_FORMAT('1990.02.10','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (867,'Borbás Rita',DATE_FORMAT('1980.12.21','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (868,'Boulsevitz Beatrix',DATE_FORMAT('1987.02.15','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (869,'Bozsik Gábor',DATE_FORMAT('1981.10.26','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (870,'Böczögő Dorina',DATE_FORMAT('1992.02.15','%Y.%m.%d'),131,'e','Orosháza');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (871,'Brávik Fruzsina',DATE_FORMAT('1986.10.06','%Y.%m.%d'),131,'e','Dunaújváros');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (872,'Czukor Zoltán',DATE_FORMAT('1962.12.18','%Y.%m.%d'),131,'e','Komló');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (873,'Cseh László',DATE_FORMAT('1985.12.03','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (874,'Csernoviczki Éva',DATE_FORMAT('1986.10.16','%Y.%m.%d'),131,'e','Tatabánya');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (875,'Csíkné Tóth Anita',DATE_FORMAT('1979.11.12','%Y.%m.%d'),131,'e','Szolnok');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (876,'Csonka Zsófia',DATE_FORMAT('1983.09.12','%Y.%m.%d'),131,'e','Pécs');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (877,'Dara Eszter',DATE_FORMAT('1990.05.30','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (878,'Deák Bárdos Mihály',DATE_FORMAT('1975.01.30','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (879,'Decsi Tamás',DATE_FORMAT('1982.10.15','%Y.%m.%d'),131,'e','Kazincbarcika');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (880,'Detre Diána',DATE_FORMAT('1983.11.22','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (881,'Dobár Éva',DATE_FORMAT('1993.03.04','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (882,'Drávucz Rita',DATE_FORMAT('1980.04.14','%Y.%m.%d'),131,'e','Szolnok');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (883,'Farkas Györgyi',DATE_FORMAT('1985.02.13','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (884,'Fazekas Róbert',DATE_FORMAT('1978.08.18','%Y.%m.%d'),131,'e','Szombathely');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (885,'Fodor Zoltán',DATE_FORMAT('1985.07.29','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (886,'Füsti Edina',DATE_FORMAT('1982.06.24','%Y.%m.%d'),131,'e','Ózd');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (887,'Gádorfalvi Áron',DATE_FORMAT('1977.12.05','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (888,'Gál Róbert',DATE_FORMAT('1979.03.30','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (889,'Gercsák Balázs',DATE_FORMAT('1986.10.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (890,'Gercsák Csaba',DATE_FORMAT('1988.08.19','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (891,'Gerebics Roland',DATE_FORMAT('1979.09.06','%Y.%m.%d'),131,'e','Várpalota');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (892,'Gergely István',DATE_FORMAT('1976.08.20','%Y.%m.%d'),131,'e','Dunaszerdahely (Szlovákia)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (893,'Görbicz Anita',DATE_FORMAT('1983.05.13','%Y.%m.%d'),131,'e','Veszprém');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (894,'Gyenesei Leila',DATE_FORMAT('1986.04.22','%Y.%m.%d'),131,'e','Kaposvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (895,'Györe Anett',DATE_FORMAT('1981.12.10','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (896,'Gyurta Dániel',DATE_FORMAT('1989.05.04','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (897,'Hadfi Dániel',DATE_FORMAT('1982.05.13','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (898,'Herr Orsolya',DATE_FORMAT('1984.11.23','%Y.%m.%d'),131,'e','Tatabánya');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (899,'Hirling Zsolt',DATE_FORMAT('1984.05.28','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (900,'Hódi Anikó',DATE_FORMAT('1986.04.11','%Y.%m.%d'),131,'e','Hódmezővásárhely');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (901,'Hornyák Ágnes',DATE_FORMAT('1982.09.02','%Y.%m.%d'),131,'e','Mátészalka');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (902,'Horváth Patrícia',DATE_FORMAT('1977.12.07','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (903,'Horváth Viktor',DATE_FORMAT('1978.02.26','%Y.%m.%d'),131,'e','Székesfehérvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (904,'Hosnyánszky Norbert',DATE_FORMAT('1984.03.04','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (905,'Hosszú Katinka',DATE_FORMAT('1989.05.03','%Y.%m.%d'),131,'e','Pécs');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (906,'Igaly Diána',DATE_FORMAT('1965.01.31','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (907,'Imre Géza',DATE_FORMAT('1974.12.23','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (908,'Jakab János',DATE_FORMAT('1986.07.23','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (909,'Jakabos Zsuzsanna',DATE_FORMAT('1989.04.03','%Y.%m.%d'),131,'e','Pécs');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (910,'Janics Natasa',DATE_FORMAT('1982.06.24','%Y.%m.%d'),131,'e','Bácskapalánka (Szerbia)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (911,'Kálovics Anikó',DATE_FORMAT('1977.05.13','%Y.%m.%d'),131,'e','Szombathely');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (912,'Kalucza Norbert',DATE_FORMAT('1986.12.04','%Y.%m.%d'),131,'e','Mátészalka');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (913,'Kammerer Zoltán',DATE_FORMAT('1978.03.10','%Y.%m.%d'),131,'e','Vác');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (914,'Kapás Boglárka',DATE_FORMAT('1993.04.22','%Y.%m.%d'),131,'e','Debrecen');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (915,'Kásás Tamás',DATE_FORMAT('1976.07.20','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (916,'Káté Gyula',DATE_FORMAT('1982.02.03','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (917,'Kerékjártó Tamás',DATE_FORMAT('1979.07.09','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (918,'Kis Gábor',DATE_FORMAT('1982.09.27','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (919,'Kis Gergő',DATE_FORMAT('1988.01.19','%Y.%m.%d'),131,'e','Tapolca');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (920,'Kiss Dániel',DATE_FORMAT('1982.02.12','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (921,'Kiss Gergely',DATE_FORMAT('1983.11.06','%Y.%m.%d'),131,'e','Orosháza');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (922,'Kiss Gergely dr.',DATE_FORMAT('1977.09.21','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (923,'Kiss Tamás',DATE_FORMAT('1987.05.09','%Y.%m.%d'),131,'e','Ajka');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (924,'Kisteleki Dóra',DATE_FORMAT('1983.05.11','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (925,'Knapek Edina',DATE_FORMAT('1977.10.05','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (926,'Kormos Villő',DATE_FORMAT('1988.08.02','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (927,'Kovács Emese',DATE_FORMAT('1991.03.01','%Y.%m.%d'),131,'e','Baja');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (928,'Kovács Iván',DATE_FORMAT('1970.02.08','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (929,'Kovács Katalin',DATE_FORMAT('1976.02.29','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (930,'Kovács Norbert',DATE_FORMAT('1988.02.13','%Y.%m.%d'),131,'e','Veszprém');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (931,'Kovacsicz Mónika',DATE_FORMAT('1983.11.20','%Y.%m.%d'),131,'e','Révkomárom (Szlovákia)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (932,'Kozák Danuta',DATE_FORMAT('1987.01.11','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (933,'Kozma Dominik',DATE_FORMAT('1991.04.10','%Y.%m.%d'),131,'e','Dunfermline (Skócia)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (934,'Kozmann György',DATE_FORMAT('1978.03.23','%Y.%m.%d'),131,'e','Szekszárd');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (935,'Kővágó Zoltán',DATE_FORMAT('1979.04.10','%Y.%m.%d'),131,'e','Szolnok');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (936,'Kucsera Gábor',DATE_FORMAT('1982.08.27','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (937,'Kulcsár Krisztián dr.',DATE_FORMAT('1971.06.28','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (938,'Kusztor Péter',DATE_FORMAT('1984.12.27','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (939,'Kuttor Csaba',DATE_FORMAT('1975.08.19','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (940,'Kürthy Lajos',DATE_FORMAT('1986.10.22','%Y.%m.%d'),131,'e','Mohács');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (941,'Lontay Balázs',DATE_FORMAT('1984.03.18','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (942,'Lovas Petra',DATE_FORMAT('1980.07.04','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (943,'Lőrincz Tamás',DATE_FORMAT('1986.12.20','%Y.%m.%d'),131,'e','Cegléd');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (944,'Madaras Norbert',DATE_FORMAT('1979.12.01','%Y.%m.%d'),131,'e','Eger');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (945,'Madarassy Ádám',DATE_FORMAT('1985.03.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (946,'Makány Balázs',DATE_FORMAT('1987.05.23','%Y.%m.%d'),131,'e','Pécs');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (947,'Máté Gábor',DATE_FORMAT('1979.02.09','%Y.%m.%d'),131,'e','Békéscsaba');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (948,'Mészáros Anett',DATE_FORMAT('1987.07.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (949,'Mincza-Nébald Ildikó dr.',DATE_FORMAT('1969.11.06','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (950,'Mohamed Aida',DATE_FORMAT('1976.03.12','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (951,'Molnár Tamás dr.',DATE_FORMAT('1975.08.02','%Y.%m.%d'),131,'e','Szeged');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (952,'Mutina Ágnes',DATE_FORMAT('1988.04.19','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (953,'Nagy Orsolya',DATE_FORMAT('1977.11.17','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (954,'Nagy Péter',DATE_FORMAT('1985.04.11','%Y.%m.%d'),131,'e','Ajka');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (955,'Nagy Réka',DATE_FORMAT('1986.11.09','%Y.%m.%d'),131,'e','Ajka');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (956,'Nemcsik Zsolt',DATE_FORMAT('1977.08.15','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (957,'Olteán Csongor',DATE_FORMAT('1984.04.08','%Y.%m.%d'),131,'e','Sepsiszentgyörgy (Románia)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (958,'Orbán Éva',DATE_FORMAT('1984.11.29','%Y.%m.%d'),131,'e','Pápa');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (959,'Orsó-Ferling Bernadett',DATE_FORMAT('1977.07.13','%Y.%m.%d'),131,'e','Tatabánya');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (960,'Pálinger Katalin',DATE_FORMAT('1978.12.06','%Y.%m.%d'),131,'e','Mosonmagyaróvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (961,'Papp Krisztina',DATE_FORMAT('1982.12.17','%Y.%m.%d'),131,'e','Eger');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (962,'Pars Krisztián',DATE_FORMAT('1982.02.18','%Y.%m.%d'),131,'e','Körmend');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (963,'Parti András',DATE_FORMAT('1982.09.18','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (964,'Pecz Réka',DATE_FORMAT('1992.06.21','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (965,'Pelle Anikó',DATE_FORMAT('1978.09.28','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (966,'Petráhn Barbara',DATE_FORMAT('1978.09.16','%Y.%m.%d'),131,'e','Sopron');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (967,'Póta Georgina',DATE_FORMAT('1985.01.13','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (968,'Povázsay Zoltán',DATE_FORMAT('1988.03.04','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (969,'Primász Ágnes',DATE_FORMAT('1980.03.05','%Y.%m.%d'),131,'e','Dunaújváros');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (970,'Prokoppné Teveli Petra',DATE_FORMAT('1979.11.01','%Y.%m.%d'),131,'e','Siófok');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (971,'Radasics Vilmos',DATE_FORMAT('1983.10.25','%Y.%m.%d'),131,'e','Sopron');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (972,'Rakonczai Beáta',DATE_FORMAT('1977.06.25','%Y.%m.%d'),131,'e','Nyíregyháza');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (973,'Rudolf Roland',DATE_FORMAT('1985.08.06','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (974,'Sáfrán Mátyás',DATE_FORMAT('1986.01.23','%Y.%m.%d'),131,'e','Székesfehérvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (975,'Sáfrán Mihály',DATE_FORMAT('1985.03.21','%Y.%m.%d'),131,'e','Székesfehérvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (976,'Sastin Marianna',DATE_FORMAT('1983.07.10','%Y.%m.%d'),131,'e','Mosonmagyaróvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (977,'Sepsiné Pigniczki Krisztina',DATE_FORMAT('1975.09.18','%Y.%m.%d'),131,'e','Makó');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (978,'Sidi Péter',DATE_FORMAT('1978.09.11','%Y.%m.%d'),131,'e','Komárom');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (979,'Sík Márton',DATE_FORMAT('1984.01.28','%Y.%m.%d'),131,'e','Szeged');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (980,'Stieber Mercedes',DATE_FORMAT('1974.09.04','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (981,'Szabó Gabriella',DATE_FORMAT('1986.08.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (982,'Szabó Nikolett',DATE_FORMAT('1980.03.03','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (983,'Szabó Zita',DATE_FORMAT('1974.11.13','%Y.%m.%d'),131,'e','Karcag');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (984,'Szabóné Molnár Krisztina',DATE_FORMAT('1976.04.08','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (985,'Szamoránsky Piroska',DATE_FORMAT('1986.07.09','%Y.%m.%d'),131,'e','Győr');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (986,'Szász Emese',DATE_FORMAT('1982.09.07','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (987,'Szávay Ágnes',DATE_FORMAT('1988.12.29','%Y.%m.%d'),131,'e','Kiskunhalas');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (988,'Szécsi Zoltán',DATE_FORMAT('1977.12.22','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (989,'Szellő Imre',DATE_FORMAT('1983.07.27','%Y.%m.%d'),131,'e','Cegléd');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (990,'Szepesi Nikolett',DATE_FORMAT('1987.09.11','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (991,'Szilágyi Áron',DATE_FORMAT('1990.01.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (992,'Szremkó Krisztina',DATE_FORMAT('1972.01.06','%Y.%m.%d'),131,'e','Dunaújváros');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (993,'Szűcs Ibolya Gabriella',DATE_FORMAT('1984.08.31','%Y.%m.%d'),131,'e','Nagyvárad (Románia)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (994,'Takács Krisztián',DATE_FORMAT('1985.12.30','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (995,'Takács Orsolya',DATE_FORMAT('1985.05.20','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (996,'Tomori Zsuzsanna',DATE_FORMAT('1987.06.18','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (997,'Tompa Orsolya',DATE_FORMAT('1991.07.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (998,'Tóth Krisztina',DATE_FORMAT('1974.05.29','%Y.%m.%d'),131,'e','Miskolc');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (999,'Tóth Tímea',DATE_FORMAT('1980.09.16','%Y.%m.%d'),131,'e','Zalaszentgrót');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1000,'Ujlaky Virginie',DATE_FORMAT('1984.02.13','%Y.%m.%d'),131,'e','Neuilly-sur-Seine (Franciaország)');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1001,'Ungvári Miklós',DATE_FORMAT('1980.10.15','%Y.%m.%d'),131,'e','Cegléd');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1002,'Vajda Attila',DATE_FORMAT('1983.03.17','%Y.%m.%d'),131,'e','Szeged');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1003,'Valkai Ágnes',DATE_FORMAT('1981.02.27','%Y.%m.%d'),131,'e','Lajosmizse');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1004,'Varga Dániel',DATE_FORMAT('1983.09.25','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1005,'Varga Dénes',DATE_FORMAT('1987.03.29','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1006,'Varga Gabriella',DATE_FORMAT('1982.04.07','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1007,'Varga Miklós',DATE_FORMAT('1987.08.26','%Y.%m.%d'),131,'e','Debrecen');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1008,'Varga Tamás',DATE_FORMAT('1978.06.17','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1009,'Varga Tamás',DATE_FORMAT('1975.07.14','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1010,'Vári Edit',DATE_FORMAT('1975.05.31','%Y.%m.%d'),131,'e','Mosonmagyaróvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1011,'Veréb István',DATE_FORMAT('1987.10.08','%Y.%m.%d'),131,'e','nincs adat');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1012,'Vereckei Ákos',DATE_FORMAT('1977.08.26','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1013,'Verrasztó Evelin',DATE_FORMAT('1989.07.17','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1014,'Vérten Orsolya',DATE_FORMAT('1982.07.22','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1015,'Virág Lajos',DATE_FORMAT('1977.06.27','%Y.%m.%d'),131,'e','Eger');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1016,'Vörös Zsuzsanna',DATE_FORMAT('1977.05.04','%Y.%m.%d'),131,'e','Székesfehérvár');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1017,'Zantleitner Krisztina',DATE_FORMAT('1974.05.05','%Y.%m.%d'),131,'e','Tatabánya');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1018,'Zirighné Sós Ildikó',DATE_FORMAT('1976.12.27','%Y.%m.%d'),131,'e','Tatabánya');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1019,'Zsivoczky-Pandel Attila',DATE_FORMAT('1977.04.29','%Y.%m.%d'),131,'e','Budapest');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1102,'Brenton Rickard',null,13,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1103,'Ken Wallace',null,13,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1104,'Michael Phelps',null,4,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1105,'Ryan Lochte',null,4,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1106,'Anasztaszja Szamuszevics',null,61,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1107,'Anne-Laure Viard',null,67,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1108,'Hugues Dubosq',null,67,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1109,'Marie Delattre',null,67,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1110,'Koszuke Kitadzsima',null,97,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1111,'Macuda Takesi',null,97,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1112,'Adam Van Koeverden',null,104,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1113,'Mike Andrew Brown',null,104,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1114,'Thomas Hall',null,104,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1115,'Csen Csian',null,109,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1116,'Pang Csia-Jing',null,109,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1117,'Vu Peng',null,109,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1118,'Aneta Konieczna',null,120,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1119,'Beata Mikolajczyk',null,120,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1120,'Paulina Boenisz',null,120,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1121,'Andrejus Zadneprovskis',null,127,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1122,'Edvinas Krungolcas',null,127,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1123,'Heather Fell',null,51,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1124,'Tim Brabants',null,51,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1125,'Britta Heidemann',null,156,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1126,'Katrin Wagner-Augustin',null,156,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1127,'Lena Schöneborn',null,156,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1128,'Eirik Veraas Larsen',null,162,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1129,'Andrea Minguzzi',null,164,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1130,'Federica Pellegrini',null,164,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1131,'Josefa Idem',null,164,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1132,'Andrej Mojszejev',null,166,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1133,'Makszim Opaljev',null,166,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1134,'Ana Maria Branza',null,179,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1135,'David Cal',null,191,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1136,'Ara Abrahamian',null,195,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1137,'Sara Isakovic',null,204,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1138,'Nazim Avluca',null,216,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1139,'Moss Burmester',null,224,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1140,'Inna Oszipenko-Radomska',null,225,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1141,'Jurij Cseban',null,225,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1142,'Viktoria Teresuk',null,225,'e','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1181,'Vizilabda női',null,85,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1182,'Vizilabda női',null,4,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1183,'Vizilabda női',null,13,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1184,'Vizilabda férfi',null,4,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1185,'Vizilabda férfi',null,200,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1186,'Kézilabda női',null,162,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1187,'Kézilabda női',null,166,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1188,'Kézilabda női',null,44,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1201,'Labdarúgás női',null,4,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1202,'Labdarúgás női',null,29,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1203,'Labdarúgás női',null,156,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1204,'Labdarúgás férfi',null,11,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1205,'Labdarúgás férfi',null,160,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1206,'Labdarúgás férfi',null,29,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1207,'Úszás',null,13,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1208,'Úszás',null,109,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1209,'Úszás',null,4,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1210,'Úszás',null,164,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1211,'Úszás',null,67,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1221,'Kajak 4 női',null,156,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1222,'Kajak 4 női',null,13,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1241,'Kajak 2 férfi',null,156,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1242,'Kajak 2 férfi',null,42,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1243,'Kajak 2 férfi',null,164,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1244,'Kajak 2 férfi',null,120,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1261,'Kenu 2 férfi',null,61,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1262,'Kenu 2 férfi',null,156,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1281,'Kajak 4 férfi',null,61,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1282,'Kajak 4 férfi',null,203,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1283,'Kajak 4 férfi',null,156,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1284,'Kajak 4 férfi',null,164,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1301,'Kajak 2 férfi',null,191,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1302,'Kajak 2 férfi',null,61,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1303,'Kajak 2 női',null,120,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1304,'Kajak 2 női',null,67,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1161,'Kajak KK',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1162,'Kajak BBSV',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1163,'Kenu KK',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1164,'Kenu SS',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1165,'Kajak JK',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1166,'Kajak JKKSz',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1167,'Úszás KKKK',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1168,'Úszás DJMV',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1169,'Vívás DLNSz',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1170,'Vívás BIKK',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1171,'Vívás KMUV',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1172,'Vízilabda női',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1173,'Vízilabda férfi',null,131,'c','');

INSERT INTO o_versenyzok (AZON,NEV,SZUL_DAT,ORSZAG_AZON, EGYEN_CSAPAT,SZUL_HELY)
 VALUES (1174,'Kézilabda női',null,131,'c','');



INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (855,1162);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (856,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (860,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (861,1170);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (862,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (867,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (869,1162);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (871,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (877,1168);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (879,1169);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (882,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (892,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (893,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (895,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (898,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (901,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (902,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (904,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (907,1170);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (909,1168);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (910,1165);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (910,1166);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (913,1161);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (915,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (917,1167);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (918,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (919,1167);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (922,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (923,1163);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (924,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (925,1171);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (928,1170);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (929,1165);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (929,1166);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (930,1167);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (931,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (932,1166);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (933,1167);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (934,1163);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (936,1161);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (937,1170);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (941,1169);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (944,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (950,1171);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (951,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (952,1168);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (956,1169);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (959,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (960,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (965,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (969,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (974,1164);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (975,1164);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (977,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (979,1162);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (980,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (981,1166);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (985,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (988,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (991,1169);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (992,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (993,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (995,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (996,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (999,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1000,1171);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1003,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1004,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1005,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1006,1171);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1009,1173);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1012,1162);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1013,1168);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1014,1174);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1017,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1018,1172);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1107,1304);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1109,1304);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1118,1303);
INSERT INTO o_csapattagok (VERSENYZO_AZON,CSAPAT_AZON) VALUES (1119,1303);




INSERT INTO o_sportagak (AZON,NEV) VALUES (301,'Asztalitenisz');
INSERT INTO o_sportagak (AZON,NEV) VALUES (302,'Labdarúgás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (303,'Szinkronúszás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (304,'Atlétika');
INSERT INTO o_sportagak (AZON,NEV) VALUES (305,'Lovaglás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (306,'Tékvandó');
INSERT INTO o_sportagak (AZON,NEV) VALUES (307,'Baseball');
INSERT INTO o_sportagak (AZON,NEV) VALUES (308,'Lövészet');
INSERT INTO o_sportagak (AZON,NEV) VALUES (309,'Tenisz');
INSERT INTO o_sportagak (AZON,NEV) VALUES (310,'Birkózás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (311,'Műugrás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (312,'Tollaslabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (313,'Cselgáncs');
INSERT INTO o_sportagak (AZON,NEV) VALUES (314,'Országúti kerékpár');
INSERT INTO o_sportagak (AZON,NEV) VALUES (315,'Torna');
INSERT INTO o_sportagak (AZON,NEV) VALUES (316,'Evezés');
INSERT INTO o_sportagak (AZON,NEV) VALUES (317,'Ökölvívás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (318,'Trampolin');
INSERT INTO o_sportagak (AZON,NEV) VALUES (319,'Gyeplabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (320,'Öttusa');
INSERT INTO o_sportagak (AZON,NEV) VALUES (321,'Triatlon');
INSERT INTO o_sportagak (AZON,NEV) VALUES (322,'Hegyi kerékpár');
INSERT INTO o_sportagak (AZON,NEV) VALUES (323,'Pályakerékpár');
INSERT INTO o_sportagak (AZON,NEV) VALUES (324,'Úszás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (325,'Íjászat');
INSERT INTO o_sportagak (AZON,NEV) VALUES (326,'Ritmikus sportgimnasztika');
INSERT INTO o_sportagak (AZON,NEV) VALUES (327,'Vitorlázás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (328,'Kajak-kenu');
INSERT INTO o_sportagak (AZON,NEV) VALUES (329,'Röplabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (330,'Vívás');
INSERT INTO o_sportagak (AZON,NEV) VALUES (331,'Kajak-szlalom');
INSERT INTO o_sportagak (AZON,NEV) VALUES (332,'Softball');
INSERT INTO o_sportagak (AZON,NEV) VALUES (333,'Vízilabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (334,'Kézilabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (335,'Strandröplabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (336,'Kosárlabda');
INSERT INTO o_sportagak (AZON,NEV) VALUES (337,'Súlyemelés');



INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (177,301,'egyéni','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (178,301,'egyéni','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (179,304,'110 m gátfutás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (180,304,'50 km gyaloglás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (181,304,'diszkoszvetés','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (182,304,'gerelyhajítás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (183,304,'kalapácsvetés','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (184,304,'súlylökés','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (185,304,'tízpróba','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (186,304,'10 000 m síkfutás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (187,304,'100 m gátfutás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (188,304,'20 km gyaloglás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (189,304,'400 m síkfutás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (190,304,'5000 m síkfutás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (191,304,'gerelyhajítás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (192,304,'hétpróba','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (193,304,'kalapácsvetés','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (194,304,'maratonfutás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (195,304,'rúdugrás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (196,310,'kötöttfogás 120 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (197,310,'kötöttfogás 66 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (198,310,'kötöttfogás 74 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (199,310,'kötöttfogás 84 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (200,310,'kötöttfogás 96 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (201,310,'szabadfogás 120 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (202,310,'szabadfogás 74 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (203,310,'szabadfogás 96 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (204,310,'63 kg','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (205,313,'+100 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (206,313,'100 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (207,313,'66 kg','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (208,313,'48 kg','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (209,313,'57 kg','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (210,313,'70 kg','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (211,328,'kajak egyes 1000 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (212,328,'kajak egyes 500 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (213,328,'kajak kettes 1000 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (214,328,'kajak kettes 500 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (215,328,'kajak négyes 1000 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (216,328,'kenu egyes 1000 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (217,328,'kenu egyes 500 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (218,328,'kenu kettes 1000 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (219,328,'kenu kettes 500 m','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (220,328,'kajak egyes 500 m','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (221,328,'kajak kettes 500 m','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (222,328,'kajak négyes 500 m','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (223,334,'csapat','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (224,320,'egyéni','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (225,320,'egyéni','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (226,324,'10 km hosszútávúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (227,324,'100 m gyorsúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (228,324,'100 m hátúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (229,324,'100 m mellúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (230,324,'100 m pillangóúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (231,324,'1500 m gyorsúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (232,324,'200 m gyorsúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (233,324,'200 m hátúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (234,324,'200 m mellúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (235,324,'200 m pillangóúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (236,324,'200 m vegyesúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (237,324,'400 m gyorsúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (238,324,'400 m vegyesúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (239,324,'4x200 m gyorsúszó váltó','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (240,324,'50 m gyorsúszás','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (241,324,'100 m gyorsúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (242,324,'100 m hátúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (243,324,'100 m mellúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (244,324,'100 m pillangóúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (245,324,'200 m gyorsúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (246,324,'200 m hátúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (247,324,'200 m mellúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (248,324,'200 m pillangóúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (249,324,'200 m vegyesúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (250,324,'400 m gyorsúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (251,324,'400 m vegyesúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (252,324,'4x200 m gyorsúszó váltó','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (253,324,'50 m gyorsúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (254,324,'800 m gyorsúszás','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (255,330,'kard csapat','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (256,330,'kard egyéni','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (257,330,'párbajtőr csapat','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (258,330,'párbajtőr egyéni','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (259,330,'kard egyéni','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (260,330,'párbajtőr egyéni','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (261,330,'tőr csapat','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (262,330,'tőr egyéni','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (263,333,'csapat','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (264,333,'csapat','férfi');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (281,302,'csapat','női');
INSERT INTO o_versenyszamok (AZON,SPORTAG_AZON,VERSENYSZAM,FERFI_NOI) VALUES (282,302,'csapat','férfi');



INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (872,180,46,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (883,192,29,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (884,181,8,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (886,188,39,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (911,186,22,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (920,179,21,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (935,181,21,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (940,184,34,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (947,181,13,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (957,182,null,'helyezetlen');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (958,193,34,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (961,190,27,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (962,183,4,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (966,189,35,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (970,194,65,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (972,194,null,'nem ért célba');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (982,191,22,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (984,195,26,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1010,187,36,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1019,185,null,'feladta');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (848,201,8,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (850,198,5,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (878,196,8,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (885,199,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (921,203,8,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (943,197,9,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (976,204,15,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1011,202,20,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1015,200,17,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (849,209,7,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (865,205,null,'17-32.');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (874,208,7,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (897,206,7,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (948,210,7,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1001,207,null,'9-16');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (852,224,26,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (894,225,24,'5260');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (903,224,19,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1016,225,20,'5300');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (857,211,9,'3:32.120');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1012,212,6,'1:38.318');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1002,216,1,'3:50.467');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1002,217,9,'1:50.156');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (929,220,4,'1:51.139');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (890,226,null,'nem ért célba');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (946,227,28,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (973,228,36,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (863,229,19,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (896,229,24,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (945,230,50,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (919,231,19,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (930,232,35,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (851,233,31,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (973,233,19,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (896,234,5,'2:09.22');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (873,235,1,'1:52.70 (új Európa-csúcs) LK');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (917,235,22,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (873,236,2,'1:56.52');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (917,236,17,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (889,237,32,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (873,238,2,'4:06,16 (új Európa-csúcs)');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (919,238,6,'4:12,84');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (994,240,9,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (997,241,40,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (990,242,24,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (964,243,41,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (877,244,13,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (952,245,11,'1:58.15');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (990,246,18,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1013,246,17,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (866,247,27,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (868,248,18,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (927,248,27,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (905,249,17,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1013,249,9,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (914,250,29,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (905,251,12,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (909,251,13,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (881,253,41,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (955,254,26,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (879,256,19,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (956,256,18,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (991,256,15,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (861,258,4,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (907,258,12,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (937,258,18,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (953,259,14,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (949,260,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (986,260,12,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (925,262,5,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (950,262,10,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1006,262,12,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1181,263,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1182,263,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1183,263,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1184,264,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1185,264,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1186,223,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1187,223,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1188,223,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1201,281,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1202,281,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1203,281,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1204,282,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1205,282,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1206,282,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1207,252,1,'7:44.31');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1208,252,2,'7:45.93');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1209,252,3,'7:46.33');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1210,252,4,'7:49.76');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1211,252,5,'7:50.66');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1221,222,1,'1:32.231');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1222,222,3,'1:34.704');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1241,213,1,'3:11.809');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1242,213,2,'3:13.580');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1243,213,3,'3:14.750');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1244,213,4,'3:14.828');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1261,218,1,'3:36.365');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1262,218,2,'3:36.588');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1281,215,1,'2:55.714');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1282,215,2,'2:56.593');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1283,215,3,'2:56.676');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1284,215,4,'2:57.626');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1301,214,1,'1:28.736');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1241,214,2,'1:28.827');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1302,214,3,'1:30.005');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1303,221,2,'1:42.092');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1304,221,3,'1:42.128');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1135,216,2,'3:52.751');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1114,216,3,'3:53.653');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1124,211,1,'3:26.323');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1128,211,2,'3:27.342');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1103,211,3,'3:27.485');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1140,220,1,'1:50.673');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1131,220,2,'1:50.677');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1126,220,3,'1:51.022');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1133,217,1,'1:47.140');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1135,217,2,'1:48.397');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1141,217,3,'1:48.766');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1103,212,1,'1:37.252');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1112,212,2,'1:37.630');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1124,212,3,'1:37.671');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1132,224,1,'5632');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1122,224,2,'5548');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1121,224,3,'5524');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1127,225,1,'5792');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1123,225,2,'5752');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1142,225,3,'5672');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1106,225,4,'5640');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1115,225,5,'5612');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1120,225,6,'5564');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1104,238,1,'4:03,84 (új világcsúcs; régi: Phelps 4:05,25 ? 2008. 06. 29.)');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1105,238,3,'4:08,09');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1104,235,2,'1:52.03 (új világcsúcs) LK');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1111,235,3,'1:52.97');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1139,235,4,'1:54.35');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1117,235,4,'1:54.35');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1130,245,1,'1:54.82 (új világcsúcs)');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1137,245,2,'1:54.97');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1116,245,3,'1:55.05');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1110,234,1,'2:07.64');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1102,234,2,'2:08.88');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1108,234,3,'2:08.94');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1113,234,4,'2:09.03');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1104,236,1,'1:54.23');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1105,236,3,'1:56.53');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1125,260,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1134,260,2,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1129,199,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1138,199,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1136,199,3,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1161,213,5,'3:15.049');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1161,214,4,'1:30.285');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1162,215,5,'2:59.009');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1163,218,3,'3:40.258');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1164,219,null,'Középdöntő');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1165,221,1,'1:41.308');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1166,222,2,'1:32.971');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1167,239,13,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1168,252,6,'7:55.53');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1169,255,7,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1170,257,5,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1171,261,4,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1172,263,4,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1173,264,1,'');
INSERT INTO o_eredmenyek (VERSENYZO_AZON,VERSENYSZAM_AZON,HELYEZES,MEGJEGYZES) VALUES (1174,223,4,'');


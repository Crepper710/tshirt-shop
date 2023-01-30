DROP TABLE IF EXISTS ArtikelPassform;
DROP TABLE IF EXISTS ArtikelGroeße;
DROP TABLE IF EXISTS ArtikelFarbe;
DROP TABLE IF EXISTS ArtikelMotiv;
DROP TABLE IF EXISTS ArtikelMaterial;
DROP TABLE IF EXISTS passform;
DROP TABLE IF EXISTS motiv;
DROP TABLE IF EXISTS farbe;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS Groeße;
DROP TABLE IF EXISTS lieferantartikel;
DROP TABLE IF EXISTS lieferant;
DROP TABLE IF EXISTS bestellungartikel;
DROP TABLE IF EXISTS BenutzerBestellung;
DROP TABLE IF EXISTS bestellung;
DROP TABLE IF EXISTS benutzer;
DROP TABLE IF EXISTS artikel;


CREATE TABLE Artikel (
ArtikelID INT PRIMARY KEY,
ArtikelBezeichnung VARCHAR (255),
ArtikelBeschreibung VARCHAR(255),
Preis DECIMAL(10,2)
);

INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (1, 'T-Shirt', 'Komfortables T-Shirt aus Baumwolle', 15.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (7, 'T-Shirt', 'Stylisches T-Shirt mit aufgedrucktem Logo hinten', 19.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (8, 'T-Shirt', 'Langärmeliges T-Shirt aus Baumwolle', 24.99);

INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (2, 'Laptop Tasche', 'Robuste Laptoptasche aus Leder', 49.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (9, 'Laptop Tasche', 'Moderne Laptoptasche aus Nylon', 39.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (10, 'Laptop Tasche', 'Laptoptasche mit integriertem Ladegerät', 59.99);

INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (3, 'Rucksack', 'Leichter Rucksack mit vielen Taschen', 29.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (11, 'Rucksack', 'Rucksack mit Regenschutz', 34.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (12, 'Rucksack', 'Rucksack mit Laptopfach', 39.99);

INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (4, 'Kugelschreiber', 'Kugelschreiber mit Druckmechanismus', 0.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (13, 'Kugelschreiber', 'Kugelschreiber mit graviertem logo', 1.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (14, 'Kugelschreiber', 'Kugelschreiber aus Metall', 1.49);

INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (5, 'Thermo Becher', 'Isolierter Thermobecher', 9.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (15, 'Thermo Becher', 'Thermobecher aus Edelstahl', 14.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (16, 'Thermo Becher', 'Thermobecher aus Plasik', 12.99);

INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (6, 'Kalender', 'Kalender für das Jahr 2023', 7.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (18, 'Kalender', 'Wandkalender', 14.99);
INSERT INTO Artikel (ArtikelID, ArtikelBezeichnung, ArtikelBeschreibung, Preis)
VALUES (19, 'Kalender', 'Tischkalender mit woechentlichen Notizen', 9.99);



CREATE TABLE Lieferant (
LieferantenID INT PRIMARY KEY,
FirmenName VARCHAR (255),
Strasse VARCHAR (255),
Ort VARCHAR (255),
PLZ INT,
Email VARCHAR (255)
);

INSERT INTO Lieferant (LieferantenID, FirmenName, Strasse, Ort, PLZ, Email)
VALUES (1, 'WARDOW GmbH', 'Magdeburger Straße 5', 'Wustermark', 14641, 'service@wardow.com');
INSERT INTO Lieferant (LieferantenID, FirmenName, Strasse, Ort, PLZ, Email)
VALUES (2, 'SWS-Schüler GmbH', 'Degernpoint H2', 'Moosburg a. d. Isar', 85368, 'service@SWS-Schüler .com');
INSERT INTO Lieferant (LieferantenID, FirmenName, Strasse, Ort, PLZ, Email)
VALUES (3, 'National Pen GmbH', 'Am Zirkus 2', 'Berlin', 10117, 'irccodeteam@pens.com');
INSERT INTO Lieferant (LieferantenID, FirmenName, Strasse, Ort, PLZ, Email)
VALUES (4, 'Printus GmbH', 'Carl-Zeiss-Straße 1', 'Offenburg', 77656, 'kundenservice@printus.de');
INSERT INTO Lieferant (LieferantenID, FirmenName, Strasse, Ort, PLZ, Email)
VALUES (5, 'sprd.net AG', 'Gießerstraße 27', 'Leipzig', 04229, 'legal@spreadshirt.net');




CREATE TABLE Benutzer (
BenutzerID SERIAL PRIMARY KEY,
Vorname VARCHAR (255),
Nachname VARCHAR (255),
Strasse VARCHAR (255),
PLZ INT,
Ort VARCHAR (255),
Email VARCHAR (255),
Passwort VARCHAR (255)

);


INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Lennert', 'Beasley', 'Hapertstraße 97', 34254, 'Neu Wilhelmsburg', 'Lennert.Beasley@mail.com', 'Passwort5342');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Josh', 'Simons', 'Silberstraße 78', 67234, 'Frohenstadt', 'josh.simons@mail.com', 'Passwort2764');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Lukas', 'Müller', 'Silberstraße 78', 92834, 'Dortmund', 'lukas.müller@mail.com', 'Passwort9722');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Simone', 'Wirtz', 'Lupferstraße 17', 67234, 'Kussstadt', 'Simone.Wirtz@mail.com', 'Passwort7788');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Sabrina', 'Keller', 'Baumallee 66', 22986, 'Rückenstadt', 'Sabrina.Keller@mail.com', 'Passwort4344');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Mathias', 'Gülper', 'Pfostenwiese 78', 18764, 'Siebenstadt', 'Mathias.Gülper@mail.com', 'Passwort1287');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Joe', 'Brown', 'Siebenstraße 35', 81624, 'Portstadt', 'Joe.Brown@mail.com', 'Passwort9922');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Jan', 'Johnson', 'Kaliumkamp 99', 98123, 'Elfenstadt', 'Jan.Johnson@mail.com', 'Passwort4499');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Leah', 'Sommer', 'Kreidestraße 19', 16734, 'Kieferstadt', 'Leah.Sommer@mail.com', 'Passwort3565');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Sarah', 'Fass', 'Zellenallee 77', 01534, 'Krehenstadt', 'Sarah.Fass@mail.com', 'Passwort7794');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Tina', 'Meratti', 'Karottenstraße 27', 99018, 'Seltastadt', 'Tina.Meratti@mail.com', 'Passwort5682');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Bella', 'Caruso', 'Welpenkamp 53', 67236, 'Bengalstadt', 'Bella.Caruso@mail.com', 'Passwort8827');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Thilo', 'Zapper', 'Raupenstraße 76', 77314, 'Pokerstadt', 'Thilo.Zapper@mail.com', 'Passwort7171');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Axel', 'Schweiß', 'Ritterallee 91', 42665, 'Pendelstadt', 'Axel.Schweiß@mail.com', 'Passwort1717');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort) 
VALUES ('Hans', 'Olo', 'Milleniumstraße 54', 24778, 'Wortstadt', 'Hans.Olo@mail.com', 'Passwort1122');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Lars', 'Krismes', 'Whamstraße 67', 87453, 'Waschstadt', 'Lars.Krismes@mail.com', 'Passwort2343');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Claire', 'Werk', 'Hammerstraße 87', 63451, 'Cosmostadt', 'Claire.Werk@mail.com', 'Passwort9098');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Ken', 'Guru', 'Australienstraße 12', 65535, 'Monitorstadt', 'Ken.Guru@mail.com', 'Passwort7654');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Anne', 'Theke', 'Barstraße 64', 42425, 'Millenstadt', 'Anne.Theke@mail.com', 'Passwort2352');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Ali', 'Mente', 'Quallenstraße 73', 88756, 'Computerstadt', 'Ali.Mente@mail.com', 'Passwort4567');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Maike', 'Fer', 'Klumpenstraße 43', 11743, 'Ballstadt', 'Maike.Fer@mail.com', 'Passwort4445');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Ella', 'Stisch', 'Tupperstraße 54', 88357, 'Jakobsstadt', 'Ella.Stisch@mail.com', 'Passwort8245');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Donna', 'Wetter', 'Gunterstraße 82', 91233, 'Gelddorf', 'Donna.Wetter@mail.com', 'Passwort6273');
INSERT INTO Benutzer (Vorname, Nachname, Strasse, PLZ, Ort, Email, Passwort)
VALUES ('Phil', 'Stift', 'Ersatzstraße 90', 74536, 'Helmstadt', 'Phil.Stift@mail.com', 'Passwort8437');



CREATE TABLE Passform (
PassformID INT PRIMARY KEY,
PassformBezeichnung VARCHAR (255)
);

INSERT INTO Passform (PassformID, PassformBezeichnung)
VALUES (1, 'Slim Fit');
INSERT INTO Passform (PassformID, PassformBezeichnung)
VALUES (2, 'Regular Fit');
INSERT INTO Passform (PassformID, PassformBezeichnung)
VALUES (3, 'Comfort Fit');
INSERT INTO Passform (PassformID, PassformBezeichnung)
VALUES (4, 'Loose Fit');
INSERT INTO Passform (PassformID, PassformBezeichnung)
VALUES (5, 'Tailored Fit');



CREATE TABLE Bestellung (
BestellID SERIAL PRIMARY KEY,
KundenID INT,
ArtikelID INT,
PassformID INT,
GroeßenID INT,
MotivID INT,
FarbID INT,
MaterialID INT,
Anzahl INT,

FOREIGN KEY (KundenID) REFERENCES Benutzer(BenutzerID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID)
);


INSERT INTO Bestellung (KundenID, ArtikelID, PassformID, GroeßenID, MotivID, FarbID, MaterialID, Anzahl)
VALUES (1, 1, 1, 3, 6, 7, 5, 1);
INSERT INTO Bestellung (KundenID, ArtikelID, PassformID, GroeßenID, MotivID, FarbID, MaterialID, Anzahl)
VALUES (2, 2, NULL, 19, 7, 4, 2, 1);
INSERT INTO Bestellung (KundenID, ArtikelID, PassformID, GroeßenID, MotivID, FarbID, MaterialID, Anzahl)
VALUES (3, 3, NULL, 3, 8, 2, 2, 1);
INSERT INTO Bestellung (KundenID, ArtikelID, PassformID, GroeßenID, MotivID, FarbID, MaterialID, Anzahl)
VALUES (4, 4, NULL, NULL, 1, 6, 7, 1);
INSERT INTO Bestellung (KundenID, ArtikelID, PassformID, GroeßenID, MotivID, FarbID, MaterialID, Anzahl)
VALUES (5, 5, NULL, 4, 7, 8, 7, 1);




CREATE TABLE Groeße (
GroeßenID INT PRIMARY KEY,
GroeßenBezeichnung VARCHAR (255)

);


INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (1, 'XS');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (2, 'S');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (3, 'M');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (4, 'L');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (5, 'XL');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (6, 'XXL');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (7, '3XL');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (8, '4XL');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (9, '5XL');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (10, '100ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (11, '150ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (12, '200ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (13, '250ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (14, '400ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (15, '500ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (16, '1000ml');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (17, '13 Zoll');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (18, '14 Zoll');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (19, '15 Zoll');
INSERT INTO Groeße (GroeßenID, GroeßenBezeichnung)
VALUES (20, '17 Zoll');



CREATE TABLE Motiv (
MotivID INT PRIMARY KEY,
MotivBezeichnung VARCHAR (255),
BildPath VARCHAR (255)
);

INSERT INTO Motiv (MotivID, MotivBezeichnung, BildPath)
VALUES (6, 'BHH', 'C:\Benutzers\rs\Pictures\Camera Roll BHH_Bildmarke_Signet_Verlauf.jpg');
INSERT INTO Motiv (MotivID, MotivBezeichnung, BildPath)
VALUES (7, 'ITECH', 'C:\Benutzers\rs\Pictures\Camera Roll hex-uebersicht.png');
INSERT INTO Motiv(MotivID, MotivBezeichnung, BildPath)
VALUES (8,'BHH&ITECH', 'C:\Benutzers\rs\Pictures\Camera Roll BHH&ITECH.png');



CREATE TABLE Farbe (
FarbID INT PRIMARY KEY,
FarbBezeichnung VARCHAR (255),
HexCode VARCHAR (255)
);

INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (1, 'Rot', '#960018');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (2, 'Blau', '#36648B');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (3, 'Grün', '#316D33');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (4, 'Schwarz', '#000000');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (5, 'Weiß', '#FFFFFF');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (6, 'Gelb', '#FFFF00');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (7, 'Orange', '#EC5800');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (8, 'Lila', '#800080');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (9, 'Braun', '#793D00');
INSERT INTO Farbe (FarbID, FarbBezeichnung,HexCode)
VALUES (10, 'Beige', '#C6A664');




CREATE TABLE Material (
MaterialID INT PRIMARY KEY,
MaterialBezeichnung VARCHAR (255)
);

INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (1, 'Metall');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (2, 'Leder');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (3, 'Plastik');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (4, 'Kunststoff');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (5, 'Baumwolle');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (6, 'Nylon');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (7, 'Edelstahl');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (8, 'Papier');
INSERT INTO Material (MaterialID, MaterialBezeichnung) VALUES (9, 'FotoPapier');




CREATE TABLE LieferantArtikel (
LieferungID INT PRIMARY KEY,
LieferantenID INT,
ArtikelID INT,

FOREIGN KEY (LieferantenID) REFERENCES Lieferant(LieferantenID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID)
);


INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (1, 1, 2);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (2,1,9);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (3,1,10);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (4,2,5);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (5,2,15);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (6,2,16);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (7,3,4);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (8,3,13);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (9,3,14);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (10,4,6);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (11,4,18);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (12,4,19);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (13,1,3);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (14,1,11);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (15,1,12);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (16,5,1);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (17,5,7);
INSERT INTO LieferantArtikel (LieferungID, LieferantenID, ArtikelID) VALUES (18,5,8);



CREATE TABLE ArtikelPassform (
ArtikelID INT,
PassformID INT,

PRIMARY KEY (ArtikelID, PassformID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID),
FOREIGN KEY (PassformID) REFERENCES Passform(PassformID)
);

INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (1,1);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (1,2);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (1,3);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (1,4);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (1,5);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (7,1);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (7,2);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (7,3);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (7,4);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (7,5);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (8,1);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (8,2);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (8,3);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (8,4);
INSERT INTO artikelPassform (ArtikelID, PassformID) VALUES (8,5);

CREATE TABLE ArtikelGroeße (
ArtikelID INT,
GroeßenID INT,

PRIMARY KEY (ArtikelID, GroeßenID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID),
FOREIGN KEY (GroeßenID) REFERENCES Groeße(GroeßenID)
);

INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,1);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,2);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,6);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,7);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,8);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (1,9);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,1);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,2);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,6);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,7);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,8);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (7,9);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,1);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,2);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,6);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,7);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,8);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (8,9);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (2,17);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (2,18);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (2,19);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (2,20);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (9,17);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (9,18);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (9,19);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (9,20);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (10,17);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (10,18);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (10,19);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (10,20);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (5,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (5,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (5,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (15,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (15,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (15,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (16,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (16,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (16,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (6,3);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (6,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (6,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (18,4);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (18,5);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (18,6);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (18,7);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (18,8);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (18,9);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (19,1);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (19,2);
INSERT INTO ArtikelGroeße (ArtikelID, GroeßenID) VALUES (19,3);

CREATE TABLE ArtikelFarbe (
ArtikelID INT,
FarbID INT,

PRIMARY KEY (ArtikelID,FarbID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID),
FOREIGN KEY (FarbID) REFERENCES Farbe(FarbID)
);

INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,6);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (1,10);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,6);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (7,10);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,6);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (8,10);

INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (2,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (2,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (2,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (9,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (9,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (9,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (10,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (10,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (10,9);

INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (3,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (3,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (3,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (11,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (11,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (11,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (12,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (12,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (12,9);

INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (4,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (4,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (4,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (4,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (4,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (4,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (13,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (13,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (13,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (13,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (13,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (13,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (14,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (14,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (14,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (14,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (14,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (14,8);

INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,6);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (5,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,6);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (15,9);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,1);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,2);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,3);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,4);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,6);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,7);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,8);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (16,9);


INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (6,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (18,5);
INSERT INTO artikelfarbe (ArtikelID, FarbID) VALUES (19,5);



CREATE TABLE ArtikelMotiv (
ArtikelID INT,
MotivID INT,

PRIMARY KEY (ArtikelID,MotivID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID),
FOREIGN KEY (MotivID) REFERENCES Motiv(MotivID)
);


INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (1,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (1,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (1,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (7,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (7,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (7,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (8,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (8,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (8,8);


INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (2,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (2,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (2,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (9,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (9,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (9,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (10,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (10,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (10,8);


INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (3,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (3,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (3,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (11,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (11,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (11,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (12,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (12,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (12,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (4,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (4,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (4,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (13,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (13,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (13,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (14,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (14,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (14,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (5,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (5,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (5,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (15,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (15,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (15,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (16,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (16,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (16,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (6,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (6,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (6,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (18,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (18,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (18,8);

INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (19,6);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (19,7);
INSERT INTO artikelMotiv (ArtikelID, MotivID) VALUES (19,8);

CREATE TABLE ArtikelMaterial (
ArtikelID INT,
MaterialID INT,

PRIMARY KEY (ArtikelID,MaterialID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID),
FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID)
);

INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (1,5);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (1,6);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (7,5);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (7,6);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (8,5);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (8,6);

INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (2,2);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (9,2);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (10,2);

INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (3,2);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (11,2);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (12,2);

INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (4,1);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (4,3);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (4,4);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (4,7);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (13,1);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (13,3);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (13,4);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (13,7);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (14,1);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (14,3);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (14,4);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (14,7);

INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (5,1);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (5,3);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (5,4);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (5,7);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (15,1);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (15,3);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (15,4);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (15,7);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (16,1);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (16,3);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (16,4);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (16,7);

INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (6,8);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (6,9);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (18,8);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (18,9);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (19,8);
INSERT INTO artikelMaterial (ArtikelID, MaterialID) VALUES (19,9);





CREATE TABLE BestellungArtikel (
BestellID INT,
ArtikelID INT,

PRIMARY KEY (BestellID,ArtikelID),
FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID),
FOREIGN KEY (ArtikelID) REFERENCES Artikel(ArtikelID)
);

INSERT INTO BestellungArtikel (BestellID, ArtikelID) VALUES (1,1);
INSERT INTO BestellungArtikel (BestellID, ArtikelID) VALUES (2,2);
INSERT INTO BestellungArtikel (BestellID, ArtikelID) VALUES (3,3);
INSERT INTO BestellungArtikel (BestellID, ArtikelID) VALUES (4,4);
INSERT INTO BestellungArtikel (BestellID, ArtikelID) VALUES (5,5);




CREATE TABLE BenutzerBestellung (
BenutzerID INT,
BestellID INT,

PRIMARY KEY (BenutzerID,BestellID),
FOREIGN KEY (BenutzerID) REFERENCES Benutzer(BenutzerID),
FOREIGN KEY (BestellID) REFERENCES Bestellung(BestellID)
);



INSERT INTO BenutzerBestellung (BenutzerID, BestellID) VALUES (1,1);
INSERT INTO BenutzerBestellung (BenutzerID, BestellID) VALUES (2,2);
INSERT INTO BenutzerBestellung (BenutzerID, BestellID) VALUES (3,3);
INSERT INTO BenutzerBestellung (BenutzerID, BestellID) VALUES (4,4);
INSERT INTO BenutzerBestellung (BenutzerID, BestellID) VALUES (5,5);


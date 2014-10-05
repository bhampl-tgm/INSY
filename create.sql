-- Schokolandenfabrik_Create.sql
-- Autor: Burkhard Hampl <burkhard.hampl@student.tgm.ac.at>
-- Datum: 18.09.2014
-- Zweck: Erstellen einer Datenbank mittels SQL für eine Schokoladenfabrik

-- DROP DATABASE IF EXISTS schokoladenfabrik;
CREATE DATABASE IF NOT EXISTS schokoladenfabrik CHAR SET 'utf8';
USE schokoladenfabrik;

CREATE TABLE person(
  penr INT NOT NULL,
  pnname VARCHAR(50) NOT NULL,
  pvname VARCHAR(50) NOT NULL,
  PRIMARY KEY (penr)
);

CREATE TABLE mitarbeiter(
  penr INT NOT NULL,
  mieindatum DATE NOT NULL,
  mikuedatum DATE NOT NULL,
  PRIMARY KEY (penr),
  FOREIGN KEY (penr) REFERENCES person(penr)
);

CREATE TABLE kuenstler(
  penr INT NOT NULL,
  klbkgrad INT NOT NULL,
  PRIMARY KEY (penr),
  FOREIGN KEY (penr) REFERENCES person(penr)
);

CREATE TABLE produkt(
  prnr INT NOT NULL,
  prbez VARCHAR(50) NOT NULL,
  prgew INT NOT NULL,
  PRIMARY KEY (prnr)
);

CREATE TABLE standardsortiment(
  prnr INT NOT NULL,
  svkpreis FLOAT NOT NULL,
  svpart VARCHAR(50) NOT NULL,
  PRIMARY KEY (prnr),
  FOREIGN KEY (prnr) REFERENCES produkt(prnr)
);

CREATE TABLE kunstwerk(
  prnr INT NOT NULL,
  penr INT NOT NULL,
  kwswer FLOAT NOT NULL,
  PRIMARY KEY (prnr,penr),
  FOREIGN KEY (prnr) REFERENCES produkt(prnr),
  FOREIGN KEY (penr) REFERENCES person(penr)
);

CREATE TABLE maschine(
  manr INT NOT NULL,
  mabesch VARCHAR(100) NOT NULL,
  penr INT NOT NULL,
  prnr INT NOT NULL,
  PRIMARY KEY (manr),
  FOREIGN KEY (penr) REFERENCES person(penr),
  FOREIGN KEY (prnr) REFERENCES produkt(prnr)
);

CREATE TABLE lager(
  lbez VARCHAR(50) NOT NULL,
  lflaeche FLOAT NOT NULL,
  penr INT NOT NULL,
  PRIMARY KEY (lbez),
  FOREIGN KEY (penr) REFERENCES person(penr)
);

CREATE TABLE eingelagert(
  prnr INT NOT NULL,
  lbez VARCHAR(50) NOT NULL,
  emenge INT NOT NULL,
  PRIMARY KEY (prnr, lbez),
  FOREIGN KEY (prnr) REFERENCES produkt(prnr),
  FOREIGN KEY (lbez) REFERENCES lager(lbez)
);

CREATE TABLE firma(
  fname VARCHAR(50) NOT NULL,
  fkadr VARCHAR(100) NOT NULL,
  ftnr VARCHAR(50) NOT NULL,
  PRIMARY KEY (fname)
);

CREATE TABLE auftrag(
  anr INT NOT NULL,
  fname VARCHAR(50) UNIQUE NOT NULL,
  aadatum DATE NOT NULL,
  astatus VARCHAR(50) NOT NULL,
  prnr INT NOT NULL,
  PRIMARY KEY (anr,fname),
  FOREIGN KEY (fname) REFERENCES firma(fname),
  FOREIGN KEY (prnr) REFERENCES produkt(prnr)
);

CREATE TABLE kunstschau(
  ksname VARCHAR(50) NOT NULL,
  ksdatum DATE NOT NULL,
  ksort VARCHAR(50) NOT NULL,
  ksland VARCHAR(50) NOT NULL,
  PRIMARY KEY (ksname)
);

CREATE TABLE gezeigtbei(
  prnr INT NOT NULL,
  penr INT NOT NULL,
  ksname VARCHAR(50) NOT NULL,
  gplatz INT NOT NULL,
  PRIMARY KEY (prnr,penr,ksname),
  FOREIGN KEY (prnr) REFERENCES produkt(prnr),
  FOREIGN KEY (penr) REFERENCES kunstwerk(penr),
  FOREIGN KEY (ksname) REFERENCES kunstschau(ksname)
);

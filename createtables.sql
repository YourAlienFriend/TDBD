CREATE TABLE Disco (
  id   SERIAL NOT NULL, 
  name varchar(255), 
  City varchar(255), 
  PRIMARY KEY (id));
CREATE TABLE Artists (
  id    SERIAL NOT NULL, 
  name  varchar(255), 
  "s-b" SET('solo','band'), 
  PRIMARY KEY (id));
CREATE TABLE Songs (
  id    int4 NOT NULL UNIQUE, 
  Aid   int4 NOT NULL, 
  Did   int4 NOT NULL, 
  album varchar(255), 
  name  varchar(255), 
  genre varchar(255), 
  PRIMARY KEY (id, 
  Aid, 
  Did));
CREATE TABLE recorder (
  id      SERIAL NOT NULL, 
  name    int4, 
  phone   int4, 
  address varchar(255), 
  PRIMARY KEY (id));
CREATE TABLE Recordings (
  id     int4 NOT NULL UNIQUE, 
  eid    int4 NOT NULL, 
  sid    int4 NOT NULL, 
  "date" date, 
  PRIMARY KEY (id, 
  eid, 
  sid));
ALTER TABLE Songs ADD CONSTRAINT Discoid FOREIGN KEY (Did) REFERENCES Disco (id);
ALTER TABLE Songs ADD CONSTRAINT Artistsid FOREIGN KEY (Aid) REFERENCES Artists (id);
ALTER TABLE Recordings ADD CONSTRAINT FKRecordings863780 FOREIGN KEY (eid) REFERENCES recorder (id);
ALTER TABLE Recordings ADD CONSTRAINT FKRecordings791556 FOREIGN KEY (sid) REFERENCES Songs (id);

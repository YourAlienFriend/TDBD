CREATE TABLE Disco (
  id   number GENERATED AS IDENTITY, 
  name varchar2(255), 
  City varchar2(255), 
  PRIMARY KEY (id));
CREATE TABLE Artists (
  id    number GENERATED AS IDENTITY, 
  name  varchar2(255), 
  "s-b" varchar2(255), 
  PRIMARY KEY (id));
CREATE TABLE Songs (
  id    number NOT NULL UNIQUE, 
  Aid   number NOT NULL, 
  Did   number NOT NULL, 
  album varchar2(255), 
  name  varchar2(255), 
  genre varchar2(255), 
  PRIMARY KEY (id, 
  Aid, 
  Did));
CREATE TABLE recorder (
  id      number GENERATED AS IDENTITY, 
  name    number, 
  phone   number, 
  address varchar2(255), 
  PRIMARY KEY (id));
CREATE TABLE Recordings (
  id     number NOT NULL UNIQUE, 
  eid    number NOT NULL, 
  sid    number NOT NULL, 
  "date" date, 
  PRIMARY KEY (id, 
  eid, 
  sid));
ALTER TABLE Songs ADD CONSTRAINT Discoid FOREIGN KEY (Did) REFERENCES Disco (id);
ALTER TABLE Songs ADD CONSTRAINT Artistsid FOREIGN KEY (Aid) REFERENCES Artists (id);
ALTER TABLE Recordings ADD CONSTRAINT FKRecordings863780 FOREIGN KEY (eid) REFERENCES recorder (id);
ALTER TABLE Recordings ADD CONSTRAINT FKRecordings791556 FOREIGN KEY (sid) REFERENCES Songs (id);

CREATE TABLE Disco (
  id   number(10) NOT NULL, 
  name varchar2(255), 
  City varchar2(255), 
  PRIMARY KEY (id));
CREATE TABLE Artists (
  id    number(10) NOT NULL, 
  name  varchar2(255), 
  "s-b" varchar2(255), 
  PRIMARY KEY (id));
CREATE TABLE Songs (
  id    number(10) NOT NULL, 
  album varchar2(255), 
  name  varchar2(255), 
  Did   number(10) NOT NULL, 
  genre varchar2(255), 
  Aid   number(10) NOT NULL, 
  PRIMARY KEY (id));
CREATE TABLE recorder (
  id      number NOT NULL, 
  name    number, 
  phone   number, 
  address varchar2(255), 
  PRIMARY KEY (id));
CREATE TABLE Recordings (
  id     number(10) NOT NULL, 
  eid    number NOT NULL, 
  sid    number(10) NOT NULL, 
  "date" date, 
  hall   varchar2(255), 
  PRIMARY KEY (id, 
  eid, 
  sid));
ALTER TABLE Songs ADD CONSTRAINT Discoid FOREIGN KEY (Did) REFERENCES Disco (id);
ALTER TABLE Songs ADD CONSTRAINT Artistsid FOREIGN KEY (Aid) REFERENCES Artists (id);
ALTER TABLE Recordings ADD CONSTRAINT FKRecordings863780 FOREIGN KEY (eid) REFERENCES recorder (id);
ALTER TABLE Recordings ADD CONSTRAINT FKRecordings791556 FOREIGN KEY (sid) REFERENCES Songs (id);

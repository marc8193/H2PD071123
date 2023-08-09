use School

CREATE TABLE person (
  personId INT IDENTITY(1, 1),
  cpr CHAR(11) NOT NULL UNIQUE,
  navn VARCHAR(64) NOT NULL,
  alder TINYINT,
  PRIMARY KEY(personId)
)
CREATE TABLE adresse (
  person INT NOT NULL,
  vej VARCHAR(64) NOT NULL,
  husnummer VARCHAR(8) NOT NULL,
  [by] VARCHAR(32) NOT NULL,
  postnummer VARCHAR(10)
  PRIMARY KEY(person)
)
CREATE TABLE [hold] ( 
[hold] CHAR(10) NOT NULL, 
holdlokale VARCHAR(8), 
PRIMARY KEY([hold]) 
)
CREATE TABLE kontaktinfo ( 
person INT NOT NULL, 
contactType VARCHAR(32) NOT NULL, 
value VARCHAR(64) NOT NULL, 
PRIMARY KEY(person,contactType) 
)
CREATE TABLE elev (
	elevNr	INT PRIMARY KEY IDENTITY(1,1),
	person	INT NOT NULL UNIQUE,
	[hold]	CHAR(10),
	værge	INT NOT NULL,
	kontaktlærer INT
	)
GO

INSERT INTO adresse (person, vej, husnummer, [by], postnummer) VALUES
(1, 'Bagerbakke', 4, 'Aalborg', '9000'),
(2, 'Kødsvinget', '8', 'Bjerget', '8080'),
(3, 'Imorgenvej', '7', 'Frem', '7777')
INSERT INTO [hold] VALUES ('h2pd111111', 'B109'), ('h3pd222222', 'B209')
INSERT INTO kontaktinfo VALUES (1,'email','kurt@urt.dk'),
(1,'mobil', ''),
(1,'arbejde', ''),
(2,'email', 'maj@seel.dk'),
(2,'mobil', '11223344')
INSERT INTO person (cpr, navn, alder) VALUES 
('121212-5031','Kurt Urtekram',17),
('111111-8528','Maj Seel',21),
('123121-1231','Preben Firben',43),
('212312-3232','Ninna Hare',52),
('121212-3212','Randi Urtekram',44),
('231312-5426','Maj Seel',78),
('222222-2222','Ida Igor',24)
INSERT INTO elev (person, [hold], værge, kontaktlærer) VALUES
(1,'h2pd111111',5,3),
(2,'h2pd111111',0,4),
(3,'h3pd222222',0,3)
GO

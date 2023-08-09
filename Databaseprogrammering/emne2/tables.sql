CREATE TABLE navne (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	navn TEXT NOT NULL UNIQUE
);

CREATE TABLE hold (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	hold TEXT NOT NULL UNIQUE
);

CREATE TABLE lokaler (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	lokale TEXT NOT NULL UNIQUE
);

CREATE TABLE vaerge (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	navnId INTEGER NOT NULL,
	FOREIGN KEY (navnId)
		REFERENCES navne (id)
);

CREATE TABLE kontaktlaerer (
	id INTEGER PRIMARY KEY AUTOINCREINSERT INTO adresse() VALUES ("Bagerbakke", "4", "Aalborg", "9000")MENT,
	navnId INTEGER NOT NULL,
	FOREIGN KEY (navnId)
		REFERENCES navne (id)
);

CREATE TABLE adresse (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	vej TEXT NOT NULL,
	husnr TEXT NOT NULL,
	by TEXT NOT NULL,
	postnr TEXT NOT NULL
);

CREATE TABLE alder (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	alder INTEGER NOT NULL
)

CREATE TABLE elever (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	navnId INTEGER NOT NULL,	
	kontaktinfoId INTEGER NOT NULL,
	holdId INTEGER NOT NULL,
	lokaleId INTEGER,
	vaergeId INTEGER,
	kontaktlaererId INTEGER,
	adresseId INTEGER NOT NULL,
	alderId INTEGER NOT NULL,	
	FOREIGN KEY (navnId) REFERENCES navne (id),
	FOREIGN KEY (kontaktinfoId) REFERENCES kontaktinfo (id),
	FOREIGN KEY (holdId) REFERENCES hold (id),
	FOREIGN KEY (lokaleId) REFERENCES lokaler (id),
	FOREIGN KEY (vaergeId) REFERENCES navne (id),
	FOREIGN KEY (kontaktlaererId) REFERENCES navne (id),
	FOREIGN KEY (adresseId) REFERENCES adresse (id),
	FOREIGN KEY (alderId) REFERENCES alder (id)
);

INSERT INTO hold(hold) VALUES ("h2pd11111");

INSERT INTO lokaler(lokale) VALUES ("B109");

INSERT INTO navne(navn) VALUES ("Randi Urtekram"), ("Preben Firben"), ("Ninna Hare"), ("Maj Seel"), ("Kurt Urtekram");

INSERT INTO adresse(vej, husnr, by, postnr) VALUES ("Bagerbakke", "4", "Aalborg", "9000"), ("Kødsvinget", "8", "Bjerget", "8080");

INSERT INTO alder (alder) VALUES ("17"), ("21");

INSERT INTO kontaktinfo (email, mobil, arbejde) VALUES ("kurt@urt.dk", "12345678", "87654321"), ("maj@seel.dk", "12345678", "1324");

INSERT INTO elever (navnId, kontaktinfoId, holdId, lokaleId, vaergeId, kontaktlaererId, adresseId, alderId)
VALUES (5, 1, 1, 1, 1, 1, 2, 1), (4, 2, 1, 1, null, 3, 2, 2)
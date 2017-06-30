CREATE TABLE site (
	siteName TEXT,
	grouping TEXT,
	PRIMARY KEY (siteName, grouping)
);


-- Every site may have zero or more tombs.
-- Every tomb must belong to one and only one site.

CREATE TABLE tomb (
	tombNumber NUMBER, 
	siteName TEXT REFERENCES site,
	grouping TEXT REFERENCES site,
	PRIMARY KEY (tombNumber, siteName, grouping),
	porterMossNumber TEXT,
	
);

CREATE TABLE dynasty (
	dynastyNumber NUMBER PRIMARY KEY
);

CREATE TABLE person (
	personID NUMBER PRIMARY KEY
);

CREATE TABLE relationshipType (
	relationshipType TEXT PRIMARY KEY,
);

INSERT INTO relationshipType (relationshipType) VALUES ('is Father of');
INSERT INTO relationshipType (relationshipType) VALUES ('is paternal grandfather of');
INSERT INTO relationshipType (relationshipType) VALUES ('is maternal grandfather of');
INSERT INTO relationshipType (relationshipType) VALUES ('is mother of');
INSERT INTO relationshipType (relationshipType) VALUES ('is Father in law of');
INSERT INTO relationshipType (relationshipType) VALUES ('is mother in law of');
INSERT INTO relationshipType (relationshipType) VALUES ('is paternal grandmother of');
INSERT INTO relationshipType (relationshipType) VALUES ('is maternal grandmother of');
INSERT INTO relationshipType (relationshipType) VALUES ('is aunt of');
INSERT INTO relationshipType (relationshipType) VALUES ('is paternal aunt of');
INSERT INTO relationshipType (relationshipType) VALUES ('is maternal aunt of');
INSERT INTO relationshipType (relationshipType) VALUES ('is uncle of');
INSERT INTO relationshipType (relationshipType) VALUES ('is paternal uncle of');
INSERT INTO relationshipType (relationshipType) VALUES ('is maternal uncle of');
INSERT INTO relationshipType (relationshipType) VALUES ('is wife of');
INSERT INTO relationshipType (relationshipType) VALUES ('is husband of');
INSERT INTO relationshipType (relationshipType) VALUES ('is son of');
INSERT INTO relationshipType (relationshipType) VALUES ('is daughter of');
INSERT INTO relationshipType (relationshipType) VALUES ('is sister of');
INSERT INTO relationshipType (relationshipType) VALUES ('is brother of');
INSERT INTO relationshipType (relationshipType) VALUES ('is sister in law of');
INSERT INTO relationshipType (relationshipType) VALUES ('is brother in law of');
INSERT INTO relationshipType (relationshipType) VALUES ('is a dependent of');




CREATE TABLE relationship (
	relationshipType TEXT REFERENCES relationshipType,
	fromPersonID NUMBER REFERENCES person (personID),
	toPersonID NUMBER REFERENCES person (personID),
	PRIMARY KEY (relationshipType, fromPersonID, toPersonID)
);




CREATE TABLE reign (
	personID NUMBER PRIMARY KEY REFERENCES person,
	dynastyNumber NUMBER REFERENCES dynasty
);

-- Every interredPerson must be interred in one and only one tomb.
-- Every tomb may have zero or more interredPersons therein.

CREATE TABLE representedPerson (
	personID NUMBER REFERENCES person,
	PRIMARY KEY (personID),
	tombNumber NUMBER, 
	siteName TEXT REFERENCES site,
	grouping TEXT REFERENCES site
);

CREATE TABLE interredPerson (
	personID NUMBER REFERENCES person,
	PRIMARY KEY (personID),
	tombNumber NUMBER, 
	siteName TEXT REFERENCES site,
	grouping TEXT REFERENCES site,
	isTombOwner BOOLEAN
);


-- Every interred person may have zero or more names.
-- Every name must belong to one and only one interred person.

CREATE TABLE name (
	personID TEXT REFERENCES person,
	name TEXT, 
	PRIMARY KEY (personID, name),
	nameType TEXT, -- includes modern name types like Newberry
	isPreferredName BOOLEAN
);

CREATE TABLE title (
	personID TEXT REFERENCES person,
	title TEXT, 
	PRIMARY KEY (personID, title),
	isSignificantTitle BOOLEAN -- (When printing titles, print it?)
);




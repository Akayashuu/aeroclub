CREATE TABLE avions (
    numAvions integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    types char(8),
    tauxDouble real,
    forfait1 real,
    forfait2 real,
    forfait3 real,
    reductionSemaine real,
    immatriculation varchar(20),
    image varchar(50),
    name varchar(50),
    description varchar(500)
);


CREATE TABLE instructeurs (
    numInstructeur integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nom varchar(20), 
    prenom varchar(20), 
    numCivil varchar(15), 
    tauxInstructeur real, 
    adresse varchar(200), 
    codePostal char(6), 
    ville varchar(30), 
    tel varchar(20), 
    fax varchar(20), 
    email varchar(20), 
    numBadge integer
);

CREATE TABLE membres (
    numMembres integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nom varchar(20), 
    prenom varchar(20), 
    adresse varchar(200), 
    codePostal char(6), 
    ville varchar(30), 
    tel varchar(20), 
    fax varchar(20), 
    email varchar(20) UNIQUE, 
    numBadge integer, 
    numQualif integer, 
    profession varchar(20), 
    lieuNaissance varchar(20), 
    carteFederal varchar(20), 
    dateNaissance DATE, 
    dateAttestation DATE, 
    dateTheoriqueBB DATE, 
    dateTheoriquePPLA DATE, 
    dateBB DATE, 
    datePPLA DATE, 
    numeroBB varchar(30), 
    numeroPPLA varchar(30), 
    dateInscription DATE,
    password varchar(200)
);


CREATE TABLE comptesAc (
    numCompte integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    numMembre integer,
    numSeq integer,
    description varchar(200),
    date DATE,
    debit real,
    credit real
);

CREATE TABLE sequence (
    numSequence integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    numMembres integer,
    numInstructeur integer,
    numAvions integer,
    date DATE,
    temps integer,
    prixSpecial real,
    taux real,
    reductionSemaine real,
    numMotif integer,
    tauxInstructeur real,
    forfaitInitiation smallint
);


CREATE TABLE motifs (
    numMotif integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    motif varchar(80)
);

CREATE TABLE qualif (
    numQualif integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    qualif char(5)
);

CREATE TABLE badge (
    numBadge integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    badge varchar(80)
);

ALTER TABLE sequence
ADD CONSTRAINT FK_sequence_membres
FOREIGN KEY (numMembres) REFERENCES membres(numMembres);

ALTER TABLE sequence
ADD CONSTRAINT FK_sequence_instructeurs
FOREIGN KEY (numInstructeur) REFERENCES instructeurs(numInstructeur);

ALTER TABLE sequence
ADD CONSTRAINT FK_sequence_avions
FOREIGN KEY (numAvions) REFERENCES avions(numAvions);

ALTER TABLE instructeurs
ADD CONSTRAINT FK_instructeurs_badge
FOREIGN KEY (numBadge) REFERENCES badge(numBadge); 

ALTER TABLE membres
ADD CONSTRAINT FK_membres_badge
FOREIGN KEY (numBadge) REFERENCES badge(numBadge); 

ALTER TABLE membres
ADD CONSTRAINT FK_membres_qualif
FOREIGN KEY (numQualif) REFERENCES qualif(numQualif); 
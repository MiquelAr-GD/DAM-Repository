DROP DATABASE IF EXISTS plantes;
CREATE DATABASE plantes;
USE plantes;

CREATE TABLE firma_comercial
	(nom_firma		VARCHAR(20)		PRIMARY KEY
	)ENGINE = InnoDB
	;
INSERT INTO firma_comercial VALUES ('CIRSADOB');
INSERT INTO firma_comercial VALUES ('PRISADOB');
INSERT INTO firma_comercial VALUES ('TIRSADOB');
INSERT INTO firma_comercial VALUES ('UOCADOB');

CREATE TABLE adob
	(nom_adob		VARCHAR(20)			PRIMARY KEY,
	nom_firma		VARCHAR(20)			NOT NULL,
	tipus_adob		ENUM('LLD','AI')    NOT NULL,
	FOREIGN KEY (nom_firma) REFERENCES firma_comercial(nom_firma)
	)ENGINE = InnoDB
	;
INSERT INTO adob VALUES ('Plantavit','UOCADOB','LLD');
INSERT INTO adob VALUES ('Vitaplant','TIRSADOB','AI');
INSERT INTO adob VALUES ('Nutreplant','CIRSADOB','LLD');
INSERT INTO adob VALUES ('Creixplant','PRISADOB','AI');
INSERT INTO adob VALUES ('Casadob','TIRSADOB','AI');
INSERT INTO adob VALUES ('Plantadob','PRISADOB','LLD');
INSERT INTO adob VALUES ('Superplant','CIRSADOB','AI');
INSERT INTO adob VALUES ('Sanexplant','UOCADOB','LLD');

CREATE TABLE estacio
	(nom_estacio     	VARCHAR(9) 	PRIMARY KEY       
	)ENGINE = InnoDB
	;
INSERT INTO estacio VALUES ('Estiu');
INSERT INTO estacio VALUES ('Hivern');
INSERT INTO estacio VALUES ('Primavera');
INSERT INTO estacio VALUES ('Tardor');

CREATE TABLE planta
	(nom_cientific		VARCHAR(20)		PRIMARY KEY,
	nom_popular			VARCHAR(20)		NOT NULL,
	floracio			VARCHAR(9)		NULL,
	FOREIGN KEY (floracio) REFERENCES estacio(nom_estacio)
	)ENGINE = InnoDB
	;
INSERT INTO planta VALUES ('Geranium','Gerani','Primavera');
INSERT INTO planta VALUES ('Begonia rex','Begònia','Estiu');
INSERT INTO planta VALUES ('Camellia','Camèlia','Primavera');
INSERT INTO planta VALUES ('Cyclamen','Ciclamen','Hivern');
INSERT INTO planta VALUES ('Rosa','Roser','Primavera');
INSERT INTO planta VALUES ('Polystichum','Falguera',null);
INSERT INTO planta VALUES ('Tulipa','Tulipa','Primavera');
INSERT INTO planta VALUES ('Chrysanthemum','Crisantem','Estiu');
INSERT INTO planta VALUES ('Philodendron','Potus',null);
INSERT INTO planta VALUES ('Chlorophytum','Cintes',null);
INSERT INTO planta VALUES ('Euphorbia','Poinsetia','Hivern');
INSERT INTO planta VALUES ('Hedera','Heura',null);
INSERT INTO planta VALUES ('Ficus','Ficus Benjamina',null);
INSERT INTO planta VALUES ('Codiaeum','Croton',null);


CREATE TABLE planta_interior
	(nom_planta		VARCHAR(20)	    PRIMARY KEY,
	ubicacio		VARCHAR(20)	    NOT NULL,
	temperatura		SMALLINT(2) 	NOT NULL,
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;
INSERT INTO planta_interior VALUES ('Philodendron','Llum directa',15);
INSERT INTO planta_interior VALUES ('Euphorbia','Llum indirecta',18);
INSERT INTO planta_interior VALUES ('Ficus','Llum indirecta',19);
INSERT INTO planta_interior VALUES ('Codiaeum','No corrents',17);

CREATE TABLE planta_exterior
	(nom_planta		VARCHAR(20)		PRIMARY KEY,
	tipus_planta	ENUM('T','P')	NOT NULL,
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;
INSERT INTO planta_exterior VALUES ('Geranium','P');
INSERT INTO planta_exterior VALUES ('Begonia rex','P');
INSERT INTO planta_exterior VALUES ('Camellia','P');
INSERT INTO planta_exterior VALUES ('Cyclamen','P');
INSERT INTO planta_exterior VALUES ('Rosa','P');
INSERT INTO planta_exterior VALUES ('Polystichum','P');
INSERT INTO planta_exterior VALUES ('Tulipa','T');
INSERT INTO planta_exterior VALUES ('Chrysanthemum','T');
INSERT INTO planta_exterior VALUES ('Chlorophytum','P');
INSERT INTO planta_exterior VALUES ('Hedera','P');

CREATE TABLE dosi_adob
	(nom_planta		VARCHAR(20),
	nom_estacio		VARCHAR(9),
	nom_adob		VARCHAR(20),
	quantitat_adob	SMALLINT		
		NOT NULL CHECK (quantitat_adob>=20 AND quantitat_adob<=100),
	PRIMARY KEY(nom_planta,nom_estacio,nom_adob),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific),
	FOREIGN KEY (nom_estacio) REFERENCES estacio(nom_estacio),
	FOREIGN KEY (nom_adob) REFERENCES adob(nom_adob)
	)ENGINE = InnoDB
	;	
INSERT INTO dosi_adob VALUES ('Geranium','Primavera','Casadob',30);
INSERT INTO dosi_adob VALUES ('Geranium','Hivern','Vitaplant',20);
INSERT INTO dosi_adob VALUES ('Begonia rex','Estiu','Casadob',25);
INSERT INTO dosi_adob VALUES ('Camellia','Hivern','Plantavit',50);
INSERT INTO dosi_adob VALUES ('Camellia','Primavera','Casadob',75);
INSERT INTO dosi_adob VALUES ('Cyclamen','Tardor','Casadob',30);
INSERT INTO dosi_adob VALUES ('Chrysanthemum','Primavera','Casadob',45);
INSERT INTO dosi_adob VALUES ('Begonia rex','Primavera','Nutreplant',50);
INSERT INTO dosi_adob VALUES ('Rosa','Primavera','Casadob',30);
INSERT INTO dosi_adob VALUES ('Rosa','Primavera','Creixplant',50);
INSERT INTO dosi_adob VALUES ('Polystichum','Primavera','Casadob',40);
INSERT INTO dosi_adob VALUES ('Polystichum','Tardor','Plantadob',20);
INSERT INTO dosi_adob VALUES ('Tulipa','Hivern','Casadob',40);
INSERT INTO dosi_adob VALUES ('Philodendron','Primavera','Casadob',40);
INSERT INTO dosi_adob VALUES ('Chlorophytum','Tardor','Casadob',30);
INSERT INTO dosi_adob VALUES ('Chlorophytum','Hivern','Superplant',40);
INSERT INTO dosi_adob VALUES ('Euphorbia','Hivern','Casadob',50);
INSERT INTO dosi_adob VALUES ('Euphorbia','Hivern','Sanexplant',40);
INSERT INTO dosi_adob VALUES ('Hedera','Primavera','Casadob',45);
INSERT INTO dosi_adob VALUES ('Codiaeum','Primavera','Casadob',50);
INSERT INTO dosi_adob VALUES ('Codiaeum','Estiu','Casadob',60);
INSERT INTO dosi_adob VALUES ('Geranium','Estiu','Sanexplant',40);
INSERT INTO dosi_adob VALUES ('Ficus','Primavera','Casadob',50);




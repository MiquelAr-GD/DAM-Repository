CREATE USER Miquel@localhost;
CREATE USER Miquel@'%';
CREATE USER 'Miquel'@'192.168.1.19';
/*Se entiende Miquel, como Miquel a secas, no es lo mismo que Miquel@localhost*/
CREATE USER Miquel IDENTIFIED BY 'contrasenya de ejemplo';

SELECT PASSWORD('contrasenya');

CREATE USER Miquel IDENTIFIED BY PASSWORD '*2A2SASDF3AFAWF2FZD'; /*CONTRASENYA YA ENCRIPTADA*/

GRANT USAGE ON *.* TO Miquel IDENTIFIED BY 'contrasenya';

DROP USER Miquel;

RENAME USER Miquel TO Miguel;

/*Como usuari, cambiar la propia*/
SET PASSWORD = password('');
/*Como Root o usuario con permisos, a otro usuario*/
SET PASSWORD FOR Miquel = password('1234');

/*---------------------PERMISOS----------------------*/
GRANT SELECT ON *.* TO Miquel; -- Global
GRANT SELECT ON pizzeria.* TO Miquel; -- BBDD
GRANT SELECT ON pizzeria.conte TO Miquel; -- Taula
GRANT SELECT(numero, data_hora, domicili_local) ON pizzeria.comanda TO Miquel;  -- Columna
SHOW GRANTS;
GRANT SELECT, INSERT, DELETE, UPDATE ON pizzeria.producte TO Miquel;

GRANT ALL PRIVILEGES ON pizzeria.producte TO Miquel;

GRANT ALL PRIVILEGES ON pizzeria.producte TO Miquel WITH GRANT OPTION;

REVOKE ALL PRIVILEGES ON pizzeria.producte FROM Miquel;

/*--------------------------ROLES-----------------------*/
CREATE ROLE pizzero;
GRANT SELECT, INSERT ON pizzeria.* TO pizzero;
GRANT pizzero TO Miquel;
SET DEFAULT ROLE pizzero FOR Miquel; -- Como root a un usuario
SET ROLE pizzero; -- Adquirir rol como usuario
SET DEFAULT ROLE pizzero; -- Adquirir rol por defecto como usuario
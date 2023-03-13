CREATE DATABASE permis;
USE permis;
CREATE TABLE usuari 
    (codi INT PRIMARY KEY,
    nom VARCHAR(25) NOT NULL
    ) ENGINE=InnoDB;
CREATE TABLE contrasenya
    (codi INT PRIMARY KEY,
    contrasenya VARCHAR(15),
    FOREIGN KEY (codi) REFERENCES usuari(codi)
    ) ENGINE = InnoDB;

/*Exercici DCL_1:
Crea un usuari anomenat anna.abad amb contrasenya anna.*/
CREATE USER 'anna.abad' IDENTIFIED BY 'anna';

/*Exercici DCL_2:
Crea un usuari anomenat bernat.bonet que es podrà connectar
des de l'ordinador localhost, amb contrasenya bernat, 
però envia la seva contrasenya codificada en codi hash.*/
CREATE USER 'bernat.bonet'@localhost 
IDENTIFIED BY PASSWORD '*AE66A16DB72C9E4EF1A742C4FC651C0FE70B88FF';

/*Exercici DCL_3:
Crea tres usuaris (carla.cruz, david.dosta, eric.esteve) 
amb les seves contrasenyes (carla, david i eric, respectivament) 
de dues maneres diferents:
    Amb l'ordre CREATE USER ...
    Amb l'ordre GRANT ... */

CREATE USER 'carla.cruz' IDENTIFIED BY 'carla',
    'david.dosta' IDENTIFIED BY 'david',
    'eric.esteve' IDENTIFIED BY 'eric';

GRANT USAGE ON *.* TO 'carla.cruz' IDENTIFIED BY 'carla', 
    'david.dosta' IDENTIFIED BY 'david',
    'eric.esteve' IDENTIFIED BY 'eric';

/*Exercici DCL_4:
L'usuari anna.abad és l'administrador, per tant que tingui 
permís per a fer tot.*/
GRANT ALL PRIVILEGES ON *.* TO 'anna.abad' WITH GRANT OPTION;

/*Exercici DCL_5:
a) Fes que l'usuari anna.abad doni permís a bernat.bonet els 
privilegis de seleccionar i inserir registres sobre la taula usuari.*/
GRANT SELECT,INSERT ON permis.usuari TO 'bernat.bonet'@localhost;

/*Exercici DCL_6:
a) Fes que l'usuari anna.abad doni permís a carla.cruz els privilegis 
d'inserir registres sobre la taula usuari.*/
GRANT INSERT ON permis.usuari TO 'carla.cruz';

/*Exercici DCL_7:
Fes que l'usuari anna.abad assigni tots els permisos a carla.cruz.*/
GRANT ALL PRIVILEGES ON permis.* TO 'carla.cruz';

/*Exercici DCL_8:
a) Fes que l'usuari anna.abad assigni permisos a bernat.bonet 
per modificar la contrasenya de la taula contrasenya.*/
GRANT UPDATE (contrasenya) ON permis.contrasenya TO 'bernat.bonet'@localhost;
/* Observació: Tingueu en compte que aquest permís donar permís només 
per actualitzar tots els registres, si volem que es pugui actualitzar 
una contrasenya en concret faríem:*/
GRANT UPDATE (contrasenya), SELECT (codi) ON permis.contrasenya TO 'bernat.bonet'@localhost;

/*Exercici DCL_9:
Amb l'opció WITH GRANT OPTION se li pot donar a l'usuari que rep 
permisos el privilegi per que pugui donar-los a altres usuaris.
Fes que l'usuari anna.abad assigni tots els permisos a carla.cruz 
per la taula usuari, donant-li permisos per assignar permisos a altres.*/
GRANT ALL PRIVILEGES ON permis.usuari TO 'carla.cruz' WITH GRANT OPTION;

/*Exercici DCL_10:
a) Fes que l'usuari carla.cruz assigni a david.dosta permís 
per mostrar els registres de la taula usuari.*/
GRANT SELECT ON permis.usuari TO 'david.dosta';

/*b) Comprova que no li pot assignar el mateix permís per la taula 
contrasenya.*/
GRANT SELECT ON permis.contrasenya TO 'david.dosta'; #NO FUNCIONA

/*Exercici DCL_11:
a) Fes que l'usuari anna.abad retiri els permisos de seleccionar 
registres i actualitzar sobre la taula usuari a l'usuari bernat.bonet.*/
REVOKE SELECT,UPDATE ON permis.usuari FROM 'bernat.bonet'@localhost;

/*Exercici DCL_12:
a) Treu tots els permisos a l'usuari a bernat.bonet, carla.cruz i david.dosta.*/
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'bernat.bonet'@localhost,
    'carla.cruz','david.dosta';

/*Exercici DCL_13:
a) Treu el permís d'esborrar usuaris anna.abad.*/
REVOKE DELETE ON permis.usuari FROM 'anna.abad';
/* Observació: Aquest permís no funcionaria perquè hem donat un permís més 
general. Si volem treure un permís sobre un objecte l'ha de tenir, si no 
hem de treure tots els permisos i donar-li més restrictius.

/*Exercici DCL_14:
Accedeix amb l'usuari root i treu tots els permisos a anna.abad.*/
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'anna.abad';

/*Exercici DCL_15:
Quines instruccions (cada apartat s'ha de fer amb una única instrucció) 
haurem d'utilitzar per crear els següents usuaris:
a) frederic.fabra (amb contrasenya frederic): té permisos per 
donar permisos i fer accions sobre les taules, però no sobre les dades.*/
GRANT CREATE,DROP,ALTER 
    ON permis.* 
    TO 'frederic.fabra' IDENTIFIED BY 'frederic' WITH GRANT OPTION;

/*b) gemma.gomez (amb contrasenya gemma): té permisos per fer consultar
i modificar les dades de la taula usuari.*/
GRANT SELECT,UPDATE 
    ON permis.usuari 
    TO 'gemma.gomez' IDENTIFIED BY 'gemma';

/*c) hugo.hernandez (amb contrasenya hugo): té permisos només per 
inserir registres a la taula usuari.*/
GRANT INSERT 
    ON permis.usuari 
    TO 'hugo.hernandez' IDENTIFIED BY 'hugo';

/*d) ivet.izquierdo (amb contrasenya ivet): inicialment no té cap permís.*/
GRANT USAGE ON *.* TO 'ivet.izquierdo' IDENTIFIED BY 'ivet';


--------------------------------------------------------------------------------------
/*Exercici DCL_16:
Utilitza la base de dades PIZZERIA de la Unitat Formativa 2.
Crea usuaris i permisos per la base de dades considerant les 
restriccions de seguretat seguents:*/

/* Administrador (amb nom adm_total): Té tots els permisos 
sobre la base de dades i els pot donar.*/
GRANT ALL PRIVILEGES ON pizzeria.* 
    TO adm_total IDENTIFIED BY 'adm_total' WITH GRANT OPTION;

/* Usuari per crear usuaris (amb nom adm_usuaris): 
És un usuari que té permís per crear usuaris però no pot 
assignar cap permís.*/
GRANT CREATE USER ON *.* 
    TO adm_usuaris  IDENTIFIED BY 'adm_usuaris';

/*Dissenyador de nivell 0 (amb nom disseny_0): És un usuari 
que té permís per modificar l'estructura de la base de dades.
Pot crear, modificar i eliminar part de l'estructura de la 
base de dades, però no les dades.*/
GRANT CREATE, ALTER, DROP ON pizzeria.* 
    TO disseny_0 IDENTIFIED BY 'disseny_0';

/* Dissenyador de nivell 1 (amb nom disseny_1): 
És un usuari que té permís per modificar l'estructura de 
les taules que tenen dades dels productes. Tingues en compte 
que no pot crear ni esborrar taules.*/
GRANT ALTER ON pizzeria.producte 
    TO disseny_1 IDENTIFIED BY 'disseny_1';
GRANT ALTER ON pizzeria.pizza TO disseny_1;
GRANT ALTER ON pizzeria.postre TO disseny_1;
GRANT ALTER ON pizzeria.beguda TO disseny_1;
GRANT ALTER ON pizzeria.forma TO disseny_1;
GRANT ALTER ON pizzeria.ingredient TO disseny_1;

/* Dissenyador de nivell 2 (amb nom disseny_2): És un usuari 
que té permís per modificar l'estructura de les taules que 
tenen dades de les persones. Tingues en compte que no pot crear 
ni esborrar taules.*/
GRANT ALTER ON pizzeria.client 
    TO disseny_2 IDENTIFIED BY 'disseny_2';;
GRANT ALTER ON pizzeria.empleat TO disseny_2;

/* Operador de nivell 1 (amb nom opera_1): És un usuari que pot 
treballar sobre les dades dels productes, però no sobre les 
dades de les persones.*/
CREATE ROLE opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.producte TO opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.beguda TO opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.pizza TO opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.postre TO opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.conte TO opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.forma TO opera_1;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.ingredient TO opera_1;

/* Operador de nivell 2 (amb nom opera_2): És un usuari que pot 
treballar sobre les dades de les persones, però no sobre les 
dades dels productes.*/
CREATE ROLE opera_2;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.client TO opera_2;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.empleat TO opera_2;
GRANT INSERT,DELETE,UPDATE,SELECT ON pizzeria.comanda TO opera_2;
 
/*Per facilitar-ho utilitza com a contrasenya el nom d'usuari.*/


Exercici DCL_17:

1r) Parem el servidor:

#> service mysql stop


2n) Iniciem en mode obert el servei:

#> mysqld_safe --skip-grant-tables --skip-networking

Això fa que el servidor no utilitzi els privilegis, per tant tots els usuaris poden accedir a qualsevol base de dades. A més fa que no es pugui accedir des de connexions TCP/IP de la xarxa, treballaria només en local.


3r) Iniciem el mysql amb un usuari qualsevol, no caldrà posar contrasenya;

#> mysql -u root


4t) Utilitzem la bse de dades mysql:

mysql> USE mysql


5è) Actualitzem el camp de la contrasenya de la taula user, i sortim:

mysql> UPDATE user SET Password=PASSWORD('nova_contrasenya') WHERE User='root';

Query
OK, 1 rows affected (0.07 sec)

Rows matched: 1  Changed: 1  Warnings: 0

mysql> exit


6è) Parem el servidor:

#> service mysql restart


Per Windows: http://dev.mysql.com/doc/mysql-windows-excerpt/5.0/en/resetting-permissions-windows.html
/**----------------------------------------------------------------------------/
*/
DECLARE E INT DEFAULT 0;
DECLARE M TEXT DEFAULT NULL;
	
DECLARE CONTINUE HANDLER FOR 1000 SET E='1000', M="hashchk";
DECLARE CONTINUE HANDLER FOR 1001 SET E='1001', M="isamchk";
DECLARE CONTINUE HANDLER FOR 1002 SET E='1002', M="NO";
DECLARE CONTINUE HANDLER FOR 1003 SET E='1003', M="YES";
DECLARE CONTINUE HANDLER FOR 1004 SET E='1004', M="Can't create file '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1005 SET E='1005', M="Can't create table '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1006 SET E='1006', M="Can't create database '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1007 SET E='1007', M="Can't create database '%s'; database exists";
DECLARE CONTINUE HANDLER FOR 1008 SET E='1008', M="Can't drop database '%s'; database doesn't exist";
DECLARE CONTINUE HANDLER FOR 1009 SET E='1009', M="Error dropping database (can't delete '%s', errno: %d)";
DECLARE CONTINUE HANDLER FOR 1010 SET E='1010', M="Error dropping database (can't rmdir '%s', errno: %d)";
DECLARE CONTINUE HANDLER FOR 1011 SET E='1011', M="Error on delete of '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1012 SET E='1012', M="Can't read record in system table";
DECLARE CONTINUE HANDLER FOR 1013 SET E='1013', M="Can't get status of '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1014 SET E='1014', M="Can't get working directory (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1015 SET E='1015', M="Can't lock file (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1016 SET E='1016', M="Can't open file: '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1017 SET E='1017', M="Can't find file: '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1018 SET E='1018', M="Can't read dir of '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1019 SET E='1019', M="Can't change dir to '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1020 SET E='1020', M="Record has changed since last read in table '%s'";
DECLARE CONTINUE HANDLER FOR 1021 SET E='1021', M="Disk full (%s); waiting for someone to free some space...";
DECLARE CONTINUE HANDLER FOR 1022 SET E='1022', M="Can't write; duplicate key in table '%s'";
DECLARE CONTINUE HANDLER FOR 1023 SET E='1023', M="Error on close of '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1024 SET E='1024', M="Error reading file '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1025 SET E='1025', M="Error on rename of '%s' to '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1026 SET E='1026', M="Error writing file '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1027 SET E='1027', M="'%s' is locked against change";
DECLARE CONTINUE HANDLER FOR 1028 SET E='1028', M="Sort aborted";
DECLARE CONTINUE HANDLER FOR 1029 SET E='1029', M="View '%s' doesn't exist for '%s'";
DECLARE CONTINUE HANDLER FOR 1030 SET E='1030', M="Got error %d from storage engine";
DECLARE CONTINUE HANDLER FOR 1031 SET E='1031', M="Table storage engine for '%s' doesn't have this option";
DECLARE CONTINUE HANDLER FOR 1032 SET E='1032', M="Can't find record in '%s'";
DECLARE CONTINUE HANDLER FOR 1033 SET E='1033', M="Incorrect information in file: '%s'";
DECLARE CONTINUE HANDLER FOR 1034 SET E='1034', M="Incorrect key file for table '%s'; try to repair it";
DECLARE CONTINUE HANDLER FOR 1035 SET E='1035', M="Old key file for table '%s'; repair it!";
DECLARE CONTINUE HANDLER FOR 1036 SET E='1036', M="Table '%s' is read only";
DECLARE CONTINUE HANDLER FOR 1037 SET E='1037', M="Out of memory; restart server and try again (needed %d bytes)";
DECLARE CONTINUE HANDLER FOR 1038 SET E='1038', M="Out of sort memory; increase server sort buffer size";
DECLARE CONTINUE HANDLER FOR 1039 SET E='1039', M="Unexpected EOF found when reading file '%s' (errno: %d)";
DECLARE CONTINUE HANDLER FOR 1040 SET E='1040', M="Too many connections";
DECLARE CONTINUE HANDLER FOR 1041 SET E='1041', M="Out of memory; check if mysqld or some other process uses all available memory; if not, you may have to use 'ulimit' to allow mysqld to use more memory or you can add more swap space";
DECLARE CONTINUE HANDLER FOR 1042 SET E='1042', M="Can't get hostname for your address";
DECLARE CONTINUE HANDLER FOR 1043 SET E='1043', M="Bad handshake";
DECLARE CONTINUE HANDLER FOR 1044 SET E='1044', M="Access denied for user '%s'@'%s' to database '%s'";
DECLARE CONTINUE HANDLER FOR 1045 SET E='1045', M="Access denied for user '%s'@'%s' (using password: %s)";
DECLARE CONTINUE HANDLER FOR 1046 SET E='1046', M="No database selected";
DECLARE CONTINUE HANDLER FOR 1047 SET E='1047', M="Unknown command";
DECLARE CONTINUE HANDLER FOR 1048 SET E='1048', M="Column '%s' cannot be null";
DECLARE CONTINUE HANDLER FOR 1049 SET E='1049', M="Unknown database '%s'";
DECLARE CONTINUE HANDLER FOR 1050 SET E='1050', M="Table '%s' already exists";
DECLARE CONTINUE HANDLER FOR 1051 SET E='1051', M="Unknown table '%s'";
DECLARE CONTINUE HANDLER FOR 1052 SET E='1052', M="Column '%s' in %s is ambiguous";
DECLARE CONTINUE HANDLER FOR 1053 SET E='1053', M="Server shutdown in progress";
DECLARE CONTINUE HANDLER FOR 1054 SET E='1054', M="Unknown column '%s' in '%s'";
DECLARE CONTINUE HANDLER FOR 1055 SET E='1055', M="'%s' isn't in GROUP BY";
DECLARE CONTINUE HANDLER FOR 1056 SET E='1056', M="Can't group on '%s'";
DECLARE CONTINUE HANDLER FOR 1057 SET E='1057', M="Statement has sum functions and columns in same statement";
DECLARE CONTINUE HANDLER FOR 1058 SET E='1058', M="Column count doesn't match value count";
DECLARE CONTINUE HANDLER FOR 1059 SET E='1059', M="Identifier name '%s' is too long";
DECLARE CONTINUE HANDLER FOR 1060 SET E='1060', M="Duplicate column name '%s'";
DECLARE CONTINUE HANDLER FOR 1061 SET E='1061', M="Duplicate key name '%s'";
DECLARE CONTINUE HANDLER FOR 1062 SET E='1062', M="Duplicate entry '%s' for key %d";
DECLARE CONTINUE HANDLER FOR 1063 SET E='1063', M="Incorrect column specifier for column '%s'";
DECLARE CONTINUE HANDLER FOR 1064 SET E='1064', M="%s near '%s' at line %d";
DECLARE CONTINUE HANDLER FOR 1065 SET E='1065', M="Query was empty";
DECLARE CONTINUE HANDLER FOR 1066 SET E='1066', M="Not unique table/alias: '%s'";
DECLARE CONTINUE HANDLER FOR 1067 SET E='1067', M="Invalid default value for '%s'";
DECLARE CONTINUE HANDLER FOR 1068 SET E='1068', M="Multiple primary key defined";
DECLARE CONTINUE HANDLER FOR 1069 SET E='1069', M="Too many keys specified; max %d keys allowed";
DECLARE CONTINUE HANDLER FOR 1070 SET E='1070', M="Too many key parts specified; max %d parts allowed";
DECLARE CONTINUE HANDLER FOR 1071 SET E='1071', M="Specified key was too long; max key length is %d bytes";
DECLARE CONTINUE HANDLER FOR 1072 SET E='1072', M="Key column '%s' doesn't exist in table";
DECLARE CONTINUE HANDLER FOR 1073 SET E='1073', M="BLOB column '%s' can't be used in key specification with the used table type";
DECLARE CONTINUE HANDLER FOR 1074 SET E='1074', M="Column length too big for column '%s' (max = %lu); use BLOB or TEXT instead";
DECLARE CONTINUE HANDLER FOR 1075 SET E='1075', M="Incorrect table definition; there can be only one auto column and it must be defined as a key";
DECLARE CONTINUE HANDLER FOR 1076 SET E='1076', M="%s: ready for connections. Version: '%s' socket: '%s' port: %d";
DECLARE CONTINUE HANDLER FOR 1077 SET E='1077', M="%s: Normal shutdown";
DECLARE CONTINUE HANDLER FOR 1078 SET E='1078', M="%s: Got signal %d. Aborting!";
DECLARE CONTINUE HANDLER FOR 1079 SET E='1079', M="%s: Shutdown complete";
DECLARE CONTINUE HANDLER FOR 1080 SET E='1080', M="%s: Forcing close of thread %ld user: '%s'";
DECLARE CONTINUE HANDLER FOR 1081 SET E='1081', M="Can't create IP socket";
DECLARE CONTINUE HANDLER FOR 1082 SET E='1082', M="Table '%s' has no index like the one used in CREATE INDEX; recreate the table";
DECLARE CONTINUE HANDLER FOR 1083 SET E='1083', M="Field separator argument is not what is expected; check the manual";
DECLARE CONTINUE HANDLER FOR 1084 SET E='1084', M="You can't use fixed rowlength with BLOBs; please use 'fields terminated by'";
DECLARE CONTINUE HANDLER FOR 1085 SET E='1085', M="The file '%s' must be in the database directory or be readable by all";
DECLARE CONTINUE HANDLER FOR 1086 SET E='1086', M="File '%s' already exists";
DECLARE CONTINUE HANDLER FOR 1087 SET E='1087', M="Records: %ld Deleted: %ld Skipped: %ld Warnings: %ld";
DECLARE CONTINUE HANDLER FOR 1088 SET E='1088', M="Records: %ld Duplicates: %ld";
DECLARE CONTINUE HANDLER FOR 1089 SET E='1089', M="Incorrect prefix key; the used key part isn't a string, the used length is longer than the key part, or the storage engine doesn't support unique prefix keys";
DECLARE CONTINUE HANDLER FOR 1090 SET E='1090', M="You can't delete all columns with ALTER TABLE; use DROP TABLE instead";
DECLARE CONTINUE HANDLER FOR 1091 SET E='1091', M="Can't DROP '%s'; check that column/key exists";
DECLARE CONTINUE HANDLER FOR 1092 SET E='1092', M="Records: %ld Duplicates: %ld Warnings: %ld";
DECLARE CONTINUE HANDLER FOR 1093 SET E='1093', M="You can't specify target table '%s' for update in FROM clause";
DECLARE CONTINUE HANDLER FOR 1094 SET E='1094', M="Unknown thread id: %lu";
DECLARE CONTINUE HANDLER FOR 1095 SET E='1095', M="You are not owner of thread %lu";
DECLARE CONTINUE HANDLER FOR 1096 SET E='1096', M="No tables used";
DECLARE CONTINUE HANDLER FOR 1097 SET E='1097', M="Too many strings for column %s and SET";
DECLARE CONTINUE HANDLER FOR 1098 SET E='1098', M="Can't generate a unique log-filename %s.(1-999)";
DECLARE CONTINUE HANDLER FOR 1099 SET E='1099', M="Table '%s' was locked with a READ lock and can't be updated";
DECLARE CONTINUE HANDLER FOR 1100 SET E='1100', M="Table '%s' was not locked with LOCK TABLES";
DECLARE CONTINUE HANDLER FOR 1101 SET E='1101', M="BLOB/TEXT column '%s' can't have a default value";
DECLARE CONTINUE HANDLER FOR 1102 SET E='1102', M="Incorrect database name '%s'";
DECLARE CONTINUE HANDLER FOR 1103 SET E='1103', M="Incorrect table name '%s'";
DECLARE CONTINUE HANDLER FOR 1104 SET E='1104', M="The SELECT would examine more than MAX_JOIN_SIZE rows; check your WHERE and use SET SQL_BIG_SELECTS=1 or SET MAX_JOIN_SIZE=# if the SELECT is okay";
DECLARE CONTINUE HANDLER FOR 1105 SET E='1105', M="Unknown error";
DECLARE CONTINUE HANDLER FOR 1106 SET E='1106', M="Unknown procedure '%s'";
DECLARE CONTINUE HANDLER FOR 1107 SET E='1107', M="Incorrect parameter count to procedure '%s'";
DECLARE CONTINUE HANDLER FOR 1108 SET E='1108', M="Incorrect parameters to procedure '%s'";
DECLARE CONTINUE HANDLER FOR 1109 SET E='1109', M="Unknown table '%s' in %s";
DECLARE CONTINUE HANDLER FOR 1110 SET E='1110', M="Column '%s' specified twice";
DECLARE CONTINUE HANDLER FOR 1111 SET E='1111', M="Invalid use of group function";
DECLARE CONTINUE HANDLER FOR 1112 SET E='1112', M="Table '%s' uses an extension that doesn't exist in this MySQL version";
DECLARE CONTINUE HANDLER FOR 1113 SET E='1113', M="A table must have at least 1 column";
DECLARE CONTINUE HANDLER FOR 1114 SET E='1114', M="The table '%s' is full";
DECLARE CONTINUE HANDLER FOR 1115 SET E='1115', M="Unknown character set: '%s'";
DECLARE CONTINUE HANDLER FOR 1116 SET E='1116', M="Too many tables; MySQL can only use %d tables in a join";
DECLARE CONTINUE HANDLER FOR 1117 SET E='1117', M="Too many columns";
DECLARE CONTINUE HANDLER FOR 1118 SET E='1118', M="Row size too large. The maximum row size for the used table type, not counting BLOBs, is %ld. You have to change some columns to TEXT or BLOBs";
DECLARE CONTINUE HANDLER FOR 1119 SET E='1119', M="Thread stack overrun: Used: %ld of a %ld stack. Use 'mysqld -O thread_stack=#' to specify a bigger stack if needed";
DECLARE CONTINUE HANDLER FOR 1120 SET E='1120', M="Cross dependency found in OUTER JOIN; examine your ON conditions";
DECLARE CONTINUE HANDLER FOR 1121 SET E='1121', M="Table handler doesn't support NULL in given index. Please change column '%s' to be NOT NULL or use another handler";
DECLARE CONTINUE HANDLER FOR 1122 SET E='1122', M="Can't load function '%s'";
DECLARE CONTINUE HANDLER FOR 1123 SET E='1123', M="Can't initialize function '%s'; %s";
DECLARE CONTINUE HANDLER FOR 1124 SET E='1124', M="No paths allowed for shared library";
DECLARE CONTINUE HANDLER FOR 1125 SET E='1125', M="Function '%s' already exists";
DECLARE CONTINUE HANDLER FOR 1126 SET E='1126', M="Can't open shared library '%s' (errno: %d %s)";
DECLARE CONTINUE HANDLER FOR 1127 SET E='1127', M="Can't find symbol '%s' in library";
DECLARE CONTINUE HANDLER FOR 1128 SET E='1128', M="Function '%s' is not defined";
DECLARE CONTINUE HANDLER FOR 1129 SET E='1129', M="Host '%s' is blocked because of many connection errors; unblock with 'mysqladmin flush-hosts'";
DECLARE CONTINUE HANDLER FOR 1130 SET E='1130', M="Host '%s' is not allowed to connect to this MySQL server";
DECLARE CONTINUE HANDLER FOR 1131 SET E='1131', M="You are using MySQL as an anonymous user and anonymous users are not allowed to change passwords";
DECLARE CONTINUE HANDLER FOR 1132 SET E='1132', M="You must have privileges to update tables in the mysql database to be able to change passwords for others";
DECLARE CONTINUE HANDLER FOR 1133 SET E='1133', M="Can't find any matching row in the user table";
DECLARE CONTINUE HANDLER FOR 1134 SET E='1134', M="Rows matched: %ld Changed: %ld Warnings: %ld";
DECLARE CONTINUE HANDLER FOR 1135 SET E='1135', M="Can't create a new thread (errno %d); if you are not out of available memory, you can consult the manual for a possible OS-dependent bug";
DECLARE CONTINUE HANDLER FOR 1136 SET E='1136', M="Column count doesn't match value count at row %ld";
DECLARE CONTINUE HANDLER FOR 1137 SET E='1137', M="Can't reopen table: '%s'";
DECLARE CONTINUE HANDLER FOR 1138 SET E='1138', M="Invalid use of NULL value";
DECLARE CONTINUE HANDLER FOR 1139 SET E='1139', M="Got error '%s' from regexp";
DECLARE CONTINUE HANDLER FOR 1140 SET E='1140', M="Mixing of GROUP columns (MIN(),MAX(),COUNT(),...) with no GROUP columns is illegal if there is no GROUP BY clause";
DECLARE CONTINUE HANDLER FOR 1141 SET E='1141', M="There is no such grant defined for user '%s' on host '%s'";
DECLARE CONTINUE HANDLER FOR 1142 SET E='1142', M="%s command denied to user '%s'@'%s' for table '%s'";
DECLARE CONTINUE HANDLER FOR 1143 SET E='1143', M="%s command denied to user '%s'@'%s' for column '%s' in table '%s'";
DECLARE CONTINUE HANDLER FOR 1144 SET E='1144', M="Illegal GRANT/REVOKE command; please consult the manual to see which privileges can be used";
DECLARE CONTINUE HANDLER FOR 1145 SET E='1145', M="The host or user argument to GRANT is too long";
DECLARE CONTINUE HANDLER FOR 1146 SET E='1146', M="Table '%s.%s' doesn't exist";
DECLARE CONTINUE HANDLER FOR 1147 SET E='1147', M="There is no such grant defined for user '%s' on host '%s' on table '%s'";
DECLARE CONTINUE HANDLER FOR 1148 SET E='1148', M="The used command is not allowed with this MySQL version";
DECLARE CONTINUE HANDLER FOR 1149 SET E='1149', M="You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use";
DECLARE CONTINUE HANDLER FOR 1150 SET E='1150', M="Delayed insert thread couldn't get requested lock for table %s";
DECLARE CONTINUE HANDLER FOR 1151 SET E='1151', M="Too many delayed threads in use";
DECLARE CONTINUE HANDLER FOR 1152 SET E='1152', M="Aborted connection %ld to db: '%s' user: '%s' (%s)";
DECLARE CONTINUE HANDLER FOR 1153 SET E='1153', M="Got a packet bigger than 'max_allowed_packet' bytes";
DECLARE CONTINUE HANDLER FOR 1154 SET E='1154', M="Got a read error from the connection pipe";
DECLARE CONTINUE HANDLER FOR 1155 SET E='1155', M="Got an error from fcntl()";
DECLARE CONTINUE HANDLER FOR 1156 SET E='1156', M="Got packets out of order";
DECLARE CONTINUE HANDLER FOR 1157 SET E='1157', M="Couldn't uncompress communication packet";
DECLARE CONTINUE HANDLER FOR 1158 SET E='1158', M="Got an error reading communication packets";
DECLARE CONTINUE HANDLER FOR 1159 SET E='1159', M="Got timeout reading communication packets";
DECLARE CONTINUE HANDLER FOR 1160 SET E='1160', M="Got an error writing communication packets";
DECLARE CONTINUE HANDLER FOR 1161 SET E='1161', M="Got timeout writing communication packets";
DECLARE CONTINUE HANDLER FOR 1162 SET E='1162', M="Result string is longer than 'max_allowed_packet' bytes";
DECLARE CONTINUE HANDLER FOR 1163 SET E='1163', M="The used table type doesn't support BLOB/TEXT columns";
DECLARE CONTINUE HANDLER FOR 1164 SET E='1164', M="The used table type doesn't support AUTO_INCREMENT columns";
DECLARE CONTINUE HANDLER FOR 1165 SET E='1165', M="INSERT DELAYED can't be used with table '%s' because it is locked with LOCK TABLES";
DECLARE CONTINUE HANDLER FOR 1166 SET E='1166', M="Incorrect column name '%s'";
DECLARE CONTINUE HANDLER FOR 1167 SET E='1167', M="The used storage engine can't index column '%s'";
DECLARE CONTINUE HANDLER FOR 1168 SET E='1168', M="Unable to open underlying table which is differently defined or of non-MyISAM type or doesn't exist";
DECLARE CONTINUE HANDLER FOR 1169 SET E='1169', M="Can't write, because of unique constraint, to table '%s'";
DECLARE CONTINUE HANDLER FOR 1170 SET E='1170', M="BLOB/TEXT column '%s' used in key specification without a key length";
DECLARE CONTINUE HANDLER FOR 1171 SET E='1171', M="All parts of a PRIMARY KEY must be NOT NULL; if you need NULL in a key, use UNIQUE instead";
DECLARE CONTINUE HANDLER FOR 1172 SET E='1172', M="Result consisted of more than one row";
DECLARE CONTINUE HANDLER FOR 1173 SET E='1173', M="This table type requires a primary key";
DECLARE CONTINUE HANDLER FOR 1174 SET E='1174', M="This version of MySQL is not compiled with RAID support";
DECLARE CONTINUE HANDLER FOR 1175 SET E='1175', M="You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column";
DECLARE CONTINUE HANDLER FOR 1176 SET E='1176', M="Key '%s' doesn't exist in table '%s'";
DECLARE CONTINUE HANDLER FOR 1177 SET E='1177', M="Can't open table";
DECLARE CONTINUE HANDLER FOR 1178 SET E='1178', M="The storage engine for the table doesn't support %s";
DECLARE CONTINUE HANDLER FOR 1179 SET E='1179', M="You are not allowed to execute this command in a transaction";
DECLARE CONTINUE HANDLER FOR 1180 SET E='1180', M="Got error %d during COMMIT";
DECLARE CONTINUE HANDLER FOR 1181 SET E='1181', M="Got error %d during ROLLBACK";
DECLARE CONTINUE HANDLER FOR 1182 SET E='1182', M="Got error %d during FLUSH_LOGS";
DECLARE CONTINUE HANDLER FOR 1183 SET E='1183', M="Got error %d during CHECKPOINT";
DECLARE CONTINUE HANDLER FOR 1184 SET E='1184', M="Aborted connection %ld to db: '%s' user: '%s' host: '%s' (%s)";
DECLARE CONTINUE HANDLER FOR 1185 SET E='1185', M="The storage engine for the table does not support binary table dump";
DECLARE CONTINUE HANDLER FOR 1186 SET E='1186', M="Binlog closed, cannot RESET MASTER";
DECLARE CONTINUE HANDLER FOR 1187 SET E='1187', M="Failed rebuilding the index of dumped table '%s'";
DECLARE CONTINUE HANDLER FOR 1188 SET E='1188', M="Error from master: '%s'";
DECLARE CONTINUE HANDLER FOR 1189 SET E='1189', M="Net error reading from master";
DECLARE CONTINUE HANDLER FOR 1190 SET E='1190', M="Net error writing to master";
DECLARE CONTINUE HANDLER FOR 1191 SET E='1191', M="Can't find FULLTEXT index matching the column list";
DECLARE CONTINUE HANDLER FOR 1192 SET E='1192', M="Can't execute the given command because you have active locked tables or an active transaction";
DECLARE CONTINUE HANDLER FOR 1193 SET E='1193', M="Unknown system variable '%s'";
DECLARE CONTINUE HANDLER FOR 1194 SET E='1194', M="Table '%s' is marked as crashed and should be repaired";
DECLARE CONTINUE HANDLER FOR 1195 SET E='1195', M="Table '%s' is marked as crashed and last (automatic?) repair failed";
DECLARE CONTINUE HANDLER FOR 1196 SET E='1196', M="Some non-transactional changed tables couldn't be rolled back";
DECLARE CONTINUE HANDLER FOR 1197 SET E='1197', M="Multi-statement transaction required more than 'max_binlog_cache_size' bytes of storage; increase this mysqld variable and try again";
DECLARE CONTINUE HANDLER FOR 1198 SET E='1198', M="This operation cannot be performed with a running slave; run STOP SLAVE first";
DECLARE CONTINUE HANDLER FOR 1199 SET E='1199', M="This operation requires a running slave; configure slave and do START SLAVE";
DECLARE CONTINUE HANDLER FOR 1200 SET E='1200', M="The server is not configured as slave; fix in config file or with CHANGE MASTER TO";
DECLARE CONTINUE HANDLER FOR 1201 SET E='1201', M="Could not initialize master info structure; more error messages can be found in the MySQL error log";
DECLARE CONTINUE HANDLER FOR 1202 SET E='1202', M="Could not create slave thread; check system resources";
DECLARE CONTINUE HANDLER FOR 1203 SET E='1203', M="User %s already has more than 'max_user_connections' active connections";
DECLARE CONTINUE HANDLER FOR 1204 SET E='1204', M="You may only use constant expressions with SET";
DECLARE CONTINUE HANDLER FOR 1205 SET E='1205', M="Lock wait timeout exceeded; try restarting transaction";
DECLARE CONTINUE HANDLER FOR 1206 SET E='1206', M="The total number of locks exceeds the lock table size";
DECLARE CONTINUE HANDLER FOR 1207 SET E='1207', M="Update locks cannot be acquired during a READ UNCOMMITTED transaction";
DECLARE CONTINUE HANDLER FOR 1208 SET E='1208', M="DROP DATABASE not allowed while thread is holding global read lock";
DECLARE CONTINUE HANDLER FOR 1209 SET E='1209', M="CREATE DATABASE not allowed while thread is holding global read lock";
DECLARE CONTINUE HANDLER FOR 1210 SET E='1210', M="Incorrect arguments to %s";
DECLARE CONTINUE HANDLER FOR 1211 SET E='1211', M="'%s'@'%s' is not allowed to create new users";
DECLARE CONTINUE HANDLER FOR 1212 SET E='1212', M="Incorrect table definition; all MERGE tables must be in the same database";
DECLARE CONTINUE HANDLER FOR 1213 SET E='1213', M="Deadlock found when trying to get lock; try restarting transaction";
DECLARE CONTINUE HANDLER FOR 1214 SET E='1214', M="The used table type doesn't support FULLTEXT indexes";
DECLARE CONTINUE HANDLER FOR 1215 SET E='1215', M="Cannot add foreign key constraint";
DECLARE CONTINUE HANDLER FOR 1216 SET E='1216', M="Cannot add or update a child row: a foreign key constraint fails";
DECLARE CONTINUE HANDLER FOR 1217 SET E='1217', M="Cannot delete or update a parent row: a foreign key constraint fails";
DECLARE CONTINUE HANDLER FOR 1218 SET E='1218', M="Error connecting to master: %s";
DECLARE CONTINUE HANDLER FOR 1219 SET E='1219', M="Error running query on master: %s";
DECLARE CONTINUE HANDLER FOR 1220 SET E='1220', M="Error when executing command %s: %s";
DECLARE CONTINUE HANDLER FOR 1221 SET E='1221', M="Incorrect usage of %s and %s";
DECLARE CONTINUE HANDLER FOR 1222 SET E='1222', M="The used SELECT statements have a different number of columns";
DECLARE CONTINUE HANDLER FOR 1223 SET E='1223', M="Can't execute the query because you have a conflicting read lock";
DECLARE CONTINUE HANDLER FOR 1224 SET E='1224', M="Mixing of transactional and non-transactional tables is disabled";
DECLARE CONTINUE HANDLER FOR 1225 SET E='1225', M="Option '%s' used twice in statement";
DECLARE CONTINUE HANDLER FOR 1226 SET E='1226', M="User '%s' has exceeded the '%s' resource (current value: %ld)";
DECLARE CONTINUE HANDLER FOR 1227 SET E='1227', M="Access denied; you need the %s privilege for this operation";
DECLARE CONTINUE HANDLER FOR 1228 SET E='1228', M="Variable '%s' is a SESSION variable and can't be used with SET GLOBAL";
DECLARE CONTINUE HANDLER FOR 1229 SET E='1229', M="Variable '%s' is a GLOBAL variable and should be set with SET GLOBAL";
DECLARE CONTINUE HANDLER FOR 1230 SET E='1230', M="Variable '%s' doesn't have a default value";
DECLARE CONTINUE HANDLER FOR 1231 SET E='1231', M="Variable '%s' can't be set to the value of '%s'";
DECLARE CONTINUE HANDLER FOR 1232 SET E='1232', M="Incorrect argument type to variable '%s'";
DECLARE CONTINUE HANDLER FOR 1233 SET E='1233', M="Variable '%s' can only be set, not read";
DECLARE CONTINUE HANDLER FOR 1234 SET E='1234', M="Incorrect usage/placement of '%s'";
DECLARE CONTINUE HANDLER FOR 1235 SET E='1235', M="This version of MySQL doesn't yet support '%s'";
DECLARE CONTINUE HANDLER FOR 1236 SET E='1236', M="Got fatal error %d from master when reading data from binary log: '%s'";
DECLARE CONTINUE HANDLER FOR 1237 SET E='1237', M="Slave SQL thread ignored the query because of replicate-*-table rules";
DECLARE CONTINUE HANDLER FOR 1238 SET E='1238', M="Variable '%s' is a %s variable";
DECLARE CONTINUE HANDLER FOR 1239 SET E='1239', M="Incorrect foreign key definition for '%s': %s";
DECLARE CONTINUE HANDLER FOR 1240 SET E='1240', M="Key reference and table reference don't match";
DECLARE CONTINUE HANDLER FOR 1241 SET E='1241', M="Operand should contain %d column(s)";
DECLARE CONTINUE HANDLER FOR 1242 SET E='1242', M="Subquery returns more than 1 row";
DECLARE CONTINUE HANDLER FOR 1243 SET E='1243', M="Unknown prepared statement handler (%.*s) given to %s";
DECLARE CONTINUE HANDLER FOR 1244 SET E='1244', M="Help database is corrupt or does not exist";
DECLARE CONTINUE HANDLER FOR 1245 SET E='1245', M="Cyclic reference on subqueries";
DECLARE CONTINUE HANDLER FOR 1246 SET E='1246', M="Converting column '%s' from %s to %s";
DECLARE CONTINUE HANDLER FOR 1247 SET E='1247', M="Reference '%s' not supported (%s)";
DECLARE CONTINUE HANDLER FOR 1248 SET E='1248', M="Every derived table must have its own alias";
DECLARE CONTINUE HANDLER FOR 1249 SET E='1249', M="Select %u was reduced during optimization";
DECLARE CONTINUE HANDLER FOR 1250 SET E='1250', M="Table '%s' from one of the SELECTs cannot be used in %s";
DECLARE CONTINUE HANDLER FOR 1251 SET E='1251', M="Client does not support authentication protocol requested by server; consider upgrading MySQL client";
DECLARE CONTINUE HANDLER FOR 1252 SET E='1252', M="All parts of a SPATIAL index must be NOT NULL";
DECLARE CONTINUE HANDLER FOR 1253 SET E='1253', M="COLLATION '%s' is not valid for CHARACTER SET '%s'";
DECLARE CONTINUE HANDLER FOR 1254 SET E='1254', M="Slave is already running";
DECLARE CONTINUE HANDLER FOR 1255 SET E='1255', M="Slave already has been stopped";
DECLARE CONTINUE HANDLER FOR 1256 SET E='1256', M="Uncompressed data size too large; the maximum size is %d (probably, length of uncompressed data was corrupted)";
DECLARE CONTINUE HANDLER FOR 1257 SET E='1257', M="ZLIB: Not enough memory";
DECLARE CONTINUE HANDLER FOR 1258 SET E='1258', M="ZLIB: Not enough room in the output buffer (probably, length of uncompressed data was corrupted)";
DECLARE CONTINUE HANDLER FOR 1259 SET E='1259', M="ZLIB: Input data corrupted";
DECLARE CONTINUE HANDLER FOR 1260 SET E='1260', M="%d line(s) were cut by GROUP_CONCAT()";
DECLARE CONTINUE HANDLER FOR 1261 SET E='1261', M="Row %ld doesn't contain data for all columns";
DECLARE CONTINUE HANDLER FOR 1262 SET E='1262', M="Row %ld was truncated; it contained more data than there were input columns";
DECLARE CONTINUE HANDLER FOR 1263 SET E='1263', M="Column set to default value; NULL supplied to NOT NULL column '%s' at row %ld";
DECLARE CONTINUE HANDLER FOR 1264 SET E='1264', M="Out of range value for column '%s' at row %ld";
DECLARE CONTINUE HANDLER FOR 1265 SET E='1265', M="Data truncated for column '%s' at row %ld";
DECLARE CONTINUE HANDLER FOR 1266 SET E='1266', M="Using storage engine %s for table '%s'";
DECLARE CONTINUE HANDLER FOR 1267 SET E='1267', M="Illegal mix of collations (%s,%s) and (%s,%s) for operation '%s'";
DECLARE CONTINUE HANDLER FOR 1268 SET E='1268', M="Cannot drop one or more of the requested users";
DECLARE CONTINUE HANDLER FOR 1269 SET E='1269', M="Can't revoke all privileges for one or more of the requested users";
DECLARE CONTINUE HANDLER FOR 1270 SET E='1270', M="Illegal mix of collations (%s,%s), (%s,%s), (%s,%s) for operation '%s'";
DECLARE CONTINUE HANDLER FOR 1271 SET E='1271', M="Illegal mix of collations for operation '%s'";
DECLARE CONTINUE HANDLER FOR 1272 SET E='1272', M="Variable '%s' is not a variable component (can't be used as XXXX.variable_name)";
DECLARE CONTINUE HANDLER FOR 1273 SET E='1273', M="Unknown collation: '%s'";
DECLARE CONTINUE HANDLER FOR 1274 SET E='1274', M="SSL parameters in CHANGE MASTER are ignored because this MySQL slave was compiled without SSL support; they can be used later if MySQL slave with SSL is started";
DECLARE CONTINUE HANDLER FOR 1275 SET E='1275', M="Server is running in --secure-auth mode, but '%s'@'%s' has a password in the old format; please change the password to the new format";
DECLARE CONTINUE HANDLER FOR 1276 SET E='1276', M="Field or reference '%s%s%s%s%s' of SELECT #%d was resolved in SELECT #%d";
DECLARE CONTINUE HANDLER FOR 1277 SET E='1277', M="Incorrect parameter or combination of parameters for START SLAVE UNTIL";
DECLARE CONTINUE HANDLER FOR 1278 SET E='1278', M="It is recommended to use --skip-slave-start when doing step-by-step replication with START SLAVE UNTIL; otherwise, you will get problems if you get an unexpected slave's mysqld restart";
DECLARE CONTINUE HANDLER FOR 1279 SET E='1279', M="SQL thread is not to be started so UNTIL options are ignored";
DECLARE CONTINUE HANDLER FOR 1280 SET E='1280', M="Incorrect index name '%s'";
DECLARE CONTINUE HANDLER FOR 1281 SET E='1281', M="Incorrect catalog name '%s'";
DECLARE CONTINUE HANDLER FOR 1282 SET E='1282', M="Query cache failed to set size %lu; new query cache size is %lu";
DECLARE CONTINUE HANDLER FOR 1283 SET E='1283', M="Column '%s' cannot be part of FULLTEXT index";
DECLARE CONTINUE HANDLER FOR 1284 SET E='1284', M="Unknown key cache '%s'";
DECLARE CONTINUE HANDLER FOR 1285 SET E='1285', M="MySQL is started in --skip-name-resolve mode; you must restart it without this switch for this grant to work";
DECLARE CONTINUE HANDLER FOR 1286 SET E='1286', M="Unknown table engine '%s'";
DECLARE CONTINUE HANDLER FOR 1287 SET E='1287', M="'%s' is deprecated and will be removed in a future release. Please use %s instead";
DECLARE CONTINUE HANDLER FOR 1288 SET E='1288', M="The target table %s of the %s is not updatable";
DECLARE CONTINUE HANDLER FOR 1289 SET E='1289', M="The '%s' feature is disabled; you need MySQL built with '%s' to have it working";
DECLARE CONTINUE HANDLER FOR 1290 SET E='1290', M="The MySQL server is running with the %s option so it cannot execute this statement";
DECLARE CONTINUE HANDLER FOR 1291 SET E='1291', M="Column '%s' has duplicated value '%s' in %s";
DECLARE CONTINUE HANDLER FOR 1292 SET E='1292', M="Truncated incorrect %s value: '%s'";
DECLARE CONTINUE HANDLER FOR 1293 SET E='1293', M="Incorrect table definition; there can be only one TIMESTAMP column with CURRENT_TIMESTAMP in DEFAULT or ON UPDATE clause";
DECLARE CONTINUE HANDLER FOR 1294 SET E='1294', M="Invalid ON UPDATE clause for '%s' column";
DECLARE CONTINUE HANDLER FOR 1295 SET E='1295', M="This command is not supported in the prepared statement protocol yet";
DECLARE CONTINUE HANDLER FOR 1296 SET E='1296', M="Got error %d '%s' from %s";
DECLARE CONTINUE HANDLER FOR 1297 SET E='1297', M="Got temporary error %d '%s' from %s";
DECLARE CONTINUE HANDLER FOR 1298 SET E='1298', M="Unknown or incorrect time zone: '%s'";
DECLARE CONTINUE HANDLER FOR 1299 SET E='1299', M="Invalid TIMESTAMP value in column '%s' at row %ld";
DECLARE CONTINUE HANDLER FOR 1300 SET E='1300', M="Invalid %s character string: '%s'";
DECLARE CONTINUE HANDLER FOR 1301 SET E='1301', M="Result of %s() was larger than max_allowed_packet (%ld) - truncated";
DECLARE CONTINUE HANDLER FOR 1302 SET E='1302', M="Conflicting declarations: '%s%s' and '%s%s'";
DECLARE CONTINUE HANDLER FOR 1303 SET E='1303', M="Can't create a %s from within another stored routine";
DECLARE CONTINUE HANDLER FOR 1304 SET E='1304', M="%s %s already exists";
DECLARE CONTINUE HANDLER FOR 1305 SET E='1305', M="%s %s does not exist";
DECLARE CONTINUE HANDLER FOR 1306 SET E='1306', M="Failed to DROP %s %s";
DECLARE CONTINUE HANDLER FOR 1307 SET E='1307', M="Failed to CREATE %s %s";
DECLARE CONTINUE HANDLER FOR 1308 SET E='1308', M="%s with no matching label: %s";
DECLARE CONTINUE HANDLER FOR 1309 SET E='1309', M="Redefining label %s";
DECLARE CONTINUE HANDLER FOR 1310 SET E='1310', M="End-label %s without match";
DECLARE CONTINUE HANDLER FOR 1311 SET E='1311', M="Referring to uninitialized variable %s";
DECLARE CONTINUE HANDLER FOR 1312 SET E='1312', M="PROCEDURE %s can't return a result set in the given context";
DECLARE CONTINUE HANDLER FOR 1313 SET E='1313', M="RETURN is only allowed in a FUNCTION";
DECLARE CONTINUE HANDLER FOR 1314 SET E='1314', M="%s is not allowed in stored procedures";
DECLARE CONTINUE HANDLER FOR 1315 SET E='1315', M="The update log is deprecated and replaced by the binary log; SET SQL_LOG_UPDATE has been ignored. This option will be removed in MySQL 5.6.";
DECLARE CONTINUE HANDLER FOR 1316 SET E='1316', M="The update log is deprecated and replaced by the binary log; SET SQL_LOG_UPDATE has been translated to SET SQL_LOG_BIN. This option will be removed in MySQL 5.6.";
DECLARE CONTINUE HANDLER FOR 1317 SET E='1317', M="Query execution was interrupted";
DECLARE CONTINUE HANDLER FOR 1318 SET E='1318', M="Incorrect number of arguments for %s %s; expected %u, got %u";
DECLARE CONTINUE HANDLER FOR 1319 SET E='1319', M="Undefined CONDITION: %s";
DECLARE CONTINUE HANDLER FOR 1320 SET E='1320', M="No RETURN found in FUNCTION %s";
DECLARE CONTINUE HANDLER FOR 1321 SET E='1321', M="FUNCTION %s ended without RETURN";
DECLARE CONTINUE HANDLER FOR 1322 SET E='1322', M="Cursor statement must be a SELECT";
DECLARE CONTINUE HANDLER FOR 1323 SET E='1323', M="Cursor SELECT must not have INTO";
DECLARE CONTINUE HANDLER FOR 1324 SET E='1324', M="Undefined CURSOR: %s";
DECLARE CONTINUE HANDLER FOR 1325 SET E='1325', M="Cursor is already open";
DECLARE CONTINUE HANDLER FOR 1326 SET E='1326', M="Cursor is not open";
DECLARE CONTINUE HANDLER FOR 1327 SET E='1327', M="Undeclared variable: %s";
DECLARE CONTINUE HANDLER FOR 1328 SET E='1328', M="Incorrect number of FETCH variables";
DECLARE CONTINUE HANDLER FOR 1329 SET E='1329', M="No data - zero rows fetched, selected, or processed";
DECLARE CONTINUE HANDLER FOR 1330 SET E='1330', M="Duplicate parameter: %s";
DECLARE CONTINUE HANDLER FOR 1331 SET E='1331', M="Duplicate variable: %s";
DECLARE CONTINUE HANDLER FOR 1332 SET E='1332', M="Duplicate condition: %s";
DECLARE CONTINUE HANDLER FOR 1333 SET E='1333', M="Duplicate cursor: %s";
DECLARE CONTINUE HANDLER FOR 1334 SET E='1334', M="Failed to ALTER %s %s";
DECLARE CONTINUE HANDLER FOR 1335 SET E='1335', M="Subquery value not supported";
DECLARE CONTINUE HANDLER FOR 1336 SET E='1336', M="%s is not allowed in stored function or trigger";
DECLARE CONTINUE HANDLER FOR 1337 SET E='1337', M="Variable or condition declaration after cursor or handler declaration";
DECLARE CONTINUE HANDLER FOR 1338 SET E='1338', M="Cursor declaration after handler declaration";
DECLARE CONTINUE HANDLER FOR 1339 SET E='1339', M="Case not found for CASE statement";
DECLARE CONTINUE HANDLER FOR 1340 SET E='1340', M="Configuration file '%s' is too big";
DECLARE CONTINUE HANDLER FOR 1341 SET E='1341', M="Malformed file type header in file '%s'";
DECLARE CONTINUE HANDLER FOR 1342 SET E='1342', M="Unexpected end of file while parsing comment '%s'";
DECLARE CONTINUE HANDLER FOR 1343 SET E='1343', M="Error while parsing parameter '%s' (line: '%s')";
DECLARE CONTINUE HANDLER FOR 1344 SET E='1344', M="Unexpected end of file while skipping unknown parameter '%s'";
DECLARE CONTINUE HANDLER FOR 1345 SET E='1345', M="EXPLAIN/SHOW can not be issued; lacking privileges for underlying table";
DECLARE CONTINUE HANDLER FOR 1346 SET E='1346', M="File '%s' has unknown type '%s' in its header";
DECLARE CONTINUE HANDLER FOR 1347 SET E='1347', M="'%s.%s' is not %s";
DECLARE CONTINUE HANDLER FOR 1348 SET E='1348', M="Column '%s' is not updatable";
DECLARE CONTINUE HANDLER FOR 1349 SET E='1349', M="View's SELECT contains a subquery in the FROM clause";
DECLARE CONTINUE HANDLER FOR 1350 SET E='1350', M="View's SELECT contains a '%s' clause";
DECLARE CONTINUE HANDLER FOR 1351 SET E='1351', M="View's SELECT contains a variable or parameter";
DECLARE CONTINUE HANDLER FOR 1352 SET E='1352', M="View's SELECT refers to a temporary table '%s'";
DECLARE CONTINUE HANDLER FOR 1353 SET E='1353', M="View's SELECT and view's field list have different column counts";
DECLARE CONTINUE HANDLER FOR 1354 SET E='1354', M="View merge algorithm can't be used here for now (assumed undefined algorithm)";
DECLARE CONTINUE HANDLER FOR 1355 SET E='1355', M="View being updated does not have complete key of underlying table in it";
DECLARE CONTINUE HANDLER FOR 1356 SET E='1356', M="View '%s.%s' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them";
DECLARE CONTINUE HANDLER FOR 1357 SET E='1357', M="Can't drop or alter a %s from within another stored routine";
DECLARE CONTINUE HANDLER FOR 1358 SET E='1358', M="GOTO is not allowed in a stored procedure handler";
DECLARE CONTINUE HANDLER FOR 1359 SET E='1359', M="Trigger already exists";
DECLARE CONTINUE HANDLER FOR 1360 SET E='1360', M="Trigger does not exist";
DECLARE CONTINUE HANDLER FOR 1361 SET E='1361', M="Trigger's '%s' is view or temporary table";
DECLARE CONTINUE HANDLER FOR 1362 SET E='1362', M="Updating of %s row is not allowed in %strigger";
DECLARE CONTINUE HANDLER FOR 1363 SET E='1363', M="There is no %s row in %s trigger";
DECLARE CONTINUE HANDLER FOR 1364 SET E='1364', M="Field '%s' doesn't have a default value";
DECLARE CONTINUE HANDLER FOR 1365 SET E='1365', M="Division by 0";
DECLARE CONTINUE HANDLER FOR 1366 SET E='1366', M="Incorrect %s value: '%s' for column '%s' at row %ld";
DECLARE CONTINUE HANDLER FOR 1367 SET E='1367', M="Illegal %s '%s' value found during parsing";
DECLARE CONTINUE HANDLER FOR 1368 SET E='1368', M="CHECK OPTION on non-updatable view '%s.%s'";
DECLARE CONTINUE HANDLER FOR 1369 SET E='1369', M="CHECK OPTION failed '%s.%s'";
DECLARE CONTINUE HANDLER FOR 1370 SET E='1370', M="%s command denied to user '%s'@'%s' for routine '%s'";
DECLARE CONTINUE HANDLER FOR 1371 SET E='1371', M="Failed purging old relay logs: %s";
DECLARE CONTINUE HANDLER FOR 1372 SET E='1372', M="Password hash should be a %d-digit hexadecimal number";
DECLARE CONTINUE HANDLER FOR 1373 SET E='1373', M="Target log not found in binlog index";
DECLARE CONTINUE HANDLER FOR 1374 SET E='1374', M="I/O error reading log index file";
DECLARE CONTINUE HANDLER FOR 1375 SET E='1375', M="Server configuration does not permit binlog purge";
DECLARE CONTINUE HANDLER FOR 1376 SET E='1376', M="Failed on fseek()";
DECLARE CONTINUE HANDLER FOR 1377 SET E='1377', M="Fatal error during log purge";
DECLARE CONTINUE HANDLER FOR 1378 SET E='1378', M="A purgeable log is in use, will not purge";
DECLARE CONTINUE HANDLER FOR 1379 SET E='1379', M="Unknown error during log purge";
DECLARE CONTINUE HANDLER FOR 1380 SET E='1380', M="Failed initializing relay log position: %s";
DECLARE CONTINUE HANDLER FOR 1381 SET E='1381', M="You are not using binary logging";
DECLARE CONTINUE HANDLER FOR 1382 SET E='1382', M="The '%s' syntax is reserved for purposes internal to the MySQL server";
DECLARE CONTINUE HANDLER FOR 1383 SET E='1383', M="WSAStartup Failed";
DECLARE CONTINUE HANDLER FOR 1384 SET E='1384', M="Can't handle procedures with different groups yet";
DECLARE CONTINUE HANDLER FOR 1385 SET E='1385', M="Select must have a group with this procedure";
DECLARE CONTINUE HANDLER FOR 1386 SET E='1386', M="Can't use ORDER clause with this procedure";
DECLARE CONTINUE HANDLER FOR 1387 SET E='1387', M="Binary logging and replication forbid changing the global server %s";
DECLARE CONTINUE HANDLER FOR 1388 SET E='1388', M="Can't map file: %s, errno: %d";
DECLARE CONTINUE HANDLER FOR 1389 SET E='1389', M="Wrong magic in %s";
DECLARE CONTINUE HANDLER FOR 1390 SET E='1390', M="Prepared statement contains too many placeholders";
DECLARE CONTINUE HANDLER FOR 1391 SET E='1391', M="Key part '%s' length cannot be 0";
DECLARE CONTINUE HANDLER FOR 1392 SET E='1392', M="View text checksum failed";
DECLARE CONTINUE HANDLER FOR 1393 SET E='1393', M="Can not modify more than one base table through a join view '%s.%s'";
DECLARE CONTINUE HANDLER FOR 1394 SET E='1394', M="Can not insert into join view '%s.%s' without fields list";
DECLARE CONTINUE HANDLER FOR 1395 SET E='1395', M="Can not delete from join view '%s.%s'";
DECLARE CONTINUE HANDLER FOR 1396 SET E='1396', M="Operation %s failed for %s";
DECLARE CONTINUE HANDLER FOR 1397 SET E='1397', M="XAER_NOTA: Unknown XID";
DECLARE CONTINUE HANDLER FOR 1398 SET E='1398', M="XAER_INVAL: Invalid arguments (or unsupported command)";
DECLARE CONTINUE HANDLER FOR 1399 SET E='1399', M="XAER_RMFAIL: The command cannot be executed when global transaction is in the %s state";
DECLARE CONTINUE HANDLER FOR 1400 SET E='1400', M="XAER_OUTSIDE: Some work is done outside global transaction";
DECLARE CONTINUE HANDLER FOR 1401 SET E='1401', M="XAER_RMERR: Fatal error occurred in the transaction branch - check your data for consistency";
DECLARE CONTINUE HANDLER FOR 1402 SET E='1402', M="XA_RBROLLBACK: Transaction branch was rolled back";
DECLARE CONTINUE HANDLER FOR 1403 SET E='1403', M="There is no such grant defined for user '%s' on host '%s' on routine '%s'";
DECLARE CONTINUE HANDLER FOR 1404 SET E='1404', M="Failed to grant EXECUTE and ALTER ROUTINE privileges";
DECLARE CONTINUE HANDLER FOR 1405 SET E='1405', M="Failed to revoke all privileges to dropped routine";
DECLARE CONTINUE HANDLER FOR 1406 SET E='1406', M="Data too long for column '%s' at row %ld";
DECLARE CONTINUE HANDLER FOR 1407 SET E='1407', M="Bad SQLSTATE: '%s'";
DECLARE CONTINUE HANDLER FOR 1408 SET E='1408', M="%s: ready for connections. Version: '%s' socket: '%s' port: %d %s";
DECLARE CONTINUE HANDLER FOR 1409 SET E='1409', M="Can't load value from file with fixed size rows to variable";
DECLARE CONTINUE HANDLER FOR 1410 SET E='1410', M="You are not allowed to create a user with GRANT";
DECLARE CONTINUE HANDLER FOR 1411 SET E='1411', M="Incorrect %s value: '%s' for function %s";
DECLARE CONTINUE HANDLER FOR 1412 SET E='1412', M="Table definition has changed, please retry transaction";
DECLARE CONTINUE HANDLER FOR 1413 SET E='1413', M="Duplicate handler declared in the same block";
DECLARE CONTINUE HANDLER FOR 1414 SET E='1414', M="OUT or INOUT argument %d for routine %s is not a variable or NEW pseudo-variable in BEFORE trigger";
DECLARE CONTINUE HANDLER FOR 1415 SET E='1415', M="Not allowed to return a result set from a %s";
DECLARE CONTINUE HANDLER FOR 1416 SET E='1416', M="Cannot get geometry object from data you send to the GEOMETRY field";
DECLARE CONTINUE HANDLER FOR 1417 SET E='1417', M="A routine failed and has neither NO SQL nor READS SQL DATA in its declaration and binary logging is enabled; if non-transactional tables were updated, the binary log will miss their changes";
DECLARE CONTINUE HANDLER FOR 1418 SET E='1418', M="This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)";
DECLARE CONTINUE HANDLER FOR 1419 SET E='1419', M="You do not have the SUPER privilege and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)";
DECLARE CONTINUE HANDLER FOR 1420 SET E='1420', M="You can't execute a prepared statement which has an open cursor associated with it. Reset the statement to re-execute it.";
DECLARE CONTINUE HANDLER FOR 1421 SET E='1421', M="The statement (%lu) has no open cursor.";
DECLARE CONTINUE HANDLER FOR 1422 SET E='1422', M="Explicit or implicit commit is not allowed in stored function or trigger.";
DECLARE CONTINUE HANDLER FOR 1423 SET E='1423', M="Field of view '%s.%s' underlying table doesn't have a default value";
DECLARE CONTINUE HANDLER FOR 1424 SET E='1424', M="Recursive stored functions and triggers are not allowed.";
DECLARE CONTINUE HANDLER FOR 1425 SET E='1425', M="Too big scale %d specified for column '%s'. Maximum is %lu.";
DECLARE CONTINUE HANDLER FOR 1426 SET E='1426', M="Too big precision %d specified for column '%s'. Maximum is %lu.";
DECLARE CONTINUE HANDLER FOR 1427 SET E='1427', M="For float(M,D), double(M,D) or decimal(M,D), M must be >= D (column '%s').";
DECLARE CONTINUE HANDLER FOR 1428 SET E='1428', M="You can't combine write-locking of system tables with other tables or lock types";
DECLARE CONTINUE HANDLER FOR 1429 SET E='1429', M="Unable to connect to foreign data source: %s";
DECLARE CONTINUE HANDLER FOR 1430 SET E='1430', M="There was a problem processing the query on the foreign data source. Data source error: %s";
DECLARE CONTINUE HANDLER FOR 1431 SET E='1431', M="The foreign data source you are trying to reference does not exist. Data source error: %s";
DECLARE CONTINUE HANDLER FOR 1432 SET E='1432', M="Can't create federated table. The data source connection string '%s' is not in the correct format";
DECLARE CONTINUE HANDLER FOR 1433 SET E='1433', M="The data source connection string '%s' is not in the correct format";
DECLARE CONTINUE HANDLER FOR 1434 SET E='1434', M="Can't create federated table. Foreign data src error: %s";
DECLARE CONTINUE HANDLER FOR 1435 SET E='1435', M="Trigger in wrong schema";
DECLARE CONTINUE HANDLER FOR 1436 SET E='1436', M="Thread stack overrun: %ld bytes used of a %ld byte stack, and %ld bytes needed. Use 'mysqld -O thread_stack=#' to specify a bigger stack.";
DECLARE CONTINUE HANDLER FOR 1437 SET E='1437', M="Routine body for '%s' is too long";
DECLARE CONTINUE HANDLER FOR 1438 SET E='1438', M="Cannot drop default keycache";
DECLARE CONTINUE HANDLER FOR 1439 SET E='1439', M="Display width out of range for column '%s' (max = %lu)";
DECLARE CONTINUE HANDLER FOR 1440 SET E='1440', M="XAER_DUPID: The XID already exists";
DECLARE CONTINUE HANDLER FOR 1441 SET E='1441', M="Datetime function: %s field overflow";
DECLARE CONTINUE HANDLER FOR 1442 SET E='1442', M="Can't update table '%s' in stored function/trigger because it is already used by statement which invoked this stored function/trigger.";
DECLARE CONTINUE HANDLER FOR 1443 SET E='1443', M="The definition of table '%s' prevents operation %s on table '%s'.";
DECLARE CONTINUE HANDLER FOR 1444 SET E='1444', M="The prepared statement contains a stored routine call that refers to that same statement. It's not allowed to execute a prepared statement in such a recursive manner";
DECLARE CONTINUE HANDLER FOR 1445 SET E='1445', M="Not allowed to set autocommit from a stored function or trigger";
DECLARE CONTINUE HANDLER FOR 1446 SET E='1446', M="Definer is not fully qualified";
DECLARE CONTINUE HANDLER FOR 1447 SET E='1447', M="View '%s'.'%s' has no definer information (old table format). Current user is used as definer. Please recreate the view!";
DECLARE CONTINUE HANDLER FOR 1448 SET E='1448', M="You need the SUPER privilege for creation view with '%s'@'%s' definer";
DECLARE CONTINUE HANDLER FOR 1449 SET E='1449', M="The user specified as a definer ('%s'@'%s') does not exist";
DECLARE CONTINUE HANDLER FOR 1450 SET E='1450', M="Changing schema from '%s' to '%s' is not allowed.";
DECLARE CONTINUE HANDLER FOR 1451 SET E='1451', M="Cannot delete or update a parent row: a foreign key constraint fails (%s)";
DECLARE CONTINUE HANDLER FOR 1452 SET E='1452', M="Cannot add or update a child row: a foreign key constraint fails (%s)";
DECLARE CONTINUE HANDLER FOR 1453 SET E='1453', M="Variable '%s' must be quoted with `...`, or renamed";
DECLARE CONTINUE HANDLER FOR 1454 SET E='1454', M="No definer attribute for trigger '%s'.'%s'. The trigger will be activated under the authorization of the invoker, which may have insufficient privileges. Please recreate the trigger.";
DECLARE CONTINUE HANDLER FOR 1455 SET E='1455', M="'%s' has an old format, you should re-create the '%s' object(s)";
DECLARE CONTINUE HANDLER FOR 1456 SET E='1456', M="Recursive limit %d (as set by the max_sp_recursion_depth variable) was exceeded for routine %s";
DECLARE CONTINUE HANDLER FOR 1457 SET E='1457', M="Failed to load routine %s. The table mysql.proc is missing, corrupt, or contains bad data (internal code %d)";
DECLARE CONTINUE HANDLER FOR 1458 SET E='1458', M="Incorrect routine name '%s'";
DECLARE CONTINUE HANDLER FOR 1459 SET E='1459', M="Table upgrade required. Please do 'REPAIR TABLE `%s`' or dump/reload to fix it!";
DECLARE CONTINUE HANDLER FOR 1460 SET E='1460', M="AGGREGATE is not supported for stored functions";
DECLARE CONTINUE HANDLER FOR 1461 SET E='1461', M="Can't create more than max_prepared_stmt_count statements (current value: %lu)";
DECLARE CONTINUE HANDLER FOR 1462 SET E='1462', M="`%s`.`%s` contains view recursion";
DECLARE CONTINUE HANDLER FOR 1463 SET E='1463', M="non-grouping field '%s' is used in %s clause";
DECLARE CONTINUE HANDLER FOR 1464 SET E='1464', M="The used table type doesn't support SPATIAL indexes";
DECLARE CONTINUE HANDLER FOR 1465 SET E='1465', M="Triggers can not be created on system tables";
DECLARE CONTINUE HANDLER FOR 1466 SET E='1466', M="Leading spaces are removed from name '%s'";
DECLARE CONTINUE HANDLER FOR 1467 SET E='1467', M="Failed to read auto-increment value from storage engine";
DECLARE CONTINUE HANDLER FOR 1468 SET E='1468', M="user name";
DECLARE CONTINUE HANDLER FOR 1469 SET E='1469', M="host name";
DECLARE CONTINUE HANDLER FOR 1470 SET E='1470', M="String '%s' is too long for %s (should be no longer than %d)";
DECLARE CONTINUE HANDLER FOR 1471 SET E='1471', M="The target table %s of the %s is not insertable-into";
DECLARE CONTINUE HANDLER FOR 1472 SET E='1472', M="Table '%s' is differently defined or of non-MyISAM type or doesn't exist";
DECLARE CONTINUE HANDLER FOR 1473 SET E='1473', M="Too high level of nesting for select";
DECLARE CONTINUE HANDLER FOR 1474 SET E='1474', M="Name '%s' has become ''";
DECLARE CONTINUE HANDLER FOR 1475 SET E='1475', M="First character of the FIELDS TERMINATED string is ambiguous; please use non-optional and non-empty FIELDS ENCLOSED BY";
DECLARE CONTINUE HANDLER FOR 1476 SET E='1476', M="The foreign server, %s, you are trying to create already exists.";
DECLARE CONTINUE HANDLER FOR 1477 SET E='1477', M="The foreign server name you are trying to reference does not exist. Data source error: %s";
DECLARE CONTINUE HANDLER FOR 1478 SET E='1478', M="Table storage engine '%s' does not support the create option '%s'";
DECLARE CONTINUE HANDLER FOR 1479 SET E='1479', M="Syntax error: %s PARTITIONING requires definition of VALUES %s for each partition";
DECLARE CONTINUE HANDLER FOR 1480 SET E='1480', M="Only %s PARTITIONING can use VALUES %s in partition definition";
DECLARE CONTINUE HANDLER FOR 1481 SET E='1481', M="MAXVALUE can only be used in last partition definition";
DECLARE CONTINUE HANDLER FOR 1482 SET E='1482', M="Subpartitions can only be hash partitions and by key";
DECLARE CONTINUE HANDLER FOR 1483 SET E='1483', M="Must define subpartitions on all partitions if on one partition";
DECLARE CONTINUE HANDLER FOR 1484 SET E='1484', M="Wrong number of partitions defined, mismatch with previous setting";
DECLARE CONTINUE HANDLER FOR 1485 SET E='1485', M="Wrong number of subpartitions defined, mismatch with previous setting";
DECLARE CONTINUE HANDLER FOR 1486 SET E='1486', M="Constant, random or timezone-dependent expressions in (sub)partitioning function are not allowed";
DECLARE CONTINUE HANDLER FOR 1487 SET E='1487', M="Expression in RANGE/LIST VALUES must be constant";
DECLARE CONTINUE HANDLER FOR 1488 SET E='1488', M="Field in list of fields for partition function not found in table";
DECLARE CONTINUE HANDLER FOR 1489 SET E='1489', M="List of fields is only allowed in KEY partitions";
DECLARE CONTINUE HANDLER FOR 1490 SET E='1490', M="The partition info in the frm file is not consistent with what can be written into the frm file";
DECLARE CONTINUE HANDLER FOR 1491 SET E='1491', M="The %s function returns the wrong type";
DECLARE CONTINUE HANDLER FOR 1492 SET E='1492', M="For %s partitions each partition must be defined";
DECLARE CONTINUE HANDLER FOR 1493 SET E='1493', M="VALUES LESS THAN value must be strictly increasing for each partition";
DECLARE CONTINUE HANDLER FOR 1494 SET E='1494', M="VALUES value must be of same type as partition function";
DECLARE CONTINUE HANDLER FOR 1495 SET E='1495', M="Multiple definition of same constant in list partitioning";
DECLARE CONTINUE HANDLER FOR 1496 SET E='1496', M="Partitioning can not be used stand-alone in query";
DECLARE CONTINUE HANDLER FOR 1497 SET E='1497', M="The mix of handlers in the partitions is not allowed in this version of MySQL";
DECLARE CONTINUE HANDLER FOR 1498 SET E='1498', M="For the partitioned engine it is necessary to define all %s";
DECLARE CONTINUE HANDLER FOR 1499 SET E='1499', M="Too many partitions (including subpartitions) were defined";
DECLARE CONTINUE HANDLER FOR 1500 SET E='1500', M="It is only possible to mix RANGE/LIST partitioning with HASH/KEY partitioning for subpartitioning";
DECLARE CONTINUE HANDLER FOR 1501 SET E='1501', M="Failed to create specific handler file";
DECLARE CONTINUE HANDLER FOR 1502 SET E='1502', M="A BLOB field is not allowed in partition function";
DECLARE CONTINUE HANDLER FOR 1503 SET E='1503', M="A %s must include all columns in the table's partitioning function";
DECLARE CONTINUE HANDLER FOR 1504 SET E='1504', M="Number of %s = 0 is not an allowed value";
DECLARE CONTINUE HANDLER FOR 1505 SET E='1505', M="Partition management on a not partitioned table is not possible";
DECLARE CONTINUE HANDLER FOR 1506 SET E='1506', M="Foreign key clause is not yet supported in conjunction with partitioning";
DECLARE CONTINUE HANDLER FOR 1507 SET E='1507', M="Error in list of partitions to %s";
DECLARE CONTINUE HANDLER FOR 1508 SET E='1508', M="Cannot remove all partitions, use DROP TABLE instead";
DECLARE CONTINUE HANDLER FOR 1509 SET E='1509', M="COALESCE PARTITION can only be used on HASH/KEY partitions";
DECLARE CONTINUE HANDLER FOR 1510 SET E='1510', M="REORGANIZE PARTITION can only be used to reorganize partitions not to change their numbers";
DECLARE CONTINUE HANDLER FOR 1511 SET E='1511', M="REORGANIZE PARTITION without parameters can only be used on auto-partitioned tables using HASH PARTITIONs";
DECLARE CONTINUE HANDLER FOR 1512 SET E='1512', M="%s PARTITION can only be used on RANGE/LIST partitions";
DECLARE CONTINUE HANDLER FOR 1513 SET E='1513', M="Trying to Add partition(s) with wrong number of subpartitions";
DECLARE CONTINUE HANDLER FOR 1514 SET E='1514', M="At least one partition must be added";
DECLARE CONTINUE HANDLER FOR 1515 SET E='1515', M="At least one partition must be coalesced";
DECLARE CONTINUE HANDLER FOR 1516 SET E='1516', M="More partitions to reorganize than there are partitions";
DECLARE CONTINUE HANDLER FOR 1517 SET E='1517', M="Duplicate partition name %s";
DECLARE CONTINUE HANDLER FOR 1518 SET E='1518', M="It is not allowed to shut off binlog on this command";
DECLARE CONTINUE HANDLER FOR 1519 SET E='1519', M="When reorganizing a set of partitions they must be in consecutive order";
DECLARE CONTINUE HANDLER FOR 1520 SET E='1520', M="Reorganize of range partitions cannot change total ranges except for last partition where it can extend the range";
DECLARE CONTINUE HANDLER FOR 1521 SET E='1521', M="Partition function not supported in this version for this handler";
DECLARE CONTINUE HANDLER FOR 1522 SET E='1522', M="Partition state cannot be defined from CREATE/ALTER TABLE";
DECLARE CONTINUE HANDLER FOR 1523 SET E='1523', M="The %s handler only supports 32 bit integers in VALUES";
DECLARE CONTINUE HANDLER FOR 1524 SET E='1524', M="Plugin '%s' is not loaded";
DECLARE CONTINUE HANDLER FOR 1525 SET E='1525', M="Incorrect %s value: '%s'";
DECLARE CONTINUE HANDLER FOR 1526 SET E='1526', M="Table has no partition for value %s";
DECLARE CONTINUE HANDLER FOR 1527 SET E='1527', M="It is not allowed to specify %s more than once";
DECLARE CONTINUE HANDLER FOR 1528 SET E='1528', M="Failed to create %s";
DECLARE CONTINUE HANDLER FOR 1529 SET E='1529', M="Failed to drop %s";
DECLARE CONTINUE HANDLER FOR 1530 SET E='1530', M="The handler doesn't support autoextend of tablespaces";
DECLARE CONTINUE HANDLER FOR 1531 SET E='1531', M="A size parameter was incorrectly specified, either number or on the form 10M";
DECLARE CONTINUE HANDLER FOR 1532 SET E='1532', M="The size number was correct but we don't allow the digit part to be more than 2 billion";
DECLARE CONTINUE HANDLER FOR 1533 SET E='1533', M="Failed to alter: %s";
DECLARE CONTINUE HANDLER FOR 1534 SET E='1534', M="Writing one row to the row-based binary log failed";
DECLARE CONTINUE HANDLER FOR 1535 SET E='1535', M="Table definition on master and slave does not match: %s";
DECLARE CONTINUE HANDLER FOR 1536 SET E='1536', M="Slave running with --log-slave-updates must use row-based binary logging to be able to replicate row-based binary log events";
DECLARE CONTINUE HANDLER FOR 1537 SET E='1537', M="Event '%s' already exists";
DECLARE CONTINUE HANDLER FOR 1538 SET E='1538', M="Failed to store event %s. Error code %d from storage engine.";
DECLARE CONTINUE HANDLER FOR 1539 SET E='1539', M="Unknown event '%s'";
DECLARE CONTINUE HANDLER FOR 1540 SET E='1540', M="Failed to alter event '%s'";
DECLARE CONTINUE HANDLER FOR 1541 SET E='1541', M="Failed to drop %s";
DECLARE CONTINUE HANDLER FOR 1542 SET E='1542', M="INTERVAL is either not positive or too big";
DECLARE CONTINUE HANDLER FOR 1543 SET E='1543', M="ENDS is either invalid or before STARTS";
DECLARE CONTINUE HANDLER FOR 1544 SET E='1544', M="Event execution time is in the past. Event has been disabled";
DECLARE CONTINUE HANDLER FOR 1545 SET E='1545', M="Failed to open mysql.event";
DECLARE CONTINUE HANDLER FOR 1546 SET E='1546', M="No datetime expression provided";
DECLARE CONTINUE HANDLER FOR 1547 SET E='1547', M="Column count of mysql.%s is wrong. Expected %d, found %d. The table is probably corrupted";
DECLARE CONTINUE HANDLER FOR 1548 SET E='1548', M="Cannot load from mysql.%s. The table is probably corrupted";
DECLARE CONTINUE HANDLER FOR 1549 SET E='1549', M="Failed to delete the event from mysql.event";
DECLARE CONTINUE HANDLER FOR 1550 SET E='1550', M="Error during compilation of event's body";
DECLARE CONTINUE HANDLER FOR 1551 SET E='1551', M="Same old and new event name";
DECLARE CONTINUE HANDLER FOR 1552 SET E='1552', M="Data for column '%s' too long";
DECLARE CONTINUE HANDLER FOR 1553 SET E='1553', M="Cannot drop index '%s': needed in a foreign key constraint";
DECLARE CONTINUE HANDLER FOR 1554 SET E='1554', M="The syntax '%s' is deprecated and will be removed in MySQL %s. Please use %s instead";
DECLARE CONTINUE HANDLER FOR 1555 SET E='1555', M="You can't write-lock a log table. Only read access is possible";
DECLARE CONTINUE HANDLER FOR 1556 SET E='1556', M="You can't use locks with log tables.";
DECLARE CONTINUE HANDLER FOR 1557 SET E='1557', M="Upholding foreign key constraints for table '%s', entry '%s', key %d would lead to a duplicate entry";
DECLARE CONTINUE HANDLER FOR 1558 SET E='1558', M="Column count of mysql.%s is wrong. Expected %d, found %d. Created with MySQL %d, now running %d. Please use mysql_upgrade to fix this error.";
DECLARE CONTINUE HANDLER FOR 1559 SET E='1559', M="Cannot switch out of the row-based binary log format when the session has open temporary tables";
DECLARE CONTINUE HANDLER FOR 1560 SET E='1560', M="Cannot change the binary logging format inside a stored function or trigger";
DECLARE CONTINUE HANDLER FOR 1561 SET E='1561', M="The NDB cluster engine does not support changing the binlog format on the fly yet";
DECLARE CONTINUE HANDLER FOR 1562 SET E='1562', M="Cannot create temporary table with partitions";
DECLARE CONTINUE HANDLER FOR 1563 SET E='1563', M="Partition constant is out of partition function domain";
DECLARE CONTINUE HANDLER FOR 1564 SET E='1564', M="This partition function is not allowed";
DECLARE CONTINUE HANDLER FOR 1565 SET E='1565', M="Error in DDL log";
DECLARE CONTINUE HANDLER FOR 1566 SET E='1566', M="Not allowed to use NULL value in VALUES LESS THAN";
DECLARE CONTINUE HANDLER FOR 1567 SET E='1567', M="Incorrect partition name";
DECLARE CONTINUE HANDLER FOR 1568 SET E='1568', M="Transaction isolation level can't be changed while a transaction is in progress";
DECLARE CONTINUE HANDLER FOR 1569 SET E='1569', M="ALTER TABLE causes auto_increment resequencing, resulting in duplicate entry '%s' for key '%s'";
DECLARE CONTINUE HANDLER FOR 1570 SET E='1570', M="Internal scheduler error %d";
DECLARE CONTINUE HANDLER FOR 1571 SET E='1571', M="Error during starting/stopping of the scheduler. Error code %u";
DECLARE CONTINUE HANDLER FOR 1572 SET E='1572', M="Engine cannot be used in partitioned tables";
DECLARE CONTINUE HANDLER FOR 1573 SET E='1573', M="Cannot activate '%s' log";
DECLARE CONTINUE HANDLER FOR 1574 SET E='1574', M="The server was not built with row-based replication";
DECLARE CONTINUE HANDLER FOR 1575 SET E='1575', M="Decoding of base64 string failed";
DECLARE CONTINUE HANDLER FOR 1576 SET E='1576', M="Recursion of EVENT DDL statements is forbidden when body is present";
DECLARE CONTINUE HANDLER FOR 1577 SET E='1577', M="Cannot proceed because system tables used by Event Scheduler were found damaged at server start";
DECLARE CONTINUE HANDLER FOR 1578 SET E='1578', M="Only integers allowed as number here";
DECLARE CONTINUE HANDLER FOR 1579 SET E='1579', M="This storage engine cannot be used for log tables";
DECLARE CONTINUE HANDLER FOR 1580 SET E='1580', M="You cannot '%s' a log table if logging is enabled";
DECLARE CONTINUE HANDLER FOR 1581 SET E='1581', M="Cannot rename '%s'. When logging enabled, rename to/from log table must rename two tables: the log table to an archive table and another table back to '%s'";
DECLARE CONTINUE HANDLER FOR 1582 SET E='1582', M="Incorrect parameter count in the call to native function '%s'";
DECLARE CONTINUE HANDLER FOR 1583 SET E='1583', M="Incorrect parameters in the call to native function '%s'";
DECLARE CONTINUE HANDLER FOR 1584 SET E='1584', M="Incorrect parameters in the call to stored function '%s'";
DECLARE CONTINUE HANDLER FOR 1585 SET E='1585', M="This function '%s' has the same name as a native function";
DECLARE CONTINUE HANDLER FOR 1586 SET E='1586', M="Duplicate entry '%s' for key '%s'";
DECLARE CONTINUE HANDLER FOR 1587 SET E='1587', M="Too many files opened, please execute the command again";
DECLARE CONTINUE HANDLER FOR 1588 SET E='1588', M="Event execution time is in the past and ON COMPLETION NOT PRESERVE is set. The event was dropped immediately after creation.";
DECLARE CONTINUE HANDLER FOR 1589 SET E='1589', M="Event execution time is in the past and ON COMPLETION NOT PRESERVE is set. The event was dropped immediately after creation.";
DECLARE CONTINUE HANDLER FOR 1590 SET E='1590', M="The incident %s occured on the master. Message: %s";
DECLARE CONTINUE HANDLER FOR 1591 SET E='1591', M="Table has no partition for some existing values";
DECLARE CONTINUE HANDLER FOR 1592 SET E='1592', M="Statement may not be safe to log in statement format.";
DECLARE CONTINUE HANDLER FOR 1593 SET E='1593', M="Fatal error: %s";
DECLARE CONTINUE HANDLER FOR 1594 SET E='1594', M="Relay log read failure: %s";
DECLARE CONTINUE HANDLER FOR 1595 SET E='1595', M="Relay log write failure: %s";
DECLARE CONTINUE HANDLER FOR 1596 SET E='1596', M="Failed to create %s";
DECLARE CONTINUE HANDLER FOR 1597 SET E='1597', M="Master command %s failed: %s";
DECLARE CONTINUE HANDLER FOR 1598 SET E='1598', M="Binary logging not possible. Message: %s";
DECLARE CONTINUE HANDLER FOR 1599 SET E='1599', M="View `%s`.`%s` has no creation context";
DECLARE CONTINUE HANDLER FOR 1600 SET E='1600', M="Creation context of view `%s`.`%s' is invalid";
DECLARE CONTINUE HANDLER FOR 1601 SET E='1601', M="Creation context of stored routine `%s`.`%s` is invalid";
DECLARE CONTINUE HANDLER FOR 1602 SET E='1602', M="Corrupted TRG file for table `%s`.`%s`";
DECLARE CONTINUE HANDLER FOR 1603 SET E='1603', M="Triggers for table `%s`.`%s` have no creation context";
DECLARE CONTINUE HANDLER FOR 1604 SET E='1604', M="Trigger creation context of table `%s`.`%s` is invalid";
DECLARE CONTINUE HANDLER FOR 1605 SET E='1605', M="Creation context of event `%s`.`%s` is invalid";
DECLARE CONTINUE HANDLER FOR 1606 SET E='1606', M="Cannot open table for trigger `%s`.`%s`";
DECLARE CONTINUE HANDLER FOR 1607 SET E='1607', M="Cannot create stored routine `%s`. Check warnings";
DECLARE CONTINUE HANDLER FOR 1608 SET E='1608', M="Ambiguous slave modes combination. %s";
DECLARE CONTINUE HANDLER FOR 1609 SET E='1609', M="The BINLOG statement of type `%s` was not preceded by a format description BINLOG statement.";
DECLARE CONTINUE HANDLER FOR 1610 SET E='1610', M="Corrupted replication event was detected";
DECLARE CONTINUE HANDLER FOR 1611 SET E='1611', M="Invalid column reference (%s) in LOAD DATA";
DECLARE CONTINUE HANDLER FOR 1612 SET E='1612', M="Being purged log %s was not found";
DECLARE CONTINUE HANDLER FOR 1613 SET E='1613', M="XA_RBTIMEOUT: Transaction branch was rolled back: took too long";
DECLARE CONTINUE HANDLER FOR 1614 SET E='1614', M="XA_RBDEADLOCK: Transaction branch was rolled back: deadlock was detected";
DECLARE CONTINUE HANDLER FOR 1615 SET E='1615', M="Prepared statement needs to be re-prepared";
DECLARE CONTINUE HANDLER FOR 1616 SET E='1616', M="DELAYED option not supported for table '%s'";
DECLARE CONTINUE HANDLER FOR 1617 SET E='1617', M="The master info structure does not exist";
DECLARE CONTINUE HANDLER FOR 1618 SET E='1618', M="<%s> option ignored";
DECLARE CONTINUE HANDLER FOR 1619 SET E='1619', M="Built-in plugins cannot be deleted";
DECLARE CONTINUE HANDLER FOR 1620 SET E='1620', M="Plugin is busy and will be uninstalled on shutdown";
DECLARE CONTINUE HANDLER FOR 1621 SET E='1621', M="%s variable '%s' is read-only. Use SET %s to assign the value";
DECLARE CONTINUE HANDLER FOR 1622 SET E='1622', M="Storage engine %s does not support rollback for this statement. Transaction rolled back and must be restarted";
DECLARE CONTINUE HANDLER FOR 1623 SET E='1623', M="Unexpected master's heartbeat data: %s";
DECLARE CONTINUE HANDLER FOR 1624 SET E='1624', M="The requested value for the heartbeat period %s %s";
DECLARE CONTINUE HANDLER FOR 1625 SET E='1625', M="Bad schema for mysql.ndb_replication table. Message: %s";
DECLARE CONTINUE HANDLER FOR 1626 SET E='1626', M="Error in parsing conflict function. Message: %s";
DECLARE CONTINUE HANDLER FOR 1627 SET E='1627', M="Write to exceptions table failed. Message: %s";
DECLARE CONTINUE HANDLER FOR 1628 SET E='1628', M="Comment for table '%s' is too long (max = %lu)";
DECLARE CONTINUE HANDLER FOR 1629 SET E='1629', M="Comment for field '%s' is too long (max = %lu)";
DECLARE CONTINUE HANDLER FOR 1630 SET E='1630', M="FUNCTION %s does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual";
DECLARE CONTINUE HANDLER FOR 1631 SET E='1631', M="Database";
DECLARE CONTINUE HANDLER FOR 1632 SET E='1632', M="Table";
DECLARE CONTINUE HANDLER FOR 1633 SET E='1633', M="Partition";
DECLARE CONTINUE HANDLER FOR 1634 SET E='1634', M="Subpartition";
DECLARE CONTINUE HANDLER FOR 1635 SET E='1635', M="Temporary";
DECLARE CONTINUE HANDLER FOR 1636 SET E='1636', M="Renamed";
DECLARE CONTINUE HANDLER FOR 1637 SET E='1637', M="Too many active concurrent transactions";
DECLARE CONTINUE HANDLER FOR 1638 SET E='1638', M="Non-ASCII separator arguments are not fully supported";
DECLARE CONTINUE HANDLER FOR 1639 SET E='1639', M="debug sync point wait timed out";
DECLARE CONTINUE HANDLER FOR 1640 SET E='1640', M="debug sync point hit limit reached";
DECLARE CONTINUE HANDLER FOR 2000 SET E='2000', M="Unknown MySQL error";
DECLARE CONTINUE HANDLER FOR 2001 SET E='2001', M="Can't create UNIX socket (%d)";
DECLARE CONTINUE HANDLER FOR 2002 SET E='2002', M="Can't connect to local MySQL server through socket '%s' (%d)";
DECLARE CONTINUE HANDLER FOR 2003 SET E='2003', M="Can't connect to MySQL server on '%s' (%d)";
DECLARE CONTINUE HANDLER FOR 2004 SET E='2004', M="Can't create TCP/IP socket (%d)";
DECLARE CONTINUE HANDLER FOR 2005 SET E='2005', M="Unknown MySQL server host '%s' (%d)";
DECLARE CONTINUE HANDLER FOR 2006 SET E='2006', M="MySQL server has gone away";
DECLARE CONTINUE HANDLER FOR 2007 SET E='2007', M="Protocol mismatch; server version = %d, client version = %d";
DECLARE CONTINUE HANDLER FOR 2008 SET E='2008', M="MySQL client ran out of memory";
DECLARE CONTINUE HANDLER FOR 2009 SET E='2009', M="Wrong host info";
DECLARE CONTINUE HANDLER FOR 2010 SET E='2010', M="Localhost via UNIX socket";
DECLARE CONTINUE HANDLER FOR 2011 SET E='2011', M="%s via TCP/IP";
DECLARE CONTINUE HANDLER FOR 2012 SET E='2012', M="Error in server handshake";
DECLARE CONTINUE HANDLER FOR 2013 SET E='2013', M="Lost connection to MySQL server during query";
DECLARE CONTINUE HANDLER FOR 2014 SET E='2014', M="Commands out of sync; you can't run this command now";
DECLARE CONTINUE HANDLER FOR 2015 SET E='2015', M="Named pipe: %s";
DECLARE CONTINUE HANDLER FOR 2016 SET E='2016', M="Can't wait for named pipe to host: %s pipe: %s (%lu)";
DECLARE CONTINUE HANDLER FOR 2017 SET E='2017', M="Can't open named pipe to host: %s pipe: %s (%lu)";
DECLARE CONTINUE HANDLER FOR 2018 SET E='2018', M="Can't set state of named pipe to host: %s pipe: %s (%lu)";
DECLARE CONTINUE HANDLER FOR 2019 SET E='2019', M="Can't initialize character set %s (path: %s)";
DECLARE CONTINUE HANDLER FOR 2020 SET E='2020', M="Got packet bigger than 'max_allowed_packet' bytes";
DECLARE CONTINUE HANDLER FOR 2021 SET E='2021', M="Embedded server";
DECLARE CONTINUE HANDLER FOR 2022 SET E='2022', M="Error on SHOW SLAVE STATUS:";
DECLARE CONTINUE HANDLER FOR 2023 SET E='2023', M="Error on SHOW SLAVE HOSTS:";
DECLARE CONTINUE HANDLER FOR 2024 SET E='2024', M="Error connecting to slave:";
DECLARE CONTINUE HANDLER FOR 2025 SET E='2025', M="Error connecting to master:";
DECLARE CONTINUE HANDLER FOR 2026 SET E='2026', M="SSL connection error";
DECLARE CONTINUE HANDLER FOR 2027 SET E='2027', M="Malformed packet";
DECLARE CONTINUE HANDLER FOR 2028 SET E='2028', M="This client library is licensed only for use with MySQL servers having '%s' license";
DECLARE CONTINUE HANDLER FOR 2029 SET E='2029', M="Invalid use of null pointer";
DECLARE CONTINUE HANDLER FOR 2030 SET E='2030', M="Statement not prepared";
DECLARE CONTINUE HANDLER FOR 2031 SET E='2031', M="No data supplied for parameters in prepared statement";
DECLARE CONTINUE HANDLER FOR 2032 SET E='2032', M="Data truncated";
DECLARE CONTINUE HANDLER FOR 2033 SET E='2033', M="No parameters exist in the statement";
DECLARE CONTINUE HANDLER FOR 2034 SET E='2034', M="Invalid parameter number";
DECLARE CONTINUE HANDLER FOR 2035 SET E='2035', M="Can't send long data for non-string/non-binary data types (parameter: %d)";
DECLARE CONTINUE HANDLER FOR 2036 SET E='2036', M="Using unsupported buffer type: %d (parameter: %d)";
DECLARE CONTINUE HANDLER FOR 2037 SET E='2037', M="Shared memory: %s";
DECLARE CONTINUE HANDLER FOR 2038 SET E='2038', M="Can't open shared memory; client could not create request event (%lu)";
DECLARE CONTINUE HANDLER FOR 2039 SET E='2039', M="Can't open shared memory; no answer event received from server (%lu)";
DECLARE CONTINUE HANDLER FOR 2040 SET E='2040', M="Can't open shared memory; server could not allocate file mapping (%lu)";
DECLARE CONTINUE HANDLER FOR 2041 SET E='2041', M="Can't open shared memory; server could not get pointer to file mapping (%lu)";
DECLARE CONTINUE HANDLER FOR 2042 SET E='2042', M="Can't open shared memory; client could not allocate file mapping (%lu)";
DECLARE CONTINUE HANDLER FOR 2043 SET E='2043', M="Can't open shared memory; client could not get pointer to file mapping (%lu)";
DECLARE CONTINUE HANDLER FOR 2044 SET E='2044', M="Can't open shared memory; client could not create %s event (%lu)";
DECLARE CONTINUE HANDLER FOR 2045 SET E='2045', M="Can't open shared memory; no answer from server (%lu)";
DECLARE CONTINUE HANDLER FOR 2046 SET E='2046', M="Can't open shared memory; cannot send request event to server (%lu)";
DECLARE CONTINUE HANDLER FOR 2047 SET E='2047', M="Wrong or unknown protocol";
DECLARE CONTINUE HANDLER FOR 2048 SET E='2048', M="Invalid connection handle";
DECLARE CONTINUE HANDLER FOR 2049 SET E='2049', M="Connection using old (pre-4.1.1) authentication protocol refused (client option 'secure_auth' enabled)";
DECLARE CONTINUE HANDLER FOR 2050 SET E='2050', M="Row retrieval was canceled by mysql_stmt_close() call";
DECLARE CONTINUE HANDLER FOR 2051 SET E='2051', M="Attempt to read column without prior row fetch";
DECLARE CONTINUE HANDLER FOR 2052 SET E='2052', M="Prepared statement contains no metadata";
DECLARE CONTINUE HANDLER FOR 2053 SET E='2053', M="Attempt to read a row while there is no result set associated with the statement";
DECLARE CONTINUE HANDLER FOR 2054 SET E='2054', M="This feature is not implemented yet";
DECLARE CONTINUE HANDLER FOR 2055 SET E='2055', M="Lost connection to MySQL server at '%s', system error: %d";
DECLARE CONTINUE HANDLER FOR 2056 SET E='2056', M="Statement closed indirectly because of a preceeding %s() call";
DECLARE CONTINUE HANDLER FOR 2057 SET E='2057', M="The number of columns in the result set differs from the number of bound buffers. You must reset the statement, rebind the result set columns, and execute the statement again";

-- Some operation
IF E> 0 THEN
	SELECT CONCAT("Error #", E, ": ", M);
END IF;
/*-------------------------------------------*/
-- ********************************************************
-- ******************* PROVA0 *****************************
-- ********************************************************
DROP PROCEDURE IF EXISTS prova0;

DELIMITER //
CREATE PROCEDURE prova0 (INOUT par_var INT)
BEGIN
	SET par_var:=(SELECT COUNT(*) FROM jugador WHERE dorsal = par_var);
END //
DELIMITER ;

DECLARE var INT; -- ERROR!!!!! No es pot declarar una variable fora d'un bloc BEGIN - END
-- DECLARE var INT DEFAULT 10; -- ERROR!!!!!

SET var = 10;
SELECT var;

CALL prova0(var);
SELECT var;

-- ********************************************************
-- ******************* PROVA1 *****************************
-- ********************************************************
DROP PROCEDURE IF EXISTS prova1;

DELIMITER //
CREATE PROCEDURE prova1(IN par_in INT)
BEGIN
	SELECT par_in par_in_1; /* 5 */
	SET par_in = 50;
	SELECT par_in par_in_2; /* 50 */
END //
DELIMITER ;

SET @entrada = 5;
SELECT @entrada entrada_1; /* 5 */

CALL prova1(@entrada);
SELECT @entrada entrada_2; /* 5 */

-- ********************************************************
-- ******************* PROVA2 *****************************
-- ********************************************************
DROP PROCEDURE IF EXISTS prova2;

DELIMITER //
CREATE PROCEDURE prova2(OUT par_out INT)
BEGIN
	SELECT par_out par_out_1; /* NULL */
	SET par_out = 100;
	SELECT par_out par_out_2; /* 100 */
END //
DELIMITER ;

SET @salida = 10;
SELECT @salida salida_1; /* 10 */

CALL prova2(@salida);
SELECT @salida salida_2; /* 100 */

-- ********************************************************
-- ******************* PROVA3 *****************************
-- ********************************************************
DROP PROCEDURE IF EXISTS prova3;

DELIMITER //
CREATE PROCEDURE prova3(INOUT par_inout INT)
BEGIN	
	SELECT par_inout par_out_1; /* 20 */
	SET par_inout = 200;
	SELECT par_inout par_out_2; /* 200 */
END //
DELIMITER ;

SET @ent_sal = 20;
SELECT @ent_sal ent_sal_1; /* 20 */

CALL prova3(@ent_sal);
SELECT @ent_sal ent_sal_2; /* 200 */

-- ********************************************************
-- ******************* PROVA123 *****************************
-- ********************************************************
DROP PROCEDURE IF EXISTS prova4;

DELIMITER //
CREATE PROCEDURE prova123(IN par_in INT, OUT par_out INT, INOUT par_inout INT)
BEGIN
	SELECT par_in par_in_1; /* 5 */
	SET par_in = 50;
	SELECT par_in par_in_2; /* 50 */
	
	SELECT par_out par_out_1; /* NULL */
	SET par_out = 100;
	SELECT par_out par_out_2; /* 100 */
	
	SELECT par_inout par_out_1; /* 20 */
	SET par_inout = 200;
	SELECT par_inout par_out_2; /* 200 */
END //
DELIMITER ;

SET @entrada = 5;
SET @salida = 10;
SET @ent_sal = 20;
SELECT @entrada entrada_1; /* 5 */
SELECT @salida salida_1; /* 10 */
SELECT @ent_sal ent_sal_1; /* 20 */

CALL prova123(@entrada, @salida, @ent_sal);
SELECT @entrada entrada_2; /* 5 */
SELECT @salida salida_2; /* 100 */
SELECT @ent_sal ent_sal_2; /* 200 */

-- ********************************************************
-- ******************* PROVA4 *****************************
-- ********************************************************
DROP PROCEDURE IF EXISTS prova4;

DELIMITER //
CREATE PROCEDURE prova5()
BEGIN
	SELECT @user_var; -- MAL!!! No hem d'accedir a una variable global des de dins del procediment
	SET @user_var:=(SELECT COUNT(*) FROM jugador WHERE dorsal = @user_var); -- MAL!!! No hem d'accedir a una variable global des de dins del procediment
	SELECT @user_var; -- MAL!!! No hem d'accedir a una variable global des de dins del procediment
END //
DELIMITER ;

SET @user_var = 10;
SELECT @user_var;

CALL prova4();
SELECT @user_var;
/*--------------------------------------------------------------------------------*/
USE pizzeria;

DELIMITER //
CREATE PROCEDURE nom_procediment()
BEGIN
    instruccions
END;
DELIMITER ;

/* Exemple 1: Volem crear un procediment que ens mostri els 
clients que tenim.
*/
DELIMITER //
CREATE PROCEDURE proc1()
BEGIN
    SELECT * FROM client;
END//
DELIMITER ;

SHOW CREATE PROCEDURE proc1;
DROP PROCEDURE proc1;
CALL proc1();
/* Exemple 2: Volem crear un procediment que ens mostri
tots els clients i tots els empleats.
Exemple d'execució: CALL proc2();*/
DELIMITER //
CREATE PROCEDURE proc2()
BEGIN
    SELECT * FROM client;
    SELECT * FROM empleat;
END //
DELIMITER ;

CALL proc2();

/*Exemple 3: Volem crear un procediment que passant-li
el nom i el cognom d'un empleat l'introduixi a la taula
empleat.
Exemple d'execució: CALL proc3('Marta','Martí');*/
DELIMITER //
CREATE PROCEDURE proc3(par_nom VARCHAR(20),
    par_cognoms VARCHAR(20))
BEGIN
    INSERT INTO empleat 
        VALUES (NULL,par_nom,par_cognoms);
END //
DELIMITER ;

DROP PROCEDURE proc3;
CALL proc3('Josep','Ferrer');
SELECT * FROM empleat;

/*Exemple 4: Volem crear un procediment on tenim 
dues opció: si passem una 'A' ens mostra els clients
i si passem un 'B' ens mostra els empleats.
Exemple d'execució: CALL proc4('B');*/
DELIMITER //
CREATE PROCEDURE proc4(par_opcio VARCHAR(1))
BEGIN
    IF (par_opcio LIKE 'A') THEN
        SELECT * FROM client;
    ELSEIF (par_opcio LIKE 'B') THEN
        SELECT * FROM empleat;
    ELSE
        SELECT 'Ha de ser una A o una B' AS Error;
    END IF;
END //
DELIMITER ;
SHOW CREATE PROCEDURE proc3;
DROP PROCEDURE proc4;
CALL proc4('z');

/* Exemple 5: Crea un procediment on li passarem tres 
paràmetres: el primer serà una A o una B i el segon serà
el nom i el tercer el cognom d'un empleat. Si és una A em
mostra el seu codi (si existeix) i si és un B la introduirà
a la taula empleat.
Exemple d'execució: CALL proc5('A','Marta','Rovira');*/
DELIMITER //
CREATE PROCEDURE proc5(par_opcio ENUM('A','B'),par_nom VARCHAR(20),
    par_cognoms VARCHAR(40))
BEGIN
    IF (par_opcio LIKE 'A') THEN
        SELECT codi
            FROM empleat
            WHERE nom LIKE par_nom AND cognoms LIKE par_cognoms;
    ELSEIF (par_opcio LIKE 'B') THEN
        INSERT INTO empleat VALUES (NULL,par_nom,par_cognoms);
    END IF;
END //
DELIMITER ;
CALL proc5('A','Marta','Rovira');

/* Exemple 6: Crea un procediment on li passarem un paràmetre i ens
ha de retornat la suma d'aquest nombre més un valor. 
Exemple d'execució: CALL proc6(7,@resultat);*/

DELIMITER //
CREATE PROCEDURE exemple6(IN par_nombre SMALLINT,
    OUT par_resultat SMALLINT)
BEGIN
    DECLARE var_nombre SMALLINT;
    #DECLARE resultat SMALLINT;
    
    SET var_nombre=5;
    SET par_resultat=var_nombre+par_nombre;
    #SELECT resultat;
END //
DELIMITER ;

/*Exemple 7:
Donat dues cadenes de text de una longitud màxima de 10 caràcters
fes que retorni en una variable d'usuari les dues cadenes seguides
separades per un espai.
Exemple d'execució: CALL exemple7('abc','def',@final);*/

DELIMITER //
CREATE PROCEDURE exemple7(IN par_text1 VARCHAR(10),IN par_text2 VARCHAR(10),
    OUT par_resultat VARCHAR(21))
BEGIN
    DECLARE var_resultat VARCHAR(21);
    
    SET var_resultat=CONCAT(par_text1,' ',par_text2);
    SET par_resultat=var_resultat;
END //
DELIMITER ;

/*-----------------------------------------------------------------*/

	CREATE DATABASE proced;
	USE proced;
	CREATE TABLE alumne
		(codi			INT		PRIMARY KEY AUTO_INCREMENT,
		nom			VARCHAR(20) 	NOT NULL,
		cognom			VARCHAR(20)	NOT NULL,
		data_naixement 	DATE,
		edat			INT 
		);
	INSERT INTO alumne VALUES (NULL,'Guillem','Homet','1992/12/20',NULL);
	INSERT INTO alumne VALUES (NULL,'Marta','Ros','1993/01/21',NULL);
	INSERT INTO alumne VALUES (NULL,'Miquel','Rodríguez','1990/10/11',NULL);
	CREATE TABLE professor
		(codi			INT		PRIMARY KEY AUTO_INCREMENT,
		nom			VARCHAR(20) 	NOT NULL,
		cognom			VARCHAR(20)	NOT NULL,
		data_naixement 	DATE,
		edat			INT
		);
	INSERT INTO professor VALUES (NULL,'Núria','Ribas','1985/10/06',NULL);
	INSERT INTO professor VALUES (NULL,'Carles','Pujol','1978/06/14',NULL);

/* Exercici DCL_18:
Crea un procediment anomenat cerca que busqui tots 
els alumnes que el seu cognom la cadena que indiquem.
Exemple d'execució: CALL cerca('R%');*/

DELIMITER //
CREATE PROCEDURE cerca(par_cerca VARCHAR(20))
BEGIN
	SELECT *
		FROM alumne
		WHERE cognom LIKE par_cerca;
END//
DELIMITER ;

CALL cerca('R%');


/* Exercici DCL_19:
Crea un procediment que busqui els professors per nom i cognom.
Tingueu en compte que si deixem algun dels dos paràmetres buits cerqui pels altres.
Exemple d'execució: CALL cerca2(NULL,'Ribas');*/
DROP PROCEDURE DCL_cerca2;
DELIMITER //
CREATE PROCEDURE cerca2 (IN par_nom VARCHAR(20), IN par_cognom VARCHAR(20))
BEGIN
IF (par_nom IS NOT NULL AND par_cognom IS NOT NULL) THEN
	SELECT *
		FROM professor
		WHERE nom LIKE par_nom AND cognom LIKE par_cognom;
ELSEIF (par_nom IS NULL AND par_cognom IS NOT NULL) THEN
	SELECT *
		FROM professor
		WHERE cognom LIKE par_cognom;
ELSEIF (par_nom IS NOT NULL AND par_cognom IS NULL) THEN
	SELECT *
		FROM professor
		WHERE nom LIKE par_nom;
ELSE
	-- SELECT 'No has inserit cap informacio';
	SELECT * FROM professor;
END IF;
END //
DELIMITER ;

CALL cerca2(NULL,NULL);


/* Exercici DCL_20:
Crea un procediment que incrementi el valor del codi en un valor
que nosaltres li indiquem.
Exemple d'execució: CALL actualitza(20);*/

SELECT * FROM professor;

DELIMITER //
CREATE PROCEDURE actualitza (IN par_valor INT)
BEGIN
	UPDATE professor SET codi=codi+par_valor ORDER BY codi DESC;
END //
DELIMITER ;

CALL actualitza(20);

/* Exercici DCL_21:
Crea un procediment que donat un nom, un cognom, la data de naixement i 
si és professor o alumne, l'afegeixi a la taula corresponent. 
Si no, que no faci res.
Exemple d'execució: CALL inserir('Xavier','Vilà','1975/02/03','professor');*/

DELIMITER //
CREATE PROCEDURE inserir(IN par_nom VARCHAR(20),IN par_cognom VARCHAR(20),
	IN par_data DATE,IN par_taula ENUM('alumne','professor'))
BEGIN
	CASE par_taula
	WHEN 'alumne' THEN
		INSERT INTO alumne VALUES (NULL,par_nom,par_cognom,par_data,NULL);
	WHEN 'professor' THEN
		INSERT INTO professor VALUES (NULL,par_nom,par_cognom,par_data,NULL);
	ELSE
		SELECT 'No existeix la taula';
	END CASE;
END //
DELIMITER ;

CALL inserir('Xavier','Vilà','1975/02/03','professor');


/* Exercici DCL_22:
Crea un procediment que afegeixi la data de naixement als alumnes que no 
la tenen assignada o la tinguin malament. Per això li indicarem el 
codi de l'alumne i la data de naixement.
Exemple d'execució: CALL data_naix(21,'1995/03/19');*/

DELIMITER //
CREATE PROCEDURE data_naix(IN par_codi INT,IN par_data DATE)
BEGIN
	IF (par_codi IS NOT NULL AND par_data_naixement IS NOT NULL) THEN
		UPDATE alumne SET data_naixement=par_data WHERE codi=par_codi;
	END IF;
END //
DELIMITER ;

CALL data_naix(3,'2005/03/19');


/* Exercici DCL_23:
Crea un procediment que, donada la taula que li diem i el codi de la persona, 
calculi l'edat d'una persona a partir de la data de naixement.
Exemple d'execució: CALL edat('professor',20);*/
# Mètode 1
DELIMITER //
CREATE PROCEDURE edat(IN par_taula VARCHAR(10), IN par_codi INT)
BEGIN
DECLARE var_data_naixement DATE;
DECLARE var_edat INT;
    IF (par_taula = 'alumne') THEN
        SET var_data_naixement := (SELECT alumne.data_naixement FROM alumne WHERE alumne.codi = par_codi);
        SET var_edat := TIMESTAMPDIFF(YEAR, var_data_naixement, NOW());
        UPDATE alumne SET alumne.edat = var_edat WHERE alumne.codi = par_codi;
    ELSEIF (par_taula = 'professor') THEN
        SET var_data_naixement := (SELECT professor.data_naixement FROM professor WHERE professor.codi = par_codi);
        SET var_edat := TIMESTAMPDIFF(YEAR, var_data_naixement, NOW());
        UPDATE professor SET professor.edat = var_edat WHERE professor.codi = par_codi;
    ELSE
		SELECT 'Taula Erronea';
    END IF;
END//
DELIMITER ;

# Mètode 2 amb setencies preparades
DROP PROCEDURE edat;
DELIMITER //
CREATE PROCEDURE edat(par_taula ENUM('alumne','professor'),par_codi INT)
BEGIN
	SET @var_sentencia=
		CONCAT('UPDATE ',par_taula,' SET edat=TIMESTAMPDIFF(YEAR,data_naixement,NOW()) 
			 WHERE codi=',par_codi);
	PREPARE sentencia FROM @var_sentencia;
	EXECUTE sentencia;
	DEALLOCATE PREPARE sentencia;
END //
DELIMITER ;

CALL edat('alumne',3);

/* Exercici DCL_24:
Crea un procediment per elimini els registres de la taula alumnes que 
tenen el codi entre els dos que l'indicarem (inclosos).
Exemple d'execució: CALL elimina(20,22);*/
/*
* Solució amb BETWEEN
*/
DELIMITER //
CREATE PROCEDURE elimina (IN par_inici INT, IN par_final INT)
BEGIN
	IF (par_codi_inf IS NOT NULL AND par_codi_sup IS NOT NULL) THEN
		DELETE FROM alumne WHERE codi BETWEEN par_inici AND par_final;
	END IF;
END //
DELIMITER ;


/*
* Solució amb WHILE
*/
DELIMITER //
CREATE PROCEDURE elimina (IN par_inici INT, IN par_final INT)
BEGIN
	WHILE (par_inici <= par_final) DO
		DELETE FROM alumne WHERE codi = par_inici;
        /* 
        * SET par_inici++; MAL
        * SET par_inici+=1; MAL 
        */
        SET par_inici = par_inici + 1;
    END WHILE;
END //
DELIMITER ;


/*
* Solució amb LOOP
*/
DELIMITER //
CREATE PROCEDURE elimina (IN par_inici INT, IN par_final INT)
BEGIN
    bucle: LOOP
		IF (par_inici > par_final) THEN
			LEAVE bucle;
		END IF;
		
		DELETE FROM alumne WHERE codi = par_inici;
		
		SET par_inici=par_inici+1;
	END LOOP bucle;
END //
DELIMITER ;

CALL elimina (1,2);
/*-----------------------------------------------------------*/

# Exercici DCL_25: 
# Crea un procediment anomenat taula faci el següent: 
# 	- Si passem el paràmetre 'T', crei l'estructura de la taula diari. 
# 	- Si passem el paràmetre 'E', elimini la taula diari si existeix. 
# Exemple d'execució: CALL taula('T'); 

DELIMITER // 
CREATE PROCEDURE taula (IN opcio VARCHAR(1)) 
BEGIN 
IF (opcio='T') THEN 
    CREATE TABLE IF NOT EXISTS diari 
        (codi    INT     AUTO_INCREMENT PRIMARY KEY, 
        data    DATE, 
        hora    TIME, 
        event   VARCHAR(40) 
        )ENGINE=InnoDB; 
ELSEIF (opcio='E') THEN 
    DROP TABLE IF EXISTS diari; 
END IF; 
END// 
DELIMITER ; 

CALL taula ('T'); 


# Exercici DCL_26: 
# Crea un procediment anomenat inser que faci insercions a la taula anterior. 
# Exemple d'execució: CALL inser('2011/05/25','12:00','Reunió de direcció'); 

DELIMITER //
CREATE PROCEDURE inser (IN par_data DATE, IN par_hora TIME,IN par_event VARCHAR(40))
BEGIN
	/*INSERT INTO diari (data,hora,event) VALUES (par_data,par_hora,par_event);*/
	INSERT INTO diari VALUES (NULL,par_data,par_hora,par_event);
END //
DELIMITER ;

CALL inser('2011/05/25','12:00','Reunió de direcció');


# Exercici DCL_27: 
# Crea un procediment anomenat elim que elimini 
# tots els registres entre dues dates. Si deixem la primera data 
# en blanc esborrarà tots els registres anteriors a la segona data, 
# i si deixem la segona data en blanc esborrarà tots els registres 
# posteriors a la primera data. Sempre les dates que indiquem estan incloses. 
# Exemple d'execució: CALL elim(NULL,'2011/04/25'); 

DELIMITER //
CREATE PROCEDURE elim (IN par_inici DATE, IN par_final DATE)
BEGIN
IF (par_inici IS NOT NULL AND par_final IS NOT NULL) THEN
	DELETE FROM diari WHERE data>=par_inici AND data<=par_final;
ELSEIF (par_inici IS NULL AND par_final IS NOT NULL) THEN
	DELETE FROM diari WHERE data<=par_final;
ELSEIF (par_inici IS NOT NULL AND par_final IS NULL) THEN
	DELETE FROM diari WHERE data>=par_inici;
ELSEIF (par_inici IS NULL AND par_final IS NULL) THEN
	DELETE FROM diari;
END IF;
END //
DELIMITER ;

CALL elim (NULL,'2014-04-30');

 
# Exercici DCL_28: 
# Crea un procediment anomenat posposar que, donada una data, 
# endarrereixi l'esdeveniment un mes. 
# Exemple d'execució: CALL posposar('2011/04/25'); 

DELIMITER //
CREATE PROCEDURE posposar (IN par_data DATE)
BEGIN
	UPDATE diari SET data=ADDDATE(data,INTERVAL 1 MONTH) WHERE data=par_data;
END //
DELIMITER ;

CALL inser('2011/05/25','12:00','Reunió de direcció');
SELECT * FROM diari;
CALL posposar('2011-05-25');


# Exercici DCL_29: 
# Crea un procediment anomenat dietari que donada una 
# data ens digui i una opció ens apareguin tots els esdeveniment de: 
# 	- si l'opció és A els esdeveniments del mateix dia de la data. 
# 	- si l'opció és B els esdeveniments de la setmana a que pertany la data. 
# 	- si l'opció és C els esdeveniments del mes a que pertany la data. 
# Exemple d'execució: CALL dietari('2011/05/25','A'); 

DELIMITER //
CREATE PROCEDURE dietari (IN par_data DATE, IN par_opcio VARCHAR(1))
BEGIN
CASE par_opcio
WHEN 'A' THEN
	SELECT event FROM diari WHERE data=par_data;
WHEN 'B' THEN
	SELECT event FROM diari WHERE WEEK(data)=WEEK(par_data) 
								AND YEAR(data)=YEAR(par_data);
	-- SELECT event FROM diari WHERE YEARWEEK(data)=YEARWEEK(par_data) 
WHEN 'C' THEN
	SELECT event FROM diari WHERE MONTH(data)=MONTH(par_data) 
								AND YEAR(data)=YEAR(par_data);
END CASE;
END//
DELIMITER ;

CALL dietari('2012/06/25','B');


# Exercici DCL_30:
# Crea un procediment anomenat inser_rep que faci insercions
# a la taula diari, de manera que inserirà un esdeveniment repetit 
# cada cert temps. Els paràmetres que li donarem seran els següents:
# -Data d'inici de les insercions
# -Data final de les insercions
# -Hora de l'esdeveniment
# -Esdeveniment
# -Freqüència: D (diària), S (setmanal) i M (mensual) 
# Exemple d'execució: 
# Si volem inserir un esdeveniment que es repetirà mensualment farem:
# CALL inser_rep('2011/05/25','2012/05/25','12:00','Reunió de direcció','M'); 

DELIMITER //
CREATE PROCEDURE inser_rep(IN par_inici DATE, IN par_final DATE,
	IN par_hora TIME, IN par_event VARCHAR(40), 
	IN par_opcio ENUM('D','S','M'))
BEGIN
DECLARE var DATE DEFAULT par_inici;
WHILE (var<=par_final) DO
	INSERT INTO diari VALUES (NULL,var,par_hora,par_event);
	CASE par_opcio
	WHEN 'D' THEN
		SET var=ADDDATE(var,INTERVAL 1 DAY);
	WHEN 'S' THEN
		SET var=ADDDATE(var,INTERVAL 1 WEEK);
	WHEN 'M' THEN
		SET var=ADDDATE(var,INTERVAL 1 MONTH);
	END CASE;
END WHILE;
END //
DELIMITER ;

CALL inser_rep('2014/04/30','2015/04/30','12:00','Reunió de direcció','M'); 
/*-----------------------------------------------------------------*/
CREATE TABLE `total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DELIMITER //
CREATE PROCEDURE nums(OUT par_num INT)
BEGIN
    -- DECLARE num1 INT DEFAULT (SELECT COUNT(*) FROM alumne);
    
    SET par_num = (SELECT COUNT(*) FROM alumne);
    
    -- SELECT num1;
    SELECT par_num;
    
    -- INSERT INTO total VALUES (null, par_num, current_date());
    
    INSERT INTO total SELECT NULL, count(*), CURRENT_DATE() FROM alumne;
    
    -- SELECT * FROM total;
END //
DELIMITER ;

CALL nums(@num);

DROP PROCEDURE nums;
/*--------------------------------------------*/
CREATE DATABASE experiment;
USE experiment;

/*Exercici DCL_31:
Crea un procediment anomenat taula faci el següent:
- Si no existeix la crei.
- Si existeix ens retorni en una variable de sessió d'usuari 
el nombre de registres que té.
Exemple d'execució: CALL taula(@registres);*/
CREATE DATABASE experiment;
USE experiment;
DELIMITER //
CREATE PROCEDURE taula(OUT par_registres INT)
BEGIN
    DECLARE EXIT HANDLER FOR 1146 CREATE TABLE exp_lletra
                                    (id     INT     PRIMARY KEY AUTO_INCREMENT,
                                    lletra  ENUM('A','B','C','D','E')
                                    );
    SET par_registres=(SELECT COUNT(*) FROM exp_lletra);
END //
DELIMITER ;

CALL taula(@registres);


/*Exercici DCL_32:
Crea un procediment anomenat insercio que donat una lletra 
faci un insercio a la taula exp_lletra, assignant a la id un 
comptador i al camp lletra una lletra que li introduirem com un 
paràmetre.
Feu que si no existeix la taula executi el procediment anterior 
per crear-la. 
També fes que retorni un paràmetre amb el nombre de registres 
que hi ha a la taula.
Exemple d'execució: CALL insercio('A',@registres);*/
DROP PROCEDURE insercio;
DELIMITER //
CREATE PROCEDURE insercio(IN par_lletra ENUM('A','B','C','D','E'),
                            OUT par_resposta INT)
BEGIN
    DECLARE EXIT HANDLER FOR 1146 CALL taula(NULL);
    INSERT INTO exp_lletra VALUES (NULL,par_lletra);
    SET par_resposta=(SELECT COUNT(*) FROM exp_lletra);
END //
DELIMITER ;

CALL insercio('A',@registres);


/*Exercici 33:
Crea un procediment anomenat ninsercio que donat un nombre n, 
faci n insercions a la taula exp_lletra introduint una lletra 
aleatòria (recorda que ha de ser una lletra de la A  a la E).
Per fer la introducció fes que executi el procediment anterior.
També fes que retorni un paràmetre amb el nombre de registres 
que hi ha a la taula.
Exemple d'execució: CALL ninsercio(20,@registres);*/
DELIMITER //
CREATE PROCEDURE ninsercio(IN par_vegades SMALLINT,
                            OUT par_resposta INT)
BEGIN
    DECLARE var SMALLINT DEFAULT 0;
    WHILE (var<par_vegades) DO
        INSERT INTO exp_lletra VALUES (NULL,
                            MID('ABCDE',LOWER(RAND()*5+1),1));
        SET var=var+1;
    END WHILE;
    SET par_resposta=(SELECT COUNT(*) FROM exp_lletra);
END //
DELIMITER ; 

CALL ninsercio(20,@registres);


/*Exercici DCL_34:
Crea un procediment anomenat total de manera que introdueixi 
en una taula anomenada resultat, segons l'opció:
- Si passem el paràmetre 'C' introduirà cada lletra amb 
les vegades que apareix.
- Si passem el paràmetre 'P' introduirà cada lletra amb 
el percentatge de vegades que apareix.
Feu que si no existeix la taula resultat la crei, i si 
existeix esborri totes les dades 
abans d'introduir-les.
Exemple d'execució: CALL resultat('C');*/
SELECT lletra, COUNT(*) FROM exp_lletra GROUP BY lletra;

DELIMITER // 
CREATE PROCEDURE total (IN parametre VARCHAR(1)) 
BEGIN 
DECLARE total INT DEFAULT (SELECT COUNT(*) FROM exp_lletra);
DECLARE CONTINUE HANDLER FOR 1146 
	CREATE TABLE resultat
	(	
		lletra 	ENUM('A','B','C','D','E'),
		vegades		INT
	);  

DELETE FROM resultat;
CASE parametre
	WHEN 'C' THEN
		INSERT INTO resultat SELECT lletra, COUNT(*) FROM exp_lletra GROUP BY lletra ORDER BY lletra;
	WHEN 'P' THEN
		INSERT INTO resultat SELECT lletra, ROUND(COUNT(*)*100/total,0) FROM exp_lletra GROUP BY lletra;
	END CASE;
END// 
DELIMITER ;

CALL resultat('C');


/*Exercici DCL_35:
Crea un procediment anomenat substitueix de manera que si li passem 
dues lletres i dues posicions substitueixi la primera lletra per la 
segona entre les dues posicions. Per exemple si li passem la 'A' i la 'B' 
i les posicions 11 i 20, substituirà totes les 'A' que trobi per 'B' des 
de la posició 11 fins la 20. Tingues en compte que poden haver registres 
esborrats (per tant podria ser que el comptador no fos correlatiu).
Exemple d'execució: CALL substitueix('A','B',11,20);*/

DELIMITER //
CREATE PROCEDURE substitueix(par_lletra1 VARCHAR(1),par_lletra2 VARCHAR(2),
					par_lim1 INT, IN par_lim2 INT) 
BEGIN 
DECLARE var_primera INT;
DECLARE var_ultima INT;

SET par_lim1 = par_lim1 - 1;
-- SET var_primera = (SELECT id FROM exp_lletra LIMIT par_lim1,1);
SET var_primera = (SELECT id FROM exp_lletra LIMIT 1 OFFSET par_lim1);

SET par_lim2 = par_lim2 - 1;
-- SET var_ultima = (SELECT id FROM exp_lletra LIMIT par_lim2,1);
SET var_ultima = (SELECT id FROM exp_lletra LIMIT 1 OFFSET par_lim2);

UPDATE exp_lletra SET lletra=par_lletra2 WHERE lletra=par_lletra1 
	AND id BETWEEN var_primera AND var_ultima;

END //
DELIMITER ;

CALL substitueix('A','B',11,20);
/*------------------------------------------*/
CREATE DATABASE loteria;
USE loteria;

CREATE TABLE sorteig
(num_sorteig INT AUTO_INCREMENT PRIMARY KEY,
data DATE NOT NULL,
participants INT
)ENGINE=InnoDB;

CREATE TABLE premis
(num_sorteig INT PRIMARY KEY, 
num_premiat INT NOT NULL,
premi VARCHAR(25),
FOREIGN KEY (num_sorteig) REFERENCES sorteig (num_sorteig)
)ENGINE=InnoDB;

/* Exercici DCL_37 
Crea un procediment que crei un sorteig amb la data d'avui. 
Nosaltres només li hem d'indicar el nombre de participants. 
Fes que si ja existeix un sorteig amb la data d'avui mostri 
el missatge d'error 'El sorteig ja existeix'.
Exemple d'execució: CALL dcl_37(37,@error);*/

DELIMITER //
CREATE PROCEDURE dcl_37(IN par_participants INT, OUT par_error VARCHAR(50))
BEGIN
	-- DECLARE var_data INT DEFAULT (SELECT COUNT(*) FROM sorteig WHERE data LIKE curdate());
    DECLARE var_sorteig INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data LIKE curdate());
    -- DECLARE var_sorteig DATE DEFAULT (SELECT data FROM sorteig WHERE data LIKE curdate());
    -- IF(var_data = 0) THEN
    IF(var_sorteig IS NULL) THEN
		INSERT INTO sorteig VALUES (NULL, curdate(), par_participants);
        SET par_error = 'El sorteig s\'ha inserit correctament';
    ELSE
		SET par_error = 'El sorteig ja existeix';
    END IF;
END //
DELIMITER ;

/*Exercici DCL_38:
Crea un procediment que faci el sorteig en una data donada (el 
sorteig el farà agafant un nombre entre 1 el nombre de participants 
de la taula sorteig). Si la data no existeix fes que passi a la 
variable d'error el missatge 'No s'ha realitzat cap sorteig en aquesta data'.
Exemple d'execució: CALL dcl_38('2017/04/19',@error);*/
DROP PROCEDURE dcl_38;
DELIMITER //
CREATE PROCEDURE dcl_38(IN par_data DATE,OUT par_error VARCHAR(100))
BEGIN
	DECLARE var_num INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data LIKE par_data);
    DECLARE var_participants INT DEFAULT (SELECT participants FROM sorteig WHERE data LIKE par_data);
    -- DECLARE var_premi INT DEFAULT (SELECT COUNT(*) FROM premis WHERE nom_sorteig = var_num);
    DECLARE var_guanyador INT;
    
    DECLARE EXIT HANDLER FOR 1062  SET par_error = 'El sorteig ja s\'ha realitzat.';
    -- IF(var_num IS NOT NULL AND var_premi = 0) THEN
    IF(var_num IS NOT NULL) THEN
		SET var_guanyador = (SELECT FLOOR(RAND()*(var_participants)+1));
		INSERT INTO premis VALUES (var_num, var_guanyador, NULL);
        SET par_error = 'Sorteig realitzat correctament';
    ELSE
		-- SET par_error = 'No s\'ha realitzat cap sorteig en aquesta data o ja s\'ha registrat el guanyador';
        SET par_error = 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END//
DELIMITER ;

/*Exercici DCL_39:
Crea un procediment que assigni premi al guanyador del sorteig. Li passarem com a 
paràmetre la data del sorteig i el premi. Si la data no existeix fes que passi a 
la variable d'error el missatge 'No s'ha realitzat cap sorteig en aquesta data'. .
Exemple d'execució: CALL dcl_39('2017/04/05','Pernil',@error);*/
DELIMITER //
CREATE PROCEDURE dcl_39(IN par_data DATE, IN par_premi VARCHAR(25), OUT par_error VARCHAR(50))
BEGIN
    DECLARE var_sorteig INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data=par_data);
    DECLARE var_nombre_premis INT DEFAULT (SELECT COUNT(*) FROM premis WHERE num_sorteig=var_sorteig);
    DECLARE var_premi VARCHAR(25) DEFAULT (SELECT premi FROM premis WHERE num_sorteig=var_sorteig);
	
    IF (var_nombre_premis <> 0) THEN
		IF (var_premi IS NULL) THEN
			UPDATE premis SET premi=par_premi WHERE num_sorteig=var_sorteig;
		ELSE
			SET par_error='El guanyador ja té premi assignat';
        END IF;
    ELSE
        SET par_error='No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END//
DELIMITER ;

/*Exercici DCL_40:
Crea un procediment que donada una data torni a fer el sorteig d'aquella data i 
deixi el mateix premi si el té assignat. Si la data no existeix fes que passi a la 
variable d'error el missatge 'No s'ha realitzat cap sorteig en aquesta data'.
Exemple d'execució: CALL dcl_40('2017/04/05',@error);*/
DROP PROCEDURE dcl_40;
DELIMITER // 
CREATE PROCEDURE dcl_40(IN par_data DATE,OUT par_error VARCHAR(50))
BEGIN
	DECLARE var_participants INT DEFAULT (SELECT participants FROM sorteig WHERE data LIKE par_data);
    DECLARE var_num INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data LIKE par_data);
    DECLARE var_sorteig INT DEFAULT (SELECT COUNT(*) FROM premis WHERE num_sorteig LIKE var_num);
    DECLARE var_premiat INT DEFAULT FLOOR(var_participants*RAND()+1);
    
    IF (var_sorteig > 0) THEN
		UPDATE premis SET num_premiat = var_premiat WHERE num_sorteig = var_num;
        SET par_error := 'Sorteig realitzat novament de manera correcta';
    ELSE
		SET par_error := 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END// 
DELIMITER ;

/*Exercici DCL_41:
Crea un procediment que donada una data elimini el sorteig i el premiat. Si la 
data no existeix fes que passi a la variable d'error el missatge 
'No s'ha realitzat cap sorteig en aquesta data'.
Exemple d'execució: CALL dcl_35('2017/04/05',@error);*/
DELIMITER // 
CREATE PROCEDURE dcl_41(IN par_data DATE, OUT par_error VARCHAR(50)) 
BEGIN 
	DECLARE var_sorteig INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data=par_data);
    DECLARE var_premi INT DEFAULT (SELECT num_sorteig FROM premis WHERE num_sorteig LIKE var_sorteig);
    
    IF(var_sorteig IS NOT NULL) THEN
		IF(var_premi IS NOT NULL) THEN
			DELETE FROM premis WHERE num_sorteig = var_sorteig;
        END IF;
		DELETE FROM sorteig WHERE num_sorteig = var_sorteig;
	ELSE
		SET par_error := 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END // 
DELIMITER ;
/*---------------------------------------------------------------------------*/
/*
Modifica els exercicis 38, 39 i 40 de la pràctica 6 utilitzant cursors implícits. 
Basat en les solucions de la pràctica 6.
*/
DELIMITER //
CREATE PROCEDURE dcl_38_ci(IN par_data DATE,OUT par_error VARCHAR(100))
BEGIN
	-- DECLARE var_num INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data LIKE par_data);
    -- DECLARE var_participants INT DEFAULT (SELECT participants FROM sorteig WHERE data LIKE par_data);
    DECLARE var_sorteig INT;
    DECLARE var_participants INT;
    DECLARE var_guanyador INT;
    
    DECLARE EXIT HANDLER FOR 1062  SET par_error = 'El sorteig ja s\'ha realitzat.';
    
    SELECT num_sorteig, participants INTO var_sorteig, var_participants 
		FROM sorteig WHERE data LIKE par_data;
    
    IF(var_sorteig IS NOT NULL) THEN
		SET var_guanyador = (SELECT FLOOR(RAND()*(var_participants)+1));
		INSERT INTO premis VALUES (var_num, var_guanyador, NULL);
        SET par_error = 'Sorteig realitzat correctament';
    ELSE
        SET par_error = 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE dcl_39_ci(IN par_data DATE, IN par_premi VARCHAR(25), OUT par_error VARCHAR(50))
BEGIN
    DECLARE var_sorteig INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data=par_data);
    -- DECLARE var_nombre_premis INT DEFAULT (SELECT COUNT(*) FROM premis WHERE num_sorteig=var_sorteig);    
    -- DECLARE var_premi VARCHAR(25) DEFAULT (SELECT premi FROM premis WHERE num_sorteig=var_sorteig);
    DECLARE var_sorteig_premi INT;
    DECLARE var_premi VARCHAR(25);
    
    SELECT num_sorteig, premi INTO  var_sorteig_premi, var_premi
		FROM premis WHERE num_sorteig=var_sorteig;
	
    IF (var_sorteig_premi IS NOT NULL) THEN
		IF (var_premi IS NULL) THEN
			UPDATE premis SET premi=par_premi WHERE num_sorteig=var_sorteig;
		ELSE
			SET par_error='El guanyador ja té premi assignat';
        END IF;
    ELSE
        SET par_error='No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END//
DELIMITER ;


DELIMITER // 
CREATE PROCEDURE dcl_40_ci(IN par_data DATE,OUT par_error VARCHAR(50))
BEGIN
	-- DECLARE var_num INT DEFAULT (SELECT num_sorteig FROM sorteig WHERE data LIKE par_data);
    -- DECLARE var_participants INT DEFAULT (SELECT participants FROM sorteig WHERE data LIKE par_data);
    DECLARE var_num INT;
    DECLARE var_participants INT;
    DECLARE var_sorteig INT;
    DECLARE var_premiat INT;
    
    SELECT num_sorteig, participants INTO var_num, var_participants
		FROM sorteig WHERE data LIKE par_data;
    
    SET var_sorteig := (SELECT COUNT(*) FROM premis WHERE num_sorteig LIKE var_num);
    SET var_premiat := (FLOOR(var_participants*RAND()+1));
    
    IF (var_sorteig > 0) THEN
		UPDATE premis SET num_premiat = var_premiat WHERE num_sorteig = var_num;
        SET par_error := 'Sorteig realitzat novament de manera correcta';
    ELSE
		SET par_error := 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END// 
DELIMITER ;

/*
Exercici DCL_42:
Crea un procediment anomenat dcl42 que donades dues dates, 
calculi un guanyador per a cada data, entre les dues dates, 
si existeix a la taula sorteig i si no han sigut sortejades ja. 
En cas de no existir cap sorteig viable heu de retornar l'error 
'No s'ha realitzat cap sorteig', en cas contrari heu de retronar 
el següent missatge 'S'han realitzat X sortejos' on X és el nombre de sortejos. 
Heu d'utilitzar cursors explícits en aquest procediment.
Exemple d'execució: CALL dcl42('2020/03/02','2020/03/06',@error);
*/
DROP PROCEDURE dcl42;
DELIMITER //
CREATE PROCEDURE dcl42(IN par_data_ini DATE, IN par_data_fi DATE, OUT par_error VARCHAR(50))
BEGIN
	DECLARE final INT DEFAULT 0;
	DECLARE var_sorteig INT;
    DECLARE var_participants INT;
    DECLARE var_sorteig_premi INT;
    DECLARE var_guanyador INT;
    DECLARE var_contador INT DEFAULT 0;
    
    -- CURSOR EXPLICIT -- Un o més registres
    DECLARE miCursor CURSOR FOR 
		SELECT num_sorteig, participants FROM sorteig 
			WHERE data BETWEEN par_data_ini AND par_data_fi;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;
    
    OPEN miCursor;
    
	BUCLE: LOOP
        FETCH miCursor INTO var_sorteig, var_participants;
        IF final=1 THEN
            LEAVE BUCLE;
        END IF;
        
		SET var_sorteig_premi := (SELECT num_sorteig FROM premis WHERE num_sorteig = var_sorteig);
        IF(var_sorteig_premi IS NULL) THEN
			SET var_guanyador = (SELECT FLOOR(RAND()*(var_participants)+1));
			INSERT INTO premis VALUES (var_sorteig, var_guanyador, NULL);
            SET var_contador = var_contador + 1;
        END IF;
    END LOOP;

	IF (var_contador > 0) THEN
		SET par_error := CONCAT('S\'han realitzat ', var_contador, ' sortejos');
	ELSE
		SET par_error := 'No s\'ha realitzat cap sorteig';
	END IF;
        
    CLOSE miCursor; 
END// 
DELIMITER ;

CALL dcl42('2020/03/02','2020/03/06',@error);
CALL dcl42('2020/03/08','2020/03/10',@error);
SELECT @error;
SELECT * FROM premis;

INSERT INTO sorteig VALUES (NULL, '2020/03/01', 35);
INSERT INTO sorteig VALUES (NULL, '2020/03/02', 23);
INSERT INTO sorteig VALUES (NULL, '2020/03/03', 27);
INSERT INTO sorteig VALUES (NULL, '2020/03/04', 32);
INSERT INTO sorteig VALUES (NULL, '2020/03/05', 37);
INSERT INTO sorteig VALUES (NULL, '2020/03/06', 25);
INSERT INTO sorteig VALUES (NULL, '2020/03/07', 31);

INSERT INTO premis VALUES (3, 20, NULL);
INSERT INTO premis VALUES (5, 12, NULL);

/*
Exercici DCL_43:
Crea un procediment anomenat dcl43 que donades dues dates i un premi, 
assigni el premi a tots els sortejos, entre les dues dates, si ja tenen un guanyador. 
En cas de no existir cap sorteig viable heu de retornar el error 
'No hi ha cap sorteig amb guanyadors', en cas contrari heu de retronar 
el següent missatge 'S'han assignat X premis' on X és el nombre de premis assignats. 
Heu d'utilitzar cursors èxplicits en aquest procediment.
Exemple d'execució: CALL dcl43('2020/03/02','2020/03/06','pernil',@error);
*/
DROP PROCEDURE dcl43;
DELIMITER //
CREATE PROCEDURE dcl43(IN par_data_ini DATE, IN par_data_fi DATE, IN par_premi VARCHAR(20), OUT par_error VARCHAR(50))
BEGIN
	DECLARE final INT DEFAULT 0;
	DECLARE var_sorteig INT;
    DECLARE var_sorteig_premi INT;
    DECLARE var_premi VARCHAR(25);
    DECLARE var_contador INT DEFAULT 0;
    
    -- CURSOR EXPLICIT -- Un o més registres
    DECLARE miCursor CURSOR FOR 
		SELECT num_sorteig FROM sorteig WHERE data BETWEEN par_data_ini AND par_data_fi;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;
    
    OPEN miCursor;
    
	BUCLE: LOOP
        FETCH miCursor INTO var_sorteig;
        IF final=1 THEN
            LEAVE BUCLE;
        END IF;
        
		-- SET var_sorteig_premi := (SELECT num_sorteig FROM premis WHERE num_sorteig = var_sorteig);
        -- SET var_premi := (SELECT premi FROM premis WHERE num_sorteig = var_sorteig);
        SELECT num_sorteig, premi INTO var_sorteig_premi, var_premi FROM premis WHERE num_sorteig = var_sorteig;
        
        IF(var_sorteig_premi IS NOT NULL AND var_premi IS NULL) THEN
			UPDATE premis SET premi = par_premi WHERE num_sorteig = var_sorteig;
			SET var_contador = var_contador + 1;
        END IF;
    END LOOP;

	IF (var_contador > 0) THEN
		SET par_error := CONCAT('S\'han assignat ', var_contador, ' premis');
	ELSE
		SET par_error := 'No hi ha cap sorteig amb guanyadors';
	END IF;

    CLOSE miCursor;
END//
DELIMITER ;

CALL dcl43('2020/03/02','2020/03/06','pernil',@error);
CALL dcl43('2020/03/08','2020/03/10','pernil',@error);
SELECT @error;
SELECT * FROM premis;

UPDATE premis SET premi = 'Patinet' WHERE num_sorteig = 3;
UPDATE premis SET premi = 'Patinet' WHERE num_sorteig = 5;

-- Création de la base de données


-- Reformater un code SQL 
-- https://www.dpriver.com/pp/sqlformat.htm

-- Création de la table Emloyé 

DROP TABLE IF EXISTS 'Employe';
CREATE TABLE Employe
(
    'Employe_id'  INTEGER PRIMARY KEY AUTOINCREMENT,
    'Nom' varchar(20) DEFAULT NULL,
    'Prenom' varchar(20) DEFAULT NULL,
    'Equipe_id' varchar(20), 
    'Password' varchar(30)
);

INSERT INTO Employe (Nom,Prenom,Equipe_id,Password) VALUES ('Phillipe','Perrin',01,'Phillipe001'); 
INSERT INTO Employe (Nom,Prenom,Equipe_id,Password) VALUES ('Popov','Leonid',01,'Popov001'); 
INSERT INTO Employe (Nom,Prenom,Equipe_id,Password) VALUES ('Pontes','Marcos',01,'Popov001'); 
INSERT INTO Employe (Nom,Prenom,Equipe_id,Password) VALUES ('Pham','Tuan',02,'Pham001'); 
INSERT INTO Employe (Nom,Prenom,Equipe_id,Password) VALUES ('Thomas','Pesquet',02,'Thomas001'); 
INSERT INTO Employe (Nom,Prenom,Equipe_id,Password) VALUES ('Zhai','Zhigang',02,'Zhai001'); 

-- Création de la table Equipe 
DROP TABLE IF EXISTS 'Equipe';
CREATE TABLE Equipe
(
 'Equipe_id' INTEGER PRIMARY KEY AUTOINCREMENT,
 'Equipe_Name' varchar(20)
 
);
INSERT INTO Equipe (Equipe_Name) VALUES ('EquipeJour');
INSERT INTO Equipe (Equipe_Name) VALUES ('EquipeApresMidi');
INSERT INTO Equipe (Equipe_Name) VALUES ('EquipeNuit');
INSERT INTO Equipe (Equipe_Name) VALUES ('EquipeWeekEnd');

-- A REVOIR  
--INSERT INTO Equipe (Prepare_recette_id,launch_DATE) VALUES (01,'2007-01-01 10:00:00');
--INSERT INTO Equipe (Prepare_recette_id,launch_DATE) VALUES (01,'2022-01-01 10:00:00');



-- Création de la table prepare recette 
DROP TABLE IF EXISTS 'Prepare_recette';
CREATE TABLE Prepare_recette  
(
 'Prepare_recette_id' INTEGER PRIMARY KEY AUTOINCREMENT,
 'Equipe_id' varchar(20), 
 'Etape_Recette_id' int(8), 
 'launch_DATE' Datetime
);

INSERT INTO Prepare_recette (Equipe_id,Etape_Recette_id,launch_DATE) values (01,01,'2022-01-01 10:00:00'); 
INSERT INTO Prepare_recette (Equipe_id,Etape_Recette_id,launch_DATE) values (01,01,'2022-03-01 10:00:00'); 
INSERT INTO Prepare_recette (Equipe_id,Etape_Recette_id,launch_DATE) values (01,01,'2022-06-01 10:00:00'); 
INSERT INTO Prepare_recette (Equipe_id,Etape_Recette_id,launch_DATE) values (01,01,datetime('now')); 


-- Création de la table Etape_Recette_Produit 
DROP TABLE IF EXISTS 'Etape_Recette_Produit';
CREATE TABLE Etape_Recette_Produit  
(
 Etape_Recette_id INTEGER PRIMARY KEY AUTOINCREMENT,
 recette varchar(20), 
 Numero_Operation int(8), 
 Machine_id  int(8)
 );

--Pizza  
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('pizza',01,01); 
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('pizza',02,02); 
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('pizza',03,03); 
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('pizza',04,04); 

--Lasagne
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('Lasagne',01,01); 
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('Lasagne',02,02); 
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('Lasagne',03,03); 
INSERT INTO Etape_Recette_Produit (recette,Numero_Operation,Machine_id) values ('Lasagne',04,04); 

-- Création de la table Machine 
DROP TABLE IF EXISTS 'Machine';
CREATE TABLE Machine  
(
 Machine_id  INTEGER PRIMARY KEY AUTOINCREMENT,
 designation varchar(20) 
);

INSERT INTO Machine (designation) VALUES ('Petrin'); 
INSERT INTO Machine (designation) VALUES ('Malaxeur'); 
INSERT INTO Machine (designation) VALUES ('chambre_de_levé '); 
INSERT INTO Machine (designation) VALUES ('Four'); 

-- Création de la table Etat_Machine 
DROP TABLE IF EXISTS 'Etat_Machine';
CREATE TABLE Etat_Machine  
(
 'Etat_Machine_id'  INTEGER PRIMARY KEY AUTOINCREMENT,
 'Machine' int(10),
 'Etat_id' int(10), 
 'Date_Etat' datetime 
);


INsERT INTO Etat_Machine (Machine,Etat_id,Date_Etat) VALUES (01,01,'2021-01-01 10:00:00'); 
INSERT INTO Etat_Machine (Machine,Etat_id,Date_Etat) VALUES (01,02,'2020-01-01 10:00:00'); 
INSERT INTO Etat_Machine (Machine,Etat_id,Date_Etat) VALUES (01,03,'2019-01-01 10:00:00'); 


-- Création de la table Etat 
DROP TABLE IF EXISTS 'Etat';
CREATE TABLE Etat 
(
 Etat_id  INTEGER PRIMARY KEY AUTOINCREMENT, 
 Etat varchar(20)  
);

INSERT INTO Etat (Etat) VALUES ('MARCHE'); 
INSERT INTO Etat (Etat) VALUES ('ARRET'); 
INSERT INTO Etat (Etat) VALUES ('LAVAGE'); 
INSERT INTO Etat (Etat) VALUES ('MAINTENANCE'); 

-- Requete de test 
SELECT emp.nom,
       emp.prenom,
       Eq.equipe_name
FROM   employe AS emp
       INNER JOIN equipe AS eq
               ON eq.equipe_id = emp.equipe_id;

--Je souhaite connaitre l etat du petrin  
SELECT E_M.machine,
       E.etat
FROM   etat_machine AS E_M
       INNER JOIN etat AS E
               ON E.etat_id = E_M.etat_id; 



--la meme avec trois table  
SELECT M.designation,
	   E_M.machine,
       E.etat
FROM   etat_machine AS E_M
       INNER JOIN etat AS E
               ON E.etat_id = E_M.etat_id
       INNER JOIN Machine as M
       		   ON M.Machine_id = E_M.Machine; 

-- Ajouter un etat ( apres bouton etape suivante )
-- Quelle est la recette courante  

               
--La meme avec trois table  
	SELECT M.designation As 'Nom de la machine' ,
		   E_M.machine,
		   E.etat,
		   E_M.Date_Etat
	FROM   etat_machine AS E_M
		   INNER JOIN etat AS E
				   ON E.etat_id = E_M.etat_id
		   INNER JOIN Machine as M
				   ON M.Machine_id = E_M.Machine; 

-- INSERT le nouvelle etat de la machine 

	
INSERT OR REPLACE INTO Etat_Machine (Machine,Etat_id,Date_Etat) 
VALUES (01,01,Datetime('now'));
 



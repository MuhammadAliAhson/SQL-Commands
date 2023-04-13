CREATE DATABASE Ludodb;
use Ludodb;

--Players Table
CREATE TABLE PLayers(
email VARCHAR(30) NOT NULL UNIQUE,
FullName VARCHAR(40) NOT NULL,
Password VARCHAR(40) NOT NULL,
UserName VARCHAR(30) NOT NULL UNIQUE,
Country VARCHAR(30),
wins INT DEFAULT 0
PRIMARY KEY (userName)
);

INSERT INTO Players(email, FullName, Password,UserName,Country,wins)
VALUES 
('6@gmail.com', 'Wasif','6','Optp','Australia', 2),
('1@gmail.com', 'Ali','1','Ahson','Pakistan', 0),
 ('2@gmail.com', 'Ahmad','2','Nawab','Pakistan', 0),
 ('3@gmail.com', 'Talha','3','Malik','Pakistan', 0),
 ('4@gmail.com', 'Faiq','4','Tech','Pakistan', 0),
 ('5@gmail.com', 'Sidiq','5','Khawaja','Pakistan', 0);



--Game Table
CREATE TABLE GAME(
Game_number INT NOT NULL,
Start_date_time DATETIME NOT NULL,
End_date_time DATETIME DEFAULT NULL,
Game_Status VARCHAR(30) NOT NULL,
Mode VARCHAR(20) NOT NULL,
PRIMARY KEY(Game_number));

-- Insertion in to Game
INSERT INTO GAME(Game_number, Start_date_time, End_date_time,Game_Status,Mode)
VALUES 
(1001, '2023-03-25','2023-03-29', 'MIDWAY', 'DUAL'),
(1002, '2023-03-23', '2023-03-29', 'FINISHED', 'MULTIPLAYER'),
(1003, '2023-03-21','2023-03-25', 'FINISHED', 'DUAL'),
(1004, '2023-03-18', '2023-03-27', 'MIDWAY', 'MULTIPLAYER'),
(1005, '2023-01-05','2023-01-06', 'MIDWAY', 'MULTIPLAYER');







--Playing Table
CREATE TABLE PLAYING(
Game_number INT NOT NULL,
UserName VARCHAR(30) NOT NULL ,
PRIMARY KEY (Game_number,UserName),
FOREIGN KEY (Game_number) REFERENCES GAME(Game_number),
FOREIGN KEY (UserName) REFERENCES PLAYERS (UserName));

-- Insertion of the Playing table
INSERT INTO PLAYING(Game_number, UserName)
VALUES 
(1001,'Ahson' ),
(1002, 'Nawab'),
(1003, 'Malik'),
(1004,'Tech' ),
(1005,'Khawaja' );



--Token Table
CREATE TABLE TOKEN(
TOKEN_NO INT NOT NULL CHECK (TOKEN_NO<5),
Token_Color VARCHAR(20) CHECK (Token_Color in ('Red','Green','Blue','Yellow')),
Position INT NOT NULL CHECK (Position <53),
Playername VARCHAR(30) NOT NULL,
Game_number INT NOT NULL,
Status VARCHAR(20) NOT NULL,
FOREIGN KEY (Game_number) REFERENCES GAME(Game_number),
FOREIGN KEY (Playername) REFERENCES PLAYERS(Username),
PRIMARY KEY (Game_number,Playername,Token_no));

-- Insertion in TOKEN

INSERT INTO TOKEN(Game_number,Playername,TOKEN_NO, Token_Color,Position,Status)
VALUES
(1001,'Ahson',1,'Blue',52,'Yard' ),
(1002, 'Nawab',2,'Green',23,'In Play'),
(1003, 'Malik',3,'Red',21,'Yard'),
(1004,'Tech',4,'Yellow',31,'In Play'),
(1005,'Khawaja',2,'Red',42,'Yard' );



--Invitation Table
CREATE TABLE INVITATION(
SenderID VARCHAR(30) NOT NULL,
RecieverID VARCHAR(30) NOT NULL,
Game_number INT NOT NULL,
AcceptanceStatus VARCHAR(30) NOT NULL,
FOREIGN KEY (Game_number) REFERENCES GAME(Game_number),
FOREIGN KEY (SenderID) REFERENCES Players(Username),
FOREIGN KEY (RecieverID) REFERENCES Players(Username),
PRIMARY KEY (SenderID,RecieverID,Game_number));

-- Insertion in INVITATION
INSERT INTO INVITATION(Game_number,RecieverID,SenderID, AcceptanceStatus)
VALUES
(1001,'Ahson','Nawab','Yes' ),
(1002, 'Nawab','Tech','No'),
(1003, 'Malik','Khawaja','No'),
(1004,'Tech','Ahson','Yes'),
(1005,'Khawaja','Malik','No' );




--ScoreBoard
CREATE TABLE ScoreBoard(
Date DATE NOT NULL,
Player VARCHAR(30) NOT NULL,
Game_no INT NOT NULL,
Standing INT NOT NULL,
FOREIGN KEY (Game_no) REFERENCES GAME(Game_number),
FOREIGN KEY (Player) REFERENCES Players(Username),
PRIMARY KEY(Game_no,Player)
);


-- Insertions in ScoreBoard
INSERT INTO ScoreBoard(Game_no,Player,Date, Standing)
VALUES
(1001,'Ahson','2023-03-29',1 ),
(1002, 'Nawab','2023-03-29',2),
(1003, 'Malik','2023-03-25',3),
(1004,'Tech','2023-03-27',4),
(1005,'Khawaja','2023-01-06',5 );


--Queries
-- Q1
select count(*) as row_num,Country from PLayers group by Country ;
-- Q2
select Game_number,(End_date_time-Start_date_time) AS TIME_ from GAME; 
--Q3
-- Need to change the Format of the Time
select AVG(End_date_time) AS AVGTIME_ from GAME group by End_date_time; 
--Q4
 select UserName from PLayers    where UserName  like '%1%';




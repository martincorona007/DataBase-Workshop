CREATE DATABASE libraryT;
USE libraryT;
CREATE TABLE books(
    ID_book INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameb VARCHAR(80) NOT NULL,
    autor VARCHAR(50) NOT NULL,
    speciality VARCHAR(50) NOT NULL
);
CREATE TABLE user(
    ID_user INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    f_Name VARCHAR(50) NOT NULL,
    l_Name VARCHAR(50) NOT NULL,
    type_user VARCHAR(50) NOT NULL
);

CREATE TABLE loan(
    ID_loan INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ID_user INT NOT NULL,
    ID_book INt NOT NULL,
    dateLoan DATE NOT NULL,
    deadLine DATE NOT NULL,
    FOREIGN KEY (ID_user) REFERENCES user(ID_user),
    FOREIGN key (ID_book) REFERENCES books(ID_book)

);

CREATE TABLE newspaper(
    ID_news INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameNP VARCHAR(50) NOT NULL,
    datenews DATE NOT NULL,
    statee VARCHAR(50) NOT NULL
);
CREATE TABLE magazine(
    ID_maga INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    namema VARCHAR(50) NOT NULL,
    editionDate DATE NOT NULL,
    totalVol INT NOT NULL
);

CREATE TABLE loanhistoryT(
    ID_loanH INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ID_loan INT NOT NULL,
    ID_user INT NOT NULL,
    ID_book INt NOT NULL,
    dateLoan DATE NOT NULL,
    deadLine DATE NOT NULL   

);
INSERT INTO books values(1,"Data structures","Aguilar","Systems");
INSERT INTO books values(2,"Aprender a programar c++","Nath","Systems");
INSERT INTO books values(3,"Programando con el chavo","chespirito","Systems");
INSERT INTO books values(4,"Automatas","Luis Joyanes","Systems");
INSERT INTO books values(5,"Database","Diana Mcain","Systems");

INSERT INTO books values(6,"Circuitos Integrados","Israel Vallejo","Eletronics");
INSERT INTO books values(7,"Circuitos Distribuidos","Gilberto Sandoval","Eletronics");
INSERT INTO books values(8,"Ecuaciones diferenciales para circuitos","Mateo Silva","Eletronics");
INSERT INTO books values(9,"Sistemas digitales","Diego Mendez","Eletronics");
INSERT INTO books values(10,"Circuitos programables","Daniel Alcatar","Eletronics");

INSERT INTO books values(11,"Becoming Michelle Obama","Michelle Obama","Law");
INSERT INTO books values(12,"My Own Words","Ruth Bader Ginsburg","Law");
INSERT INTO books values(13,"La dictadura","Ramon Valdez","Law");
INSERT INTO books values(14,"La reforma energetica","Manuel Lopez","Law");
INSERT INTO books values(15,"Leyes Constitucionales","Pablo Alfonso","Law");

INSERT INTO books values(16,"Altlas de operatoria dental","Camila Florez","Odontologia");
INSERT INTO books values(17,"Odontopediatra","Silvina G","Odontologia");
INSERT INTO books values(18,"Fundamentos de Odontologia","Jannine Garcia","Odontologia");
INSERT INTO books values(19,"Urgencias Odontologicas","Chavez Lamks","Odontologia");
INSERT INTO books values(20,"Anatomia","Rob Mendez","Odontologia");

INSERT INTO books values(21,"Business Insider","Mark Buffet","Business");
INSERT INTO books values(22,"Aproach to Business","Martha Mug","Business");
INSERT INTO books values(23,"Administration","Cassandra Beg","Business");
INSERT INTO books values(24,"Parts of Business","Marie velez","Business");
INSERT INTO books values(25,"Bitcoin,Blackchain","Marie velez","Business");

INSERT INTO user values(1,"Gido","Bugarin","Ramirez","Teacher");
INSERT INTO user values(2,"Marie","Jimenez","Sanchez","Teacher");
INSERT INTO user values(3,"Gilberto","Sandoval","Sanchez","Teacher");
INSERT INTO user values(4,"Rogelio","Valadez","Aguilar","Student");
INSERT INTO user values(5,"Cynthia","Garcia","Hernandez","Student");
INSERT INTO user values(6,"Itzel","Martinez","Gonzalez","Student");
INSERT INTO user values(7,"Jocelyn","Venegas","Lopez","Teacher");
INSERT INTO user values(8,"Karen","Beltran","Sanchez","Teacher");
INSERT INTO user values(9,"David","Inigez","Lopez","Student");
INSERT INTO user values(10,"Isis","Garcia","Hernandez","Student");

INSERT INTO newspaper values(1,"El mural","2018-11-08","Jalisco");
INSERT INTO newspaper values(2,"Solo ofertas","2017-09-20","Jalisco");
INSERT INTO newspaper values(3,"El Informador","2016-01-07","Monterrey");

INSERT INTO magazine values(1,"Altonivel","2017-02-1",4);
INSERT INTO magazine values(2,"ITProfessional","2017-08-5",19);
INSERT INTO magazine values(3,"Expansion","2017-07-1",8);
                      /*  u b  */
INSERT INTO loan values(1,2,4,"2018-11-5","2018-11-7");
INSERT INTO loan values(2,6,4,"2018-11-7","2018-11-9");
INSERT INTO loan values(3,5,24,"2018-11-12","2018-11-14");
INSERT INTO loan values(4,4,24,"2018-11-16","2018-11-19");
INSERT INTO loan values(5,1,17,"2018-11-19","2018-11-21");
INSERT INTO loan values(6,2,8,"2018-11-20","2018-11-22");
INSERT INTO loan values(7,8,10,"2018-11-23","2018-11-26");
INSERT INTO loan values(8,10,14,"2018-11-27","2018-11-29");
INSERT INTO loan values(9,7,10,"2018-11-28","2018-11-30");
INSERT INTO loan values(10,5,19,"2018-11-28","2018-11-30");

/*a)*/
select ID_book,nameb,autor from books where speciality in('Systems','Eletronics');
/*b)*/
select namema,editionDate,totalVol from magazine;
/*c)*/
select name from user where type_user='Teacher';
/*d)*/
select b.nameb,b.speciality,b.ID_book from books as b join(select lo.ID_book,count(*) from loan as lo group by ID_book having count(*)>1) p on b.ID_book=p.ID_book;
/*e*/
select * from books as b join(select * from loan as lo where lo.deadLine>"2018-11-19" and lo.deadLine<"2018-11-23") lop on b.ID_book=lop.ID_book;
/*f)*/
select * from books as b join(select * from loan as lo where lo.dateLoan="2018-11-28") lop on b.ID_book=lop.ID_book;

/*Trigger*/
/*
CREATE USER 'userA'@'localhost' IDENTIFIED BY 'Corpus.1';
GRANT SELECT ON libraryT.books TO 'userA'@'localhost';
GRANT SELECT ON libraryT.user TO 'userA'@'localhost';

FLUSH PRIVILEGES;
CREATE USER 'userB'@'localhost' IDENTIFIED BY 'Corpus.2';
GRANT SELECT,INSERT ON libraryT.books TO 'userA'@'localhost';
GRANT SELECT,INSERT ON libraryT.magazine TO 'userA'@'localhost';
GRANT SELECT,INSERT ON libraryT.newspaper TO 'userA'@'localhost';
GRANT SELECT,INSERT ON libraryT.users TO 'userA'@'localhost';

FLUSH PRIVILEGES;
CREATE USER 'userC'@'localhost' IDENTIFIED BY 'Corpus.3';
GRANT SELECT,UPDATE ON libraryT.books TO 'userC'@'localhost';
GRANT SELECT,UPDATE ON libraryT.magazine TO 'userC'@'localhost';
GRANT SELECT,UPDATE ON libraryT.newspaper TO 'userC'@'localhost';
GRANT SELECT,UPDATE ON libraryT.user TO 'userC'@'localhost';
/
FLUSH PRIVILEGES;
CREATE USER 'userD'@'localhost' IDENTIFIED BY 'Courpus.4';
GRANT SELECT,DELETE ON libraryT.books TO 'userD'@'localhost';

FLUSH PRIVILEGES;
*/
CREATE TRIGGER beforeDelete AFTER DELETE ON loan 
FOR EACH ROW
INSERT INTO loanhistoryT(ID_loan,ID_user,ID_book,dateLoan,deadLine) VALUES(OLD.ID_loan,OLD.ID_user,OLD.ID_book,OLD.dateLoan,OLD.deadLine);













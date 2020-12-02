CREATE TABLE pacient(
ID_pacient INT PRIMARY KEY  AUTO_INCREMENT NOT NULL, 
name VARCHAR(50) NOT NULL,
f_name VARCHAR(50) NOT NULL,
l_name VARCHAR(50) NOT NULL,
genre VARCHAR(2) NOT NULL,
phone VARCHAR(14) NOT NULL,
e_mail VARCHAR(20) NOT NULL,
birth_day DATE NOT NULL,
zip_code VARCHAR(20) NOT NULL,
contry VARCHAR(20) NOT NULL,
estate VARCHAR(20) NOT NULL

);
CREATE TABLE doctor(
    ID_doctor INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    cedula VARCHAR(40) NOT NULL,
    address VARCHAR(100) NOT NULL,
    contry VARCHAR(10) NOT NULL,
    estate VARCHAR(10) NOT NULL,
    zip_code VARCHAR(20) NOT NULL
);
CREATE TABLE speciality(
    ID_speciality INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ID_doctor INT NOT NULL,
    name VARCHAR(15) NOT NULL,
    FOREIGN KEY (ID_doctor) REFERENCES doctor(ID_doctor)
);
CREATE TABLE services(
    ID_service INT PRIMARY KEY AUTO_INCREMENT  NOT NULL,
    ID_speciality INT NOT NULL,
    ID_pacient INT NOT NULL,
    price DECIMAL(60,2)NOT NULL,
    FOREIGN KEY(ID_speciality) REFERENCES speciality(ID_speciality),
    FOREIGN KEY(ID_pacient) REFERENCES pacient(ID_pacient)
);

CREATE TABLE medicine(
    ID_medicine INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    amount INT NOT NULL,
    medicine_type VARCHAR(50),
    contry VARCHAR(12),
    description LONGTEXT NOT NULL,
    price DECIMAL(60,2) NOT NULL

);

CREATE TABLE expenses(
    ID_expenses INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
    ID_service INT NOT NULL,
    ID_medicine INT NOT NULL,
    totalCost DECIMAL(60,2) NOT NULL,
    FOREIGN KEY (ID_service) REFERENCES services(ID_service),
    FOREIGN KEY(ID_medicine) REFERENCES medicine(ID_medicine)
);
INSERT INTO doctor values(1,"Manuel","Gonzalez","Ortga","83JS85SISL2","Av. el bajio 900","Mexico","Queretaro","34500");
INSERT INTO doctor values(2,"Sophie","Vazquez","Mota","93JK82J3723","Av. Independencia #90 INT 62 ","Mexico","Jalisco","45200");
INSERT INTO doctor values(3,"Juan","Perez","Volk","IU3NE3NDU3U4","Av. los girasoles #59 INT 45", "Mexico","Jalisco","45230");
INSERT INTO doctor values(4,"Diego","Martinez","Martinez","93IEN0934H93","Av. camino viejo a tesistan #890 INT 12","Mexico","Jalsico","45200");
INSERT INtO doctor values(5,"Rafael","Gonzalez","Gallo","JXCIJ3U783983","Av. los girasoles #59 INT 50", "Mexico","Jalisco","45230");
INSERT INTO doctor values(6,"Juan","Gutierrez","Velazquez","83JS85SISL2","Av. el bajio 900","Mexico","Tepic","34500");
INSERT INTO doctor values(7,"Lydia","Sanchez","Mota","93JK82J3723","Av. Independencia #90 INT 62 ","Mexico","Guerrero","45250");
INSERT INTO doctor values(8,"Jhon","Beng","Martinez","IU3NE3NDU3U4","Av. los girasoles #59 INT 45", "Mexico","Sinaloa","45560");
INSERT INTO doctor values(9,"Zederic","Aldama","De la A","93IEN0934H93","Av. camino viejo a tesistan #890 INT 12","Mexico","Oaxaca","4980");
INSERT INtO doctor values(10,"Carlos","Gonzalez","Garcia","JXCIJ3U783983","Av. los prados girasoles #55 INT 50", "Mexico","Mexico","7930");

INSERT INTO pacient VALUES(1,"Adrian","Escobar","Velazco","M","98564646","adrian@gmail.com","1994-09-20","45200","Mexico","Jalisco");
INSERT INTO pacient VALUES(2,"Ramon","Ramirez","Beltran","M","98564646","ramon@gmail.com","1960-06-20","45200","Mexico","Queretaro");
INSERT INTO pacient VALUES(3,"Adriana","Leiva","Guzman","M","98564646","Adriana@gmail.com","1944-01-28","45200","Mexico","Guerrero");
INSERT INTO pacient VALUES(4,"Ulises","Ramirez","Perez","M","98564646","Ulises@gmail.com","1994-07-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(5,"Sophia","Hernandez","Hernandez","M","98564646","Sophia@gmail.com","1959-09-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(6,"Raul","Escobar","Velazco","H","98564646","raul@gmail.com","1991-09-20","45200","Mexico","Jalisco");
INSERT INTO pacient VALUES(7,"Joel","Ramirez","Beltran","H","98564646","joel@gmail.com","1963-06-20","45200","Mexico","Queretaro");
INSERT INTO pacient VALUES(8,"Armando","Leiva","Guzman","H","98564646","Armando@gmail.com","1944-01-28","45200","Mexico","Guerrero");
INSERT INTO pacient VALUES(9,"Alejandro","Ramirez","Perez","H","98564646","alejandro@gmail.com","1995-07-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(10,"Sauk","Hernandez","Hernandez","H","98564646","saul@gmail.com","1956-09-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(11,"Hector","Escobar","Velazco","H","98564646","adrian@gmail.com","1997-09-20","45200","Mexico","Jalisco");
INSERT INTO pacient VALUES(12,"Sebastian","Ramirez","Beltran","H","98564646","sebastian@gmail.com","1968-06-20","45200","Mexico","Queretaro");
INSERT INTO pacient VALUES(13,"Jose","Leiva","Guzman","H","98564646","jose@gmail.com","1949-01-28","45200","Mexico","Guerrero");
INSERT INTO pacient VALUES(14,"Rocio","Ramirez","Perez","M","98564646","roci@gmail.com","1910-07-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(15,"Isis","Hernandez","Hernandez","M","98564646","isis@gmail.com","1991-09-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(16,"Fatima","Guzman","Velazco","M","98564646","fatima@gmail.com","1992-09-20","45200","Mexico","Jalisco");
INSERT INTO pacient VALUES(17,"Alejandra","Velazquez","Beltran","M","98564646","alejandra@gmail.com","1963-06-20","45200","Mexico","Queretaro");
INSERT INTO pacient VALUES(18,"Itzel","Martinez","Guzman","M","98564646","itzel@gmail.com","1944-01-28","45200","Mexico","Guerrero");
INSERT INTO pacient VALUES(19,"Mariana","Lopez","Perez","M","98564646","mariana@gmail.com","1995-07-20","45200","Mexico","Chiapas");
INSERT INTO pacient VALUES(20,"Cynthia","Garia","Garcia","M","98564646","cynthia@gmail.com","1956-09-20","45200","Mexico","Chiapas");

INSERT INTO speciality values(1,5,"Quimioterapias");
INSERT INTO speciality values(2,10,"Neorologia");
INSERT INTO speciality values(3,8,"Odontologia");
INSERT INTO speciality values(4,2,"Rayos X");
INSERT INTO speciality values(5,1,"Nutricion");
INSERT INTO speciality values(6,2,"Ginecologia");

INSERT INTO medicine VALUES(1,"Amikacina (Sulfato)",250,"Solución inyectable","Germany","Frasco vial 2 mL",485);
INSERT INTO medicine VALUES(2,"Mercaptopurina",50,"Tableta oral","Mexico","Empaque primario individual o frasco, protegido de la luz",510);
INSERT INTO medicine VALUES(3,"Mesna",100,"Solución inyectable","Mexico","Frasco vial,protegido de la luz",150);
INSERT INTO medicine VALUES(4,"Mitominc C",5,"Solución inyectable o polvo liofilizado","Mexico","Frasco vial 5 mL,protegido de la luz",800);
INSERT INTO medicine VALUES(5,"Azatioprina",50,"Tableta Oral","Mexico","Frasco vial 2 mL",100);
INSERT INTO medicine VALUES(6,"Citarabina",500,"Solución inyectable","Mexico","Frasco vial ",150);
INSERT INTO medicine VALUES(7,"Fluorouracilo",500,"Solución inyectable","Mexico","Frasco vial ",250);
INSERT INTO medicine VALUES(8,"Ceftazidima (Pentahidrato)",1,"Polvo Solución inyectable","France","Frasco vial protegido",350);
INSERT INTO medicine VALUES(9,"Ceftriaxona (Sódica)",1,"Solución inyectable","USA","Frasco vial ",950);
INSERT INTO medicine VALUES(10,"Cefotaxima (Sódica)",10,"Polvi Solución inyectable","Germany","Frasco vial ",155);

INSERT INTO services VALUES(1,3,19,500);
INSERT INTO services VALUES(2,5,8,180);
INSERT INTO services VALUES(3,4,7,199);
INSERT INTO services VALUES(4,2,6,350);
INSERT INTO services VALUES(5,1,2,480);
INSERT INTO services VALUES(6,1,10,480);
INSERT INTO services VALUES(7,6,18,580);
INSERT INTO services values(8,2,2,150);
INSERT INTO services values(9,2,2,350);

insert into expenses values(1,1,8,850);
insert into expenses values(2,2,4,980);
insert into expenses values(3,3,1,684);
insert into expenses values(4,4,10,1150);
insert into expenses values(5,5,2,990);
insert into expenses values(6,6,5,580);
insert into expenses values(7,7,9,1530);
insert into expenses values(8,8,4,950);
INSERT INTO expenses values(9,9,6,500);
/*1*/
/*
select doctor.name,doctor.f_name from doctor JOIN speciality WHERE speciality.name="Ginecologia" and doctor.ID_doctor=speciality.ID_speciality;
*/
/*2*/
                                /*|relation A wt B or all Pac thathasaservices|join other table |<compare ides table B and C                     search in specedif>|   */ /*   
select pacient.name from pacient join services ON pacient.ID_pacient=services.ID_pacient join speciality on services.ID_speciality=speciality.ID_speciality and speciality.name="Neorologia";

*/
/*CALIS
select p.name,s.ID_pacient,count(*) as NumberOfMedicines from pacient as p, services as s where p.ID_pacient=s.ID_pacient  group by ID_pacient having count(*) >1;
*/
/*3*/
/*
select p.name,m.name,m.price from services s join(SELECT ID_pacient from services group by ID_pacient having count(*)>1) b on s.ID_pacient=b.ID_pacient join pacient as p on s.ID_pacient=p.ID_pacient join expenses as e on s.ID_service=e.ID_expenses join medicine as m on e.ID_medicine=m.ID_medicine;
*/
/*4*/
/*
select p.name,sp.name from services s join(SELECT ID_pacient from services group by ID_pacient having count(*)>1) b on s.ID_pacient=b.ID_pacient join pacient as p on s.ID_pacient=p.ID_pacient JOIN speciality as sp on s.ID_speciality=sp.ID_speciality ;
*/
/*5*/
/*
select p.name,sp.name,e.totalCost from pacient as p inner join services as s on s.ID_pacient=p.ID_pacient inner join speciality as sp on s.ID_speciality=sp.ID_speciality inner join expenses as e on s.ID_service=e.ID_expenses;
*/
/*6*/
/*

select doc.name,p.name,sp.name from services s join(SELECT ID_speciality from services group by ID_speciality having count(*)>1) b on s.ID_speciality=b.ID_speciality join pacient as p on s.ID_pacient=p.ID_pacient JOIN speciality as sp on s.ID_speciality=sp.ID_speciality JOIN doctor as doc on sp.ID_doctor=doc.ID_doctor;

*/





CREATE TABLE paciente(id_paciente int PRIMARY KEY NOT NULL AUTO_INCREMENT);
CREATE TABLE datos_personales(id_datap int PRIMARY KEY NOT NULL AUTO_INCREMENT,id_pacientee int NOT NULL, nombre varchar(50) NOT NULL,genero varchar(5) NOT NULL,e_civil varchar(30) NOT NULL,e_mail varchar(40) NOT NULL,telefono varchar(12) NOT NULL, lugar_nacimiento VARCHAR(30) NOT NULL, fecha_nacimiento DATE NOT NULL,foreign key(id_pacientee)references paciente(id_paciente));
CREATE TABLE domicilio(id_dom INT PRIMARY KEY NOT NULL AUTO_INCREMENT,id_pacientee int NOT NULL,CP VARCHAR(50) NOT NULL,ciudad varchar(20) NOT NULL, pais varchar(50) NOT NULL,estado varchar(50) NOT NULL,foreign key(id_pacientee)references paciente(id_paciente));
CREATE TABLE medicamento(id_medicamento int PRIMARY KEY NOT NULL AUTO_INCREMENT,id_paciente int NOT NULL,precio DECIMAL(5,2)NOT NULL);
CREATE TABLE fabricacion(id_fabri int PRIMARY KEY NOT NULL AUTO_INCREMENT,id_medicamentoo int NOT NULL,nombre varchar(50)NOT NULL,cantidad int NOT NULL, tipo_medicina VARCHAR(50) NOT NULL,lugar_fabricacion VARCHAR(40) NOT NULL,fecha_cadocidad DATE NOT NULL,descripcion LONGTEXT NOT NULL,foreign key(id_medicamentoo)references medicamento(id_medicamento));
CREATE TABLE servicios(id_servicios int PRIMARY KEY NOT NULL AUTO_INCREMENT,id_pacientee int NOT NULL,precio DECIMAL(5,2)NOT NULL);
CREATE TABLE doctor(id_doc int PRIMARY KEY NOT NULL AUTO_INCREMENT,id_servicioss int NOT NULL,nombre VARCHAR(50) NOT NULL,cedula_n VARCHAR(50) NOT NULL,ramade_estudio VARCHAR(50) NOT NULL,foreign key(id_servicioss)references servicios(id_servicios));
CREATE TABLE diagnostico(id_diag int PRIMARY KEY NOT NULL AUTO_INCREMENT ,id_servicioss int NOT NULL,problematica LONGTEXT NOT NULL,solucion LONGTEXT NOT NULL,fecha DATETIME NOT NULL,foreign key(id_servicioss)references servicios(id_servicios));

CREATE TABLE table1(FK_id_paciente int  NOT NULL,FK_id_medicamento int NOT NULL);
ALTER TABLE table1 add constraint primary key(FK_id_paciente,FK_id_medicamento);

ALTER TABLE table1 ADD CONSTRAINT FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);
ALTER TABLE table1 ADD CONSTRAINT FOREIGN KEY(FK_id_medicamento) REFERENCES medicamento(id_medicamento);

CREATE TABLE table2(FK_id_paciente int  NOT NULL,FK_id_servicios int NOT NULL);
ALTER TABLE table2 add constraint primary key(FK_id_paciente,FK_id_servicios);

ALTER TABLE table2 ADD CONSTRAINT FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);
ALTER TABLE table2 ADD CONSTRAINT FOREIGN KEY(FK_id_servicios) REFERENCES servicios(id_servicios);

CREATE TABLE gastosTotales(id_gastos int PRIMARY KEY NOT NULL AUTO_INCREMENT);

CREATE TABLE table3(FK_id_gastos int  NOT NULL,FK_id_medicamentos int NOT NULL);
ALTER TABLE table3 add constraint primary key(FK_id_gastos,FK_id_medicamentos);

ALTER TABLE table3 ADD CONSTRAINT FOREIGN KEY(FK_id_gastos) REFERENCES gastosTotales(id_gastos);
ALTER TABLE table3 ADD CONSTRAINT FOREIGN KEY(FK_id_medicamentos) REFERENCES medicamento(id_medicamento);

CREATE TABLE table4(FK_id_gastos int  NOT NULL,FK_id_servicios int NOT NULL);
ALTER TABLE table4 add constraint primary key(FK_id_gastos,FK_id_servicios);

ALTER TABLE table4 ADD CONSTRAINT FOREIGN KEY(FK_id_gastos) REFERENCES gastosTotales(id_gastos);
ALTER TABLE table4 ADD CONSTRAINT FOREIGN KEY(FK_id_servicios) REFERENCES servicios(id_servicios);
					//	dautherg                       father
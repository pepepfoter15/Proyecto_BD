-- Maria DB: sus tablas e inserts
--Creación de tablas
CREATE TABLE aeropuerto (
  cod_aeropuerto VARCHAR(15),
  Direccion VARCHAR(50) UNIQUE NOT NULL,
  Telefono VARCHAR(14),
  Nombre_director VARCHAR(30),
  CONSTRAINT pk_aeropuerto PRIMARY KEY (cod_aeropuerto)
);

CREATE TABLE nacional (
  cod_aeropuerto VARCHAR(15),
  Num_vuelos_mensuales INT,
  Num_pasajeros_mensuales INT,
  Longitud_pista_aterrizaje DECIMAL(4,3),
  Orientacion_pista VARCHAR(30),
  CONSTRAINT pk_nacional PRIMARY KEY (cod_aeropuerto),
  CONSTRAINT fk_nacional FOREIGN KEY (cod_aeropuerto) REFERENCES aeropuerto
);

CREATE TABLE internacional(
    cod_aeropuerto VARCHAR(15),
    CONSTRAINT pk_internacional PRIMARY KEY (cod_aeropuerto),
    CONSTRAINT fk_internacional FOREIGN KEY (cod_aeropuerto) REFERENCES aeropuerto
);

CREATE TABLE tripulacion(
  cod_empleado VARCHAR(15),
  Nombre VARCHAR(80) UNIQUE NOT NULL,
  Telefono VARCHAR(14),
  Sueldo_base DECIMAL(8,2) DEFAULT 1000,
  Num_pasaporte VARCHAR(9),
  Direccion VARCHAR(30),
  Fecha_alta DATE,
  Num_horas_extra INT(2) CHECK (Num_horas_extra >= 20 AND Num_horas_extra <= 40),
  CONSTRAINT pk_tripulacion PRIMARY KEY (cod_empleado),
  CONSTRAINT mes_alta CHECK (YEAR(Fecha_alta)!= '2008'),
  CONSTRAINT numero_pasaporte CHECK (Num_pasaporte REGEXP '^[A-Z]{2}[0-9]{7}$')
);

CREATE TABLE auxiliares(
    cod_empleado VARCHAR(15),
    CONSTRAINT fk_auxiliares FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

CREATE TABLE copiloto(
    cod_empleado VARCHAR(15),
    CONSTRAINT fk_copiloto FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

CREATE TABLE piloto(
    cod_empleado VARCHAR(15),
    CONSTRAINT fk_piloto FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);


--Insert de estas tablas
--Tabla aeropuerto
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD1', 'ADOLFO SUÁREZ MADRID, BARAJAS - ESPAÑA', '957139954', 'Director Juan José');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD2', 'BARCELONA, EL PRAT J.T - ESPAÑA', '923884256', 'Director Paco');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD3', 'PALMA DE MALLORCA - ESPAÑA', '957033450', 'Director Javier');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD4', 'MALAGA, COSTA DEL SOL - ESPAÑA', '940019124', 'Director Mario');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD5', 'GRAN CANARIA - ESPAÑA', '902055341', 'Director Jose Manuel');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD6', 'ALICANTE, ELCHE MIGUEL HDEZ - ESPAÑA', '980092933', 'Director Paco');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD7', 'AEROPUERTO INTERNACIONAL DE DUBÁI - DUBÁI', '984930380', 'Director Bin Laden');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD8', 'AEROPUERTO INTERNACIONAL HEATHROW - LONDRES', '939930255', 'Director Wiston Churchill');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD9', 'AEROPUERTO INTERNACIONAL DE NARITA - TOKIO', '957930516', 'Director Hideji Tojo');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD10', 'AEROPUERTO INTERNACIONAL DE LOS ÁNGELES', '965930284', 'Director Lebron James');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD11', 'AEROPUERTO INTERNACIONAL DE SÍDNEY', '959930418', 'Director Michel Micombero');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD12', 'AEROPUERTO INTERNACIONAL DE EL DORADO (BOGOTA)', '919930683', 'Director Gustavo Pinilla');

--Tabla nacional
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD1', 10, 50, 3.500, 'Centro');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD2', 1000, 50000, 3.800, 'Norte');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD3', 10, 100000, 4.500, 'Centro-Oeste');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD4', 5000, 500, 3.300, 'Sur');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD5', 75000, -500000, 3.450, 'Centro');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD6', 10000, 50000, 3.500, 'Sur-Oeste');

--Tabla internacional
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD7');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD8');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD9');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD10');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD11');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD12');

--Tabla tripulación
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP001', 'Juan Perez', '666492406', 'AR7849633', 'Calle Mayor, Madrid',STR_TO_DATE('23-11-2005', '%d-%m-%Y'), 25);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP002', 'Carlos Gonzalez', '610682053', 'TY0892340', 'Avenida Diagonal, Barcelona', STR_TO_DATE('17-07-2009', '%d-%m-%Y'), 22);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP003', 'Ana Lopez', '699601786', 'YU3214090', 'Plaza Ayuntamiento, Valencia', STR_TO_DATE('02-12-2015', '%d-%m-%Y'), 33);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP004', 'Luisa Garcia', '696992484', 'GF0983452', 'Calle Sierpes, Sevilla', STR_TO_DATE('06-03-2013', '%d-%m-%Y'), 35);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP005', 'Javier Ruiz', '675072416', 'HJ2349756', 'Gran Vía, Bilbao', STR_TO_DATE('14-09-2010', '%d-%m-%Y'), 25);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP006', 'Marta Hernandez', '658739747', 'BN3450893', 'Calle de la Alhambra, Granada', STR_TO_DATE('18-05-2021', '%d-%m-%Y'), 32);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP007', 'David Perez', '662380297', 'AK2340822', 'Calle Trapería, Murcia', STR_TO_DATE('08-08-2017', '%d-%m-%Y'), 34);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP008', 'Eduardo Castro', '661374243', 'ZX3456083', 'Avenida Jaime III, Mallorca', STR_TO_DATE('25-02-2006', '%d-%m-%Y'), 27);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP009', 'Laura Ortiz', '617126546', 'VB3456097', 'Calle de Triana, Gran Canaria', STR_TO_DATE('20-12-2019', '%d-%m-%Y'), 38);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP010', 'Juan Ramirez', '679164115', 'EW3454350', 'Calle San Francisco, Alicante', STR_TO_DATE('12-06-2007', '%d-%m-%Y'), 39);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP011', 'Carmen Sanchez', '610995572', 'NT6459375', 'Calleja de Flores, Córdoba', STR_TO_DATE('31-10-2020', '%d-%m-%Y'), 21);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP012', 'Angel Gomez', '645960650', 'HR8945684', 'Calle de Santiago, Valladolid', STR_TO_DATE('02-01-2012', '%d-%m-%Y'), 20);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP013', 'Sofia Castro', '672458908', 'YM3045975', 'Calle Príncipe, Vigo', STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 40);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP014', 'Bruno Molina', '644384435', 'ZÑ467909', 'Calle de los Moros, Gijón', STR_TO_DATE('11-03-2018', '%d-%m-%Y'), 29);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP015', 'Adriana Diaz', '618072022', 'QD4567809', 'Calle de Castilla, Santander', STR_TO_DATE('22-12-2014', '%d-%m-%Y'), 26);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP016', 'Jose Torres', '645342341', 'RT3080234', 'Calle Real, La Coruña', STR_TO_DATE('07-06-2011', '%d-%m-%Y'), 24);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP017', 'Lucia Flores', '688068755', 'PL0273459', 'Calle de la Alhambra, Granada', STR_TO_DATE('03-09-2014', '%d-%m-%Y'), 29);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP018', 'Pablo Vazquez', '629445240', 'ND9234567', 'Calle Sierpes, Sevilla', STR_TO_DATE('30-08-2016', '%d-%m-%Y'), 28);

--Tabla auxiliares
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP001');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP004');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP006');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP008');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP010');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP011');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP013');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP016');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP018');

--Tabla piloto
INSERT INTO piloto (cod_empleado) VALUES ('EMP002');
INSERT INTO piloto (cod_empleado) VALUES ('EMP007');
INSERT INTO piloto (cod_empleado) VALUES ('EMP009');
INSERT INTO piloto (cod_empleado) VALUES ('EMP012');

--Tabla copiloto
INSERT INTO copiloto (cod_empleado) VALUES ('EMP003');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP005');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP015');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP017');


--Oracle: sus tablas e inserts
--Creación de tablas
CREATE TABLE aeropuerto(
    cod_aeropuerto VARCHAR2(15),
    Direccion VARCHAR2(60) UNIQUE,
    Telefono VARCHAR2(14),
    Nombre_director VARCHAR2(30),
    CONSTRAINT pk_aeropuerto PRIMARY KEY (cod_aeropuerto),
    CONSTRAINT direccion_nula CHECK(Direccion IS NOT NULL)
);

CREATE TABLE nacional (
    cod_aeropuerto VARCHAR2(15),
    Num_vuelos_mensuales NUMBER (6),
    Num_pasajeros_mensuales NUMBER (9),
    Longitud_pista_aterrizaje NUMBER (4,3),
    Orientacion_pista VARCHAR2(30),
    CONSTRAINT fk_nacional FOREIGN KEY (cod_aeropuerto) REFERENCES aeropuerto
);

CREATE TABLE internacional(
    cod_aeropuerto VARCHAR2(15),
    CONSTRAINT pk_internacional PRIMARY KEY (cod_aeropuerto),
    CONSTRAINT fk_internacional FOREIGN KEY (cod_aeropuerto) REFERENCES aeropuerto
);

CREATE TABLE tripulacion(
    cod_empleado VARCHAR2(15),
    Nombre VARCHAR2(80) UNIQUE, 
    Telefono VARCHAR2(14),
    Sueldo_base NUMBER(8,2) DEFAULT(1000),
    Num_pasaporte VARCHAR2(9),
    Direccion VARCHAR2(30),
    Fecha_alta DATE,
    Num_horas_extra NUMBER(2), CHECK(Num_horas_extra BETWEEN 20 AND 40),
    CONSTRAINT pk_tripulacionn PRIMARY KEY (cod_empleado),
    CONSTRAINT nombre_tripulacionn CHECK (Nombre = INITCAP(Nombre)),
    CONSTRAINT pasaportee CHECK(REGEXP_LIKE(Num_pasaporte,'^[A-Z]{2}[0-9]{7}$')),
    CONSTRAINT mes_alta CHECK (EXTRACT(YEAR FROM Fecha_alta)!= '2008') 
);

CREATE TABLE auxiliares(
    cod_empleado VARCHAR2(15),
    CONSTRAINT fk_tripulacion FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

CREATE TABLE copiloto(
    cod_empleado VARCHAR2(15),
    CONSTRAINT fk_tripulacion2 FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

CREATE TABLE piloto(
    cod_empleado VARCHAR2(15),
    CONSTRAINT fk_tripulacion3 FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

--Insert de estas tablas
--Tabla aeropuerto
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD1', 'ADOLFO SUÁREZ MADRID, BARAJAS - ESPAÑA', '957139954', 'Director Juan José');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD2', 'BARCELONA, EL PRAT J.T - ESPAÑA', '923884256', 'Director Paco');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD3', 'PALMA DE MALLORCA - ESPAÑA', '957033450', 'Director Javier');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD4', 'MALAGA, COSTA DEL SOL - ESPAÑA', '940019124', 'Director Mario');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD5', 'GRAN CANARIA - ESPAÑA', '902055341', 'Director Jose Manuel');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD6', 'ALICANTE, ELCHE MIGUEL HDEZ - ESPAÑA', '980092933', 'Director Paco');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD7', 'AEROPUERTO INTERNACIONAL DE DUBÁI - DUBÁI', '984930380', 'Director Bin Laden');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD8', 'AEROPUERTO INTERNACIONAL HEATHROW - LONDRES', '939930255', 'Director Wiston Churchill');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD9', 'AEROPUERTO INTERNACIONAL DE NARITA - TOKIO', '957930516', 'Director Hideji Tojo');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD10', 'AEROPUERTO INTERNACIONAL DE LOS ÁNGELES - LOS ÁNGELES', '965930284', 'Director Lebron James');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD11', 'AEROPUERTO INTERNACIONAL DE SÍDNEY - SÍDNEY', '959930418', 'Director Michel Micombero');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD12', 'AEROPUERTO INTERNACIONAL DE EL DORADO (BOG) - BOGOTÁ', '919930683', 'Director Gustavo Pinilla');

--Tabla nacional
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD1', 10, 50, 3.500, 'Centro');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD2', 1000, 50000, 3.800, 'Norte');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD3', 10, 100000, 4.500, 'Centro-Oeste');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD4', 5000, 500, 3.300, 'Sur');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD5', 75000, -500000, 3.450, 'Centro');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD6', 10000, 50000, 3.500, 'Sur-Oeste');

--Tabla internacional
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD7');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD8');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD9');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD10');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD11');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD12');

--Tabla tripulación
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP001', 'Juan Perez', '666492406', 'AR7849633', 'Calle Mayor, Madrid', TO_DATE('23-11-2005', 'DD-MM-YYYY'), 25);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP002', 'Carlos Gonzalez', '610682053', 'TY0892340', 'Avenida Diagonal, Barcelona', TO_DATE('17-07-2009', 'DD-MM-YYYY'), 22);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP003', 'Ana Lopez', '699601786', 'YU3214090', 'Plaza Ayuntamiento, Valencia', TO_DATE('02-12-2015', 'DD-MM-YYYY'), 33);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP004', 'Luisa Garcia', '696992484', 'GF0983452', 'Calle Sierpes, Sevilla', TO_DATE('06-03-2013', 'DD-MM-YYYY'), 35);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP005', 'Javier Ruiz', '675072416', 'HJ2349756', 'Gran Vía, Bilbao', TO_DATE('14-09-2010', 'DD-MM-YYYY'), 25);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP006', 'Marta Hernandez', '658739747', 'BN3450893', 'Calle de la Alhambra, Granada', TO_DATE('18-05-2021', 'DD-MM-YYYY'), 32);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP007', 'David Perez', '662380297', 'AK2340822', 'Calle Trapería, Murcia', TO_DATE('08-08-2017', 'DD-MM-YYYY'), 34);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP008', 'Eduardo Castro', '661374243', 'ZX3456083', 'Avenida Jaime III, Mallorca', TO_DATE('25-02-2006', 'DD-MM-YYYY'), 27);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP009', 'Laura Ortiz', '617126546', 'VB3456097', 'Calle de Triana, Gran Canaria', TO_DATE('20-12-2019', 'DD-MM-YYYY'), 38);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP010', 'Juan Ramirez', '679164115', 'EW3454350', 'Calle San Francisco, Alicante', TO_DATE('12-06-2007', 'DD-MM-YYYY'), 39);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP011', 'Carmen Sanchez', '610995572', 'NT6459375', 'Calleja de Flores, Córdoba', TO_DATE('31-10-2020', 'DD-MM-YYYY'), 21);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP012', 'Angel Gomez', '645960650', 'HR8945684', 'Calle de Santiago, Valladolid', TO_DATE('02-01-2012', 'DD-MM-YYYY'), 20);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP013', 'Sofia Castro', '672458908', 'YM3045975', 'Calle Príncipe, Vigo', TO_DATE('29-04-2016', 'DD-MM-YYYY'), 40);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP014', 'Bruno Molina', '644384435', 'ZÑ467909', 'Calle de los Moros, Gijón', TO_DATE('11-03-2018', 'DD-MM-YYYY'), 29);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP015', 'Adriana Diaz', '618072022', 'QD4567809', 'Calle de Castilla, Santander', TO_DATE('22-12-2014', 'DD-MM-YYYY'), 26);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP016', 'Jose Torres', '645342341', 'RT3080234', 'Calle Real, La Coruña', TO_DATE('07-06-2011', 'DD-MM-YYYY'), 24);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP017', 'Lucia Flores', '688068755', 'PL0273459', 'Calle de la Alhambra, Granada', TO_DATE('03-09-2014', 'DD-MM-YYYY'), 29);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP018', 'Pablo Vazquez', '629445240', 'ND9234567', 'Calle Sierpes, Sevilla', TO_DATE('30-08-2016', 'DD-MM-YYYY'), 28);

--Tabla auxiliares
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP001');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP004');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP006');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP008');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP010');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP011');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP013');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP016');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP018');

--Tabla piloto
INSERT INTO piloto (cod_empleado) VALUES ('EMP002');
INSERT INTO piloto (cod_empleado) VALUES ('EMP007');
INSERT INTO piloto (cod_empleado) VALUES ('EMP009');
INSERT INTO piloto (cod_empleado) VALUES ('EMP012');

--Tabla copiloto
INSERT INTO copiloto (cod_empleado) VALUES ('EMP003');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP005');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP015');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP017');


--Postegreadb: sus tablas e inserts
--Creación de tablas
CREATE TABLE aeropuerto(
   cod_aeropuerto VARCHAR(15),
   Direccion VARCHAR(50) UNIQUE,
   Telefono VARCHAR(14),
   Nombre_director VARCHAR(30),
   CONSTRAINT pk_aeropuerto PRIMARY KEY (cod_aeropuerto),
   CONSTRAINT direccion_nula CHECK(Direccion IS NOT NULL)
);

CREATE TABLE nacional (
    cod_aeropuerto VARCHAR(15),
    Num_vuelos_mensuales INT,
    Num_pasajeros_mensuales INT,
    Longitud_pista_aterrizaje NUMERIC(4,3),
    Orientacion_pista VARCHAR(30),
    CONSTRAINT pk_nacional PRIMARY KEY (cod_aeropuerto),
    CONSTRAINT fk_nacional FOREIGN KEY (cod_aeropuerto) REFERENCES aeropuerto
);

CREATE TABLE internacional(
    cod_aeropuerto VARCHAR(15),
    CONSTRAINT pk_internacional PRIMARY KEY (cod_aeropuerto),
    CONSTRAINT fk_internacional FOREIGN KEY (cod_aeropuerto) REFERENCES aeropuerto
);

CREATE TABLE tripulacion(
    cod_empleado VARCHAR(15),
    Nombre VARCHAR(80) UNIQUE,
    Telefono VARCHAR(14),
    Sueldo_base NUMERIC(7,2) DEFAULT(1000),
    Num_pasaporte VARCHAR(9),
    Direccion VARCHAR(30),
    Fecha_alta DATE,
    Num_horas_extra INTEGER CHECK(Num_horas_extra BETWEEN 20 AND 40),
    CONSTRAINT pk_tripulacion PRIMARY KEY (cod_empleado),
    CONSTRAINT nombre_tripulacion CHECK (Nombre = initcap(Nombre)),
    CONSTRAINT numero_pasaporte CHECK (Num_pasaporte ~ '^[A-Z]{2}[0-9]{7}$'),
    CONSTRAINT mes_fecha_alta CHECK (EXTRACT(YEAR FROM Fecha_alta)!= '2008')
);

CREATE TABLE auxiliares(
    cod_empleado VARCHAR(15),
    CONSTRAINT fk_tripulacion FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

CREATE TABLE copiloto(
    cod_empleado VARCHAR(15),
    CONSTRAINT fk_tripulacion2 FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

CREATE TABLE piloto(
    cod_empleado VARCHAR(15),
    CONSTRAINT fk_tripulacion3 FOREIGN KEY (cod_empleado) REFERENCES tripulacion
);

--Insert de estas tablas
--Tabla aeropuerto
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD1', 'ADOLFO SUÁREZ MADRID, BARAJAS - ESPAÑA', '957139954', 'Director Juan José');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD2', 'BARCELONA, EL PRAT J.T - ESPAÑA', '923884256', 'Director Paco');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD3', 'PALMA DE MALLORCA - ESPAÑA', '957033450', 'Director Javier');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD4', 'MALAGA, COSTA DEL SOL - ESPAÑA', '940019124', 'Director Mario');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD5', 'GRAN CANARIA - ESPAÑA', '902055341', 'Director Jose Manuel');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD6', 'ALICANTE, ELCHE MIGUEL HDEZ - ESPAÑA', '980092933', 'Director Paco');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD7', 'AEROPUERTO INTERNACIONAL DE DUBÁI - DUBÁI', '984930380', 'Director Bin Laden');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD8', 'AEROPUERTO INTERNACIONAL HEATHROW - LONDRES', '939930255', 'Director Wiston Churchill');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD9', 'AEROPUERTO INTERNACIONAL DE NARITA - TOKIO', '957930516', 'Director Hideji Tojo');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD10', 'AEROPUERTO INTERNACIONAL DE LOS ÁNGELES', '965930284', 'Director Lebron James');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD11', 'AEROPUERTO INTERNACIONAL DE SÍDNEY', '959930418', 'Director Michel Micombero');
INSERT INTO aeropuerto (cod_aeropuerto, Direccion, Telefono, Nombre_director) VALUES ('COD12', 'AEROPUERTO INTERNACIONAL DE EL DORADO (BOGOTA)', '919930683', 'Director Gustavo Pinilla');

--Tabla nacional
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD1', 10, 50, 3.500, 'Centro');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD2', 1000, 50000, 3.800, 'Norte');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD3', 10, 100000, 4.500, 'Centro-Oeste');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD4', 5000, 500, 3.300, 'Sur');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD5', 75000, -500000, 3.450, 'Centro');
INSERT INTO nacional (cod_aeropuerto, Num_vuelos_mensuales, Num_pasajeros_mensuales, Longitud_pista_aterrizaje, Orientacion_pista) VALUES ('COD6', 10000, 50000, 3.500, 'Sur-Oeste');

--Tabla internacional
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD7');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD8');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD9');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD10');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD11');
INSERT INTO internacional (cod_aeropuerto) VALUES ('COD12');

--Tabla tripulación
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP001', 'Juan Perez', '666492406', 'AR7849633', 'Calle Mayor, Madrid', TO_DATE('23-11-2005', 'DD-MM-YYYY'), 25);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP002', 'Carlos Gonzalez', '610682053', 'TY0892340', 'Avenida Diagonal, Barcelona', TO_DATE('17-07-2009', 'DD-MM-YYYY'), 22);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP003', 'Ana Lopez', '699601786', 'YU3214090', 'Plaza Ayuntamiento, Valencia', TO_DATE('02-12-2015', 'DD-MM-YYYY'), 33);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP004', 'Luisa Garcia', '696992484', 'GF0983452', 'Calle Sierpes, Sevilla', TO_DATE('06-03-2013', 'DD-MM-YYYY'), 35);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP005', 'Javier Ruiz', '675072416', 'HJ2349756', 'Gran Vía, Bilbao', TO_DATE('14-09-2010', 'DD-MM-YYYY'), 25);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP006', 'Marta Hernandez', '658739747', 'BN3450893', 'Calle de la Alhambra, Granada', TO_DATE('18-05-2021', 'DD-MM-YYYY'), 32);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP007', 'David Perez', '662380297', 'AK2340822', 'Calle Trapería, Murcia', TO_DATE('08-08-2017', 'DD-MM-YYYY'), 34);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP008', 'Eduardo Castro', '661374243', 'ZX3456083', 'Avenida Jaime III, Mallorca', TO_DATE('25-02-2006', 'DD-MM-YYYY'), 27);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP009', 'Laura Ortiz', '617126546', 'VB3456097', 'Calle de Triana, Gran Canaria', TO_DATE('20-12-2019', 'DD-MM-YYYY'), 38);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP010', 'Juan Ramirez', '679164115', 'EW3454350', 'Calle San Francisco, Alicante', TO_DATE('12-06-2007', 'DD-MM-YYYY'), 39);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP011', 'Carmen Sanchez', '610995572', 'NT6459375', 'Calleja de Flores, Córdoba', TO_DATE('31-10-2020', 'DD-MM-YYYY'), 21);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP012', 'Angel Gomez', '645960650', 'HR8945684', 'Calle de Santiago, Valladolid', TO_DATE('02-01-2012', 'DD-MM-YYYY'), 20);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP013', 'Sofia Castro', '672458908', 'YM3045975', 'Calle Príncipe, Vigo', TO_DATE('29-04-2016', 'DD-MM-YYYY'), 40);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP014', 'Bruno Molina', '644384435', 'ZÑ467909', 'Calle de los Moros, Gijón', TO_DATE('11-03-2018', 'DD-MM-YYYY'), 29);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP015', 'Adriana Diaz', '618072022', 'QD4567809', 'Calle de Castilla, Santander', TO_DATE('22-12-2014', 'DD-MM-YYYY'), 26);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP016', 'Jose Torres', '645342341', 'RT3080234', 'Calle Real, La Coruña', TO_DATE('07-06-2011', 'DD-MM-YYYY'), 24);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP017', 'Lucia Flores', '688068755', 'PL0273459', 'Calle de la Alhambra, Granada', TO_DATE('03-09-2014', 'DD-MM-YYYY'), 29);
INSERT INTO tripulacion (cod_empleado, Nombre, Telefono, Num_pasaporte, Direccion, Fecha_alta, Num_horas_extra) VALUES ('EMP018', 'Pablo Vazquez', '629445240', 'ND9234567', 'Calle Sierpes, Sevilla', TO_DATE('30-08-2016', 'DD-MM-YYYY'), 28);

--Tabla auxiliares
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP001');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP004');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP006');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP008');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP010');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP011');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP013');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP016');
INSERT INTO auxiliares (cod_empleado) VALUES ('EMP018');

--Tabla piloto
INSERT INTO piloto (cod_empleado) VALUES ('EMP002');
INSERT INTO piloto (cod_empleado) VALUES ('EMP007');
INSERT INTO piloto (cod_empleado) VALUES ('EMP009');
INSERT INTO piloto (cod_empleado) VALUES ('EMP012');

--Tabla copiloto
INSERT INTO copiloto (cod_empleado) VALUES ('EMP003');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP005');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP015');
INSERT INTO copiloto (cod_empleado) VALUES ('EMP017');

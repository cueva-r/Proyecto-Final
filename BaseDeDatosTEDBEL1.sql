CREATE DATABASE tedbel;

USE tedbel;

CREATE TABLE mascota (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20) not null,
  especie VARCHAR(20) not null,
  raza VARCHAR(20) not null,
  edad int(9) not null
);

CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20) not null,
  apellido VARCHAR(20) not null,
  correo VARCHAR(20) not null,
  contrasena VARCHAR(20) not null,
  dni int(8) not null,
  telefono int(9) not null
);

CREATE TABLE secretaria(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) not null,
    apellido VARCHAR(20) not null,
    telefono INT(9) not null
);

CREATE TABLE medicoVeterinario (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20),
	apellido VARCHAR(20),
    telefono int(9) not null
);

create table empleado(
	id int auto_increment primary key,
    idVeterinario int,
    idSecretaria int,
    correo varchar (50),
    pass varchar (50) ,
    foreign key (idVeterinario) references medicoVeterinario(id)
    ON UPDATE SET NULL
	ON DELETE SET NULL,
    foreign key (idSecretaria) references secretaria(id)
    ON UPDATE SET NULL
	ON DELETE SET NULL
);


create table productos(
	id_producto int primary key auto_increment,
	nombre varchar(255) not null,
	img_producto varchar(255) not null,
	id_categoria int not null,
	precio float not null,
	stock int not null
);

DELIMITER //
	CREATE PROCEDURE selectProductos()
	BEGIN
		SELECT * FROM productos;
	END	
//

DELIMITER //
	CREATE PROCEDURE selectProducto(
		IN _id_producto int
	)
	BEGIN
		SELECT * FROM productos WHERE id_producto = _id_producto;
	END	
//

insert into productos(nombre, img_producto, id_categoria, precio, stock) values('VETLIFE RENAL', 'imagenes/comida1.png', 1, 50.54, 25); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CANBO CACHORRO', 'imagenes/comida2.png', 1, 120.50, 5);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CATLICIOUS', 'imagenes/comida3.png', 1, 12.90, 10); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CANBO ENLATADO', 'imagenes/comida4.png', 1, 15.20, 12);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('SUPLEMENTO OMEGAPEL', 'imagenes/comida5.png', 1, 25.0, 10); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CANBO ESTERILIZADOS', 'imagenes/comida6.png', 1, 95.20, 8);

insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CLAMOVET 250mg', 'imagenes/medicamento1.png', 3, 30.00, 5); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('PREDNOVET 20mg', 'imagenes/medicamento2.png', 3, 22.80, 12);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('GASTROPET 10mg', 'imagenes/medicamento3.png', 3, 15.50, 19); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('TOLTRAVET PLUS 25mg', 'imagenes/medicamento4.png', 3, 25.00, 25);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('LABYDERM 4ml', 'imagenes/medicamento5.png', 3, 60.00, 15); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('KETOVET 10mg', 'imagenes/medicamento6.png', 3, 42.00, 17);


insert into productos(nombre, img_producto, id_categoria, precio, stock) values('POLO SELECCION PERUANA', 'imagenes/ropa1.png', 4, 60.00, 12); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('POLO PLAYERO', 'imagenes/ropa2.png', 4, 45.00, 11);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CHALECO CARNERITO', 'imagenes/ropa3.png', 4, 55.00, 9); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('VESTIDO POLAR', 'imagenes/ropa4.png', 4, 42.00, 6);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('PAÑAL MACHO AZUL', 'imagenes/ropa5.png', 25, 60.00, 15); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CHALECO VERDE', 'imagenes/ropa6.png', 4, 35.00, 10);


insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CEPILLO REMOVEDOR', 'imagenes/accesorio1.png', 2, 76.00, 15); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('GUANTE SACA PELO', 'imagenes/accesorio2.png', 2, 25.00, 6);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('MULTICOMEDERO', 'imagenes/accesorio3.png', 2, 50.00, 16); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('FUENTE DE AGUA', 'imagenes/accesorio5.png', 2, 160.00, 11); 
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CAT IT FILTRO', 'imagenes/accesorio6.png', 2, 38.00, 15);
insert into productos(nombre, img_producto, id_categoria, precio, stock) values('CORTA UÑAS', 'imagenes/accesorio4.png', 2, 25.00, 9);


CREATE TABLE servicio (
  id INT AUTO_INCREMENT PRIMARY KEY,
  precio float(10) not null,
  nombre varchar(120) not null,
  idMascota int(9),
  id_cliente INT,
  foreign key (idMascota) references mascota (id)
  ON UPDATE SET NULL
  ON DELETE SET NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id)
  ON UPDATE SET NULL
  ON DELETE SET NULL
);


CREATE TABLE venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  id_productos int,
  fecha date,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id)
  ON UPDATE SET NULL
  ON DELETE SET NULL,
  FOREIGN KEY (id_productos) REFERENCES productos(id_producto)
  ON UPDATE SET NULL
  ON DELETE SET NULL
);

create table detalle_comprobante(
	id int auto_increment primary key,
    ruc int not null, 
    direccion varchar(20) not null,
    fecha date,
    nombre varchar(20) not null,
    servicios varchar(30) not null,
    articulos varchar(30) not null,
    total float(10)
);

CREATE TABLE comprobante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_venta int(30),
  id_servicio int(10),
  fecha date,
  foreign key (id_venta) references venta(id)
  ON UPDATE SET NULL
  ON DELETE SET NULL,
  foreign key (id_servicio) references servicio(id)
  ON UPDATE SET NULL
  ON DELETE SET NULL
);


  create table rescatista(
	id int auto_increment primary key,
    nombre varchar(20) not null,
    apellidos varchar(20) not null,
    correo varchar(20) not null,
    telefono int(9) not null
);

CREATE TABLE animal (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20),
  especie VARCHAR(20),
  raza VARCHAR(20),
  edadAprox int(20),
  image varchar(200)
);

create table registro_rescate(
	id int auto_increment primary key,
    idRescatista int,
    idAnimal int,
    fecha date,
    estado varchar(20) not null,
    peso float(12) not null,
    lugar varchar(30) not null,
    descripcion varchar(30) not null,
    foreign key (idRescatista) references rescatista(id)
    ON UPDATE SET NULL
	ON DELETE SET NULL,
    foreign key (idAnimal) references animal(id)
    ON UPDATE SET NULL
	ON DELETE SET NULL
);


create table registro_adoptante(
	id_adop int auto_increment primary key,
    doc_adop int not null,
    ape_adop varchar(30) not null,
    nom_adop varchar(30) not null,
    edad_adop int (2) not null,
    trab_adop varchar(50) not null,
    cel_adop int(9) not null,
    est_adop varchar(20) not null,
    nac_adop varchar(100) not null,
    dir_adop varchar(100) not null,
    corr_adop varchar(100) not null,
    pre1_adop varchar(100) not null,
    pre2_adop varchar(100) not null,
    pre3_adop varchar(100) not null,
    pre4_adop varchar(100) not null,
    pre5_adop varchar(100) not null,
    id int,
    FOREIGN KEY (id) REFERENCES animal(id)
    ON UPDATE SET NULL
	ON DELETE SET NULL
);

create table solicitar_rescate(
	id int auto_increment primary key,
    dni int not null,
    apellido varchar(30) not null,
    nombres varchar(30) not null,
    edad int (2) not null,
    estado varchar(20) not null,
    animal varchar(20) not null,
    celular int(9) not null,
    direccion varchar(100) not null,
    correo varchar(100) not null
);

create table aprobar_adopcion(
	id int auto_increment primary key,
	id_ani int,
    id_adop int,
    FOREIGN KEY (id_ani) REFERENCES animal(id)
	ON UPDATE SET NULL
	ON DELETE SET NULL,
    FOREIGN KEY (id_adop) REFERENCES registro_adoptante(id_adop)
	ON UPDATE SET NULL
	ON DELETE SET NULL
);




INSERT INTO cliente VALUES(null,'Pedro','Perez Gonsales','PedroP@gmail.com','123','98765432','987063195');
INSERT INTO cliente VALUES(null,'Marco','Huaman Guimac','Marco@gmail.com','12345','98765213','987213195');
INSERT INTO cliente VALUES(null,'Juan','lorenso moreano','Juan@gmail.com','1234','28756924','990582931');
INSERT INTO cliente VALUES(null,'luis','Pachas Lorenzo','luis@gmail.com','123456','98761432','987063191');
INSERT INTO cliente VALUES(null,'aaron','lamas miranda','aaron@gmail.com','12345678','18765213','98722395');
INSERT INTO cliente VALUES(null,'katia','gonsales Gutierres','katia@gmail.com','2234','28256924','920582931');
INSERT INTO cliente VALUES(null,'camila','moreano fernandes','camila@gmail.com','223445','28226924','922582931');
INSERT INTO cliente VALUES(null,'maria','hernandes solano','maria@gmail.com','22324','28212924','920582922');
INSERT INTO cliente VALUES(null,'ana','quispe huaman','ana@gmail.com','22344','28256324','920522931');

INSERT INTO animal VALUES(null,'Desconocido','Perro','Labrador','3','imagenes/perro1.png');
INSERT INTO animal VALUES(null,'Desconocido','Perro','Huski','1','imagenes/perro2.png');
INSERT INTO animal VALUES(null,'Desconocido','Perro','Beagle','2','imagenes/perro3.png');
INSERT INTO animal VALUES(null,'Desconocido','Perro','Pastor','3','imagenes/perro4.png');
INSERT INTO animal VALUES(null,'Desconocido','Perro','Labrador','1','imagenes/perro5.png');
INSERT INTO animal VALUES(null,'Desconocido','Gato','Desconodido','1','imagenes/gato1.png');
INSERT INTO animal VALUES(null,'Kero','Gato','Desconodido','1','imagenes/gato2.png');
INSERT INTO animal VALUES(null,'Kira','Gato','Desconodido','2','imagenes/gato3.png');


INSERT INTO mascota VALUES(null,'Boby','Perro','Cocker','2');
INSERT INTO mascota VALUES(null,'Clarita','Perro','Huski','4');
INSERT INTO mascota VALUES(null,'Bronco','Perro','Beagle','8');
INSERT INTO mascota VALUES(null,'Sasha','Perro','Pastor','3');
INSERT INTO mascota VALUES(null,'Mori','Perro','Labrador','7');
INSERT INTO mascota VALUES(null,'Guts','Perro','Cocker','6');
INSERT INTO mascota VALUES(null,'Boy','Perro','Huski','4');
INSERT INTO mascota VALUES(null,'Tuko','Perro','Beagle','5');



INSERT INTO secretaria VALUES(null,'Estefany','Chavez','956239712');

INSERT INTO medicoVeterinario VALUES(null,'Carlos','Rodriguez','993668757');

INSERT INTO empleado VALUES(null,'1','1','juanC@gmail.com','987');
INSERT INTO empleado VALUES(null,'1','1','LuciaM@gmail.com','123');



INSERT INTO servicio VALUES(null,'120.5','Baño medico','1','1');
INSERT INTO servicio VALUES(null,'15.00','Corte Pelo /El Continental','2','2');
INSERT INTO servicio VALUES(null,'25.00','Corte de Pelo/Country','3','3');
INSERT INTO servicio VALUES(null,'300.00','Cirugias/Esterilizacion','4','4');
INSERT INTO servicio VALUES(null,'10.50','Baños/Acupuntura','5','5');
INSERT INTO servicio VALUES(null,'500.00','Fiestas/Cumpleaños','6','6');
INSERT INTO servicio VALUES(null,'400.00','Cirugia/Castracion','7','7');
INSERT INTO servicio VALUES(null,'16.50','Corte de Pelo/Corte Pequiñes','8','8');

INSERT INTO rescatista VALUES(null,'Jorge','Gutierres Sanches','Jorge@Gmail.com','123456789');
INSERT INTO rescatista VALUES(null,'Katia','Maza Maruchis','Katia@Gmail.com','123126789');
INSERT INTO rescatista VALUES(null,'Aaron','Lamas Miranda','aaron@Gmail.com','213456789');
INSERT INTO rescatista VALUES(null,'Rodrigo','Mazabel Arana','Rodrigo@Gmail.com','123412789');


INSERT INTO detalle_comprobante VALUES(null,'11112','lima norte','2023-02-12','marco','none','CHALECO CARNERITO','55.00');
INSERT INTO detalle_comprobante VALUES(null,'11113','lima sur','2023-02-14','none','none','PAÑAL MACHO AZUL','60.00');
INSERT INTO detalle_comprobante VALUES(null,'11114','lima norte','2023-02-15','aaron','none','POLO PLAYERO','45.00');
INSERT INTO detalle_comprobante VALUES(null,'11115','lima sur','2023-02-16','jorge','none','MULTICOMEDERO','50.00');
INSERT INTO detalle_comprobante VALUES(null,'11116','lima norte','2023-02-17','katia','none','CEPILLO REMOVEDOR','76.00');

UPDATE `tedbel`.`animal` SET `image` = 'https://www.purina.es/sites/default/files/styles/ttt_image_510/public/2021-02/BREED%20Hero%20Mobile_0040_retriever_labrador.jpg?itok=NvwfmeXF' WHERE (`id` = '1');
UPDATE `tedbel`.`animal` SET `image` = 'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=2000' WHERE (`id` = '6');
UPDATE `tedbel`.`animal` SET `image` = 'https://s1.eestatic.com/2020/05/18/como/gatos-mascotas-trucos_490961518_152142875_1706x960.jpg' WHERE (`id` = '7');
UPDATE `tedbel`.`animal` SET `image` = 'https://images.hola.com/imagenes/mascotas/20221130221948/datos-curiosos-sobre-gatos-dn/1-171-637/datos-curiosidades-gatos-t.jpg' WHERE (`id` = '8');
UPDATE `tedbel`.`animal` SET `image` = 'https://st.depositphotos.com/1010597/1258/i/600/depositphotos_12587570-stock-photo-crossbreed-huskey-malamut-in-a.jpg' WHERE (`id` = '2');
UPDATE `tedbel`.`animal` SET `image` = 'https://www.purina.es/sites/default/files/2021-02/BREED%20Hero_0009_beagle_0.jpg' WHERE (`id` = '3');
UPDATE `tedbel`.`animal` SET `image` = 'https://soyunperro.com/wp-content/uploads/2019/08/perro-de-pastoreo.jpg' WHERE (`id` = '4');
UPDATE `tedbel`.`animal` SET `image` = 'https://www.pethouse.com.pe/wp-content/uploads/2021/03/LABRADOR-RETRIEVER.png' WHERE (`id` = '5');


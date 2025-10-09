use PedidosAhora;

insert into Horario (dia_de_semana, hora_entrada, hora_salida) values
('LUNES', '09:00:00', '12:00:00'),
('MARTES', '09:00:00', '12:00:00'),
('MIERCOLES', '09:00:00', '12:00:00'),
('JUEVES', '09:00:00', '12:00:00'),
('VIERNES', '09:00:00', '12:00:00'),
('SABADO', '09:00:00', '12:00:00'),
('DOMINGO', '09:00:00', '12:00:00');

insert into MedioDeTransporte (tipo) values
('AUTO'),
('MOTO'),
('PATA'),
('BICICLETA'),
('COLECTIVO');

insert into Repartidor (nombre, apellido, id_transporte) values
('Juan', 'Tevez', 6),
('Kiara', 'Tabarez', 8),
('Tomás', 'Mateoson', 7),
('John', 'Hope', 8);


insert into HorarioXRepartidor (id_horario, id_repartidor) values
(22, 2),
(24, 3),
(25, 4),
(28, 1);

insert into CategoriaComercio (categoria) values
('Rotiseria'),
('Repostería'),
('Universidad'),
('Carnicería');

CREATE TABLE Comercio (
    id_comercio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_baja TIMESTAMP DEFAULT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES CategoriaComercio (id_categoria),
    CHECK (telefono REGEXP '^[0-9]{7,20}$')
);

insert into Comercio (direccion,nombre,telefono, id_categoria) values
('barrufaldi 2255','Universidad','3764589476',3),
('COCOMAROLA 285','HADAS','3764589476',2),
('Quaranta 551','RotiManu','3764785129',1),
('Lavalle 245','U','376498756',4);
select * from Comercio;


select * from CategoriaComercio;
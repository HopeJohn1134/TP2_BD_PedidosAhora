use PedidosAhora;

insert into Horario (dia_de_semana, hora_entrada, hora_salida) values
('LUNES', '09:00:00', '18:00:00'),
('LUNES', '08:00:00', '12:00:00'),
('LUNES', '16:00:00', '20:00:00'),
('MARTES', '09:00:00', '18:00:00'),
('MARTES', '08:00:00', '12:00:00'),
('MARTES', '16:00:00', '20:00:00'),
('MIERCOLES', '09:00:00', '18:00:00'),
('MIERCOLES', '08:00:00', '12:00:00'),
('MIERCOLES', '16:00:00', '20:00:00'),
('JUEVES', '09:00:00', '18:00:00'),
('JUEVES', '08:00:00', '12:00:00'),
('JUEVES', '16:00:00', '20:00:00'),
('VIERNES', '09:00:00', '18:00:00'),
('VIERNES', '08:00:00', '12:00:00'),
('VIERNES', '16:00:00', '20:00:00'),
('SABADO', '09:00:00', '18:00:00'),
('SABADO', '08:00:00', '12:00:00'),
('SABADO', '16:00:00', '20:00:00'),
('DOMINGO', '09:00:00', '18:00:00'),
('DOMINGO', '08:00:00', '12:00:00'),
('DOMINGO', '16:00:00', '20:00:00');

insert into MedioDeTransporte (tipo) values
('AUTO'),
('MOTO'),
('PATA'),
('BICICLETA'),
('COLECTIVO');

insert into Repartidor (nombre, apellido, id_transporte) values
('Carlos', 'García', 1),
('María', 'López', 3),
('José', 'Martínez', 2),
('Ana', 'Rodríguez', 5),
('Luis', 'Hernández', 4),
('Laura', 'Gómez', 6),
('Javier', 'Díaz', 1),
('Sofía', 'Torres', 2),
('Andrés', 'Ruiz', 3),
('Lucía', 'Ramírez', 4),
('Pedro', 'Flores', 5),
('Elena', 'Morales', 6),
('Fernando', 'Ortega', 1),
('Isabel', 'Castro', 2),
('Miguel', 'Navarro', 3),
('Patricia', 'Delgado', 4),
('Raúl', 'Méndez', 5),
('Gabriela', 'Vargas', 6),
('Hugo', 'Rojas', 1),
('Camila', 'Santos', 2),
('Diego', 'Iglesias', 3),
('Valeria', 'Guerrero', 4),
('Sergio', 'Cortés', 5),
('Paula', 'Jiménez', 6),
('Francisco', 'Reyes', 1),
('Daniela', 'Paredes', 2),
('Manuel', 'Silva', 3),
('Natalia', 'Peña', 4),
('Ricardo', 'Campos', 5),
('Julia', 'Vega', 6);


INSERT INTO HorarioXRepartidor (id_horario, id_repartidor) VALUES
-- Repartidores 1-15: trabajan 7 días
(1,1),(4,1),(7,1),(10,1),(13,1),(16,1),(19,1),
(2,2),(5,2),(8,2),(11,2),(14,2),(17,2),(20,2),
(3,3),(6,3),(9,3),(12,3),(15,3),(18,3),(21,3),
(1,4),(5,4),(8,4),(11,4),(14,4),(17,4),(20,4),
(2,5),(4,5),(9,5),(10,5),(15,5),(18,5),(19,5),
(3,6),(6,6),(7,6),(12,6),(13,6),(16,6),(21,6),
(1,7),(4,7),(9,7),(10,7),(15,7),(18,7),(20,7),
(2,8),(5,8),(8,8),(11,8),(14,8),(17,8),(19,8),
(3,9),(6,9),(7,9),(12,9),(13,9),(16,9),(21,9),
(1,10),(5,10),(9,10),(11,10),(14,10),(17,10),(20,10),
(2,11),(4,11),(8,11),(10,11),(15,11),(18,11),(19,11),
(3,12),(6,12),(7,12),(12,12),(13,12),(16,12),(21,12),
(1,13),(5,13),(9,13),(10,13),(15,13),(18,13),(20,13),
(2,14),(4,14),(8,14),(11,14),(14,14),(17,14),(19,14),
(3,15),(6,15),(7,15),(12,15),(13,15),(16,15),(21,15),

-- Repartidores 16-30: trabajan 5 días
(1,16),(5,16),(9,16),(13,16),(17,16),
(2,17),(6,17),(10,17),(14,17),(18,17),
(3,18),(7,18),(11,18),(15,18),(19,18),
(4,19),(8,19),(12,19),(16,19),(20,19),
(5,20),(9,20),(13,20),(17,20),(21,20),
(1,21),(6,21),(10,21),(14,21),(18,21),
(2,22),(7,22),(11,22),(15,22),(19,22),
(3,23),(8,23),(12,23),(16,23),(20,23),
(4,24),(9,24),(13,24),(17,24),(21,24),
(5,25),(10,25),(14,25),(18,25),(19,25),
(1,26),(6,26),(11,26),(15,26),(20,26),
(2,27),(7,27),(12,27),(16,27),(21,27),
(3,28),(8,28),(13,28),(17,28),(19,28),
(4,29),(9,29),(14,29),(18,29),(20,29),
(5,30),(10,30),(15,30),(19,30),(21,30);

INSERT INTO CategoriaComercio (categoria) VALUES
-- Retail / Tiendas
('Ropa y accesorios'),
('Zapatería'),
('Joyería y relojería'),
('Tienda de electrónica'),
('Tienda de mascotas'),
('Ferretería'),
('Librería y papelería'),
('Tienda de regalos'),

-- Alimentos y Bebidas
('Restaurante'),
('Cafetería'),
('Panadería'),
('Hamburguesería'),
('Pastelería'),
('Heladería'),
('Comida rápida'),
('Pizzería'),
('Bar / Pub'),
('Supermercado'),
('Carnicería'),
('Frutería / Verdulería'),

-- Belleza y Cuidado Personal
('Tienda de cosméticos'),
('Perfumería'),

-- Salud
('Farmacia'),
('Óptica'),
('Tienda suplementos');


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

INSERT INTO Comercio (direccion, nombre, telefono, id_categoria) VALUES
('Av. Corrientes 1234', 'Moda Urbana', '1134582390', 1),
('Calle San Martín 456', 'Zapatería El Paso', '1129471820', 2),
('Av. Libertad 890', 'Joyas del Sol', '1145830291', 3),
('Calle Mitre 223', 'ElectroSmart', '1156201938', 4),
('Av. Cabildo 1500', 'Mundo Mascotas', '1139246710', 5),
('Calle Belgrano 932', 'Ferretería Central', '1123457689', 6),
('Av. Rivadavia 7850', 'Librería Atenas', '1130146572', 7),
('Calle Lavalle 654', 'Detalles & Regalos', '1129018463', 8),
('Av. Santa Fe 1200', 'Bistró Palermo', '1135467890', 9),
('Calle Tucumán 878', 'Café Aroma', '1156893021', 10),
('Av. Independencia 334', 'Panadería La Espiga', '1139205647', 11),
('Calle Córdoba 2211', 'Burger House', '1123145790', 12),
('Av. Scalabrini Ortiz 900', 'Pastelería Dulce Vida', '1138562340', 13),
('Calle Lima 1550', 'Helados Polar', '1145238976', 14),
('Av. Entre Ríos 210', 'Speedy Food', '1134579820', 15),
('Calle Ayacucho 118', 'Pizzería Don Nápoli', '1152347891', 16),
('Av. Callao 1543', 'Bar La Esquina', '1139485762', 17),
('Calle Florida 123', 'Supermercado Central', '1145890723', 18),
('Av. La Plata 440', 'Carnes Premium', '1134209786', 19),
('Calle Alberdi 675', 'Verduras Frescas', '1147853092', 20),
('Av. Corrientes 3000', 'Belleza Natural', '1158732049', 21),
('Calle Pasteur 589', 'Aromas & Perfumes', '1136874020', 22),
('Av. Directorio 240', 'Farmacia Salud', '1129765403', 23),
('Calle Montevideo 780', 'Óptica VisionPlus', '1153648792', 24),
('Av. Boedo 1599', 'Suplementos ProLife', '1132549871', 25),
('Calle Perón 1650', 'Look Fashion', '1136852741', 1),
('Av. Díaz Vélez 2323', 'TecnoMundo', '1146289375', 4),
('Calle Moreno 999', 'Café del Parque', '1152346789', 10),
('Av. Triunvirato 1456', 'Comida Express', '1134567123', 15),
('Calle Luro 2250', 'Pizza & Más', '1145876923', 16);


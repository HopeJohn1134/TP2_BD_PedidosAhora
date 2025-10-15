use PedidosAhora;
-- horarios repartidores
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

-- Alimentos y Bebidas: almuerzo y cena
INSERT INTO Horario (dia_de_semana, hora_entrada, hora_salida) VALUES
('LUNES','11:00:00','15:00:00'),
('LUNES','19:00:00','24:00:00'),
('MARTES','11:00:00','15:00:00'),
('MARTES','19:00:00','24:00:00'),
('MIERCOLES','11:00:00','15:00:00'),
('MIERCOLES','19:00:00','24:00:00'),
('JUEVES','11:00:00','15:00:00'),
('JUEVES','19:00:00','24:00:00'),
('VIERNES','11:00:00','15:00:00'),
('VIERNES','19:00:00','24:00:00'),
('SABADO','11:00:00','15:00:00'),
('SABADO','19:00:00','24:00:00'),
('DOMINGO','11:00:00','15:00:00'),
('DOMINGO','19:00:00','24:00:00');

-- Belleza y Salud: mixto
INSERT INTO Horario (dia_de_semana, hora_entrada, hora_salida) VALUES
('LUNES','08:00:00','12:00:00'),
('LUNES','16:00:00','20:00:00'),
('MARTES','08:00:00','12:00:00'),
('MARTES','16:00:00','20:00:00'),
('MIERCOLES','08:00:00','12:00:00'),
('MIERCOLES','16:00:00','20:00:00'),
('JUEVES','08:00:00','12:00:00'),
('JUEVES','16:00:00','20:00:00'),
('VIERNES','08:00:00','12:00:00'),
('VIERNES','16:00:00','20:00:00');

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

-- Retail / Tiendas en horario corrido 09:00-18:00
INSERT INTO HorarioXComercio (id_horario, id_comercio) VALUES
(1,1),(4,2),(7,3),(10,4),(13,5),(16,6),(19,7),(22,8),
(1,25),(4,26),(7,27),(10,28),(13,29),(16,30);

-- Alimentos / Bebidas en horarios almuerzo 11:00-15:00 y cena 19:00-24:00
INSERT INTO HorarioXComercio (id_horario, id_comercio) VALUES
(23,9),(24,9),(25,10),(26,10),(27,11),(28,11),(29,12),(30,12),
(31,13),(32,13),(33,14),(34,14),(35,15),(36,15),(23,16),(24,16),
(25,17),(26,17),(27,18),(28,18),(29,19),(30,19),(31,20),(32,20);

-- Belleza / Salud en horarios mixtos
INSERT INTO HorarioXComercio (id_horario, id_comercio) VALUES
(36,21),(37,21),(38,22),(39,22),(40,23),(41,23),(42,24),(43,24);
);

INSERT INTO EstadoDelPedido (tipo) VALUES
('PENDIENTE'),
('ACEPTADO'),
('EN_PREPARACION'),
('LISTO_PARA_ENTREGAR'),
('EN_CAMINO'),
('ENTREGADO'),
('CANCELADO');

INSERT INTO Usuario (nombre, apellido, domicilio, correo_electronico, telefono) VALUES
('Juan', 'Pérez', 'Av. Rivadavia 1234, Buenos Aires', 'juan.perez@gmail.com', '1123456789'),
('María', 'González', 'Calle Corrientes 2345, Buenos Aires', 'maria.gonzalez@gmail.com', '1167891234'),
('Carlos', 'Rodríguez', 'Av. Belgrano 987, Rosario', 'carlos.rodriguez@gmail.com', '3416543210'),
('Lucía', 'Fernández', 'Calle San Martín 543, Córdoba', 'lucia.fernandez@gmail.com', '3517654321'),
('Jorge', 'López', 'Calle Tucumán 1200, Mendoza', 'jorge.lopez@gmail.com', '2616789012'),
('Ana', 'Martínez', 'Av. Colón 1450, Córdoba', 'ana.martinez@gmail.com', '3512345678'),
('Sofía', 'García', 'Calle Maipú 765, Rosario', 'sofia.garcia@gmail.com', '3415678901'),
('Martín', 'Sosa', 'Av. Alem 234, La Plata', 'martin.sosa@gmail.com', '2214567890'),
('Camila', 'Torres', 'Calle Moreno 875, Buenos Aires', 'camila.torres@gmail.com', '1134567890'),
('Matías', 'Ramírez', 'Av. Libertador 5600, Vicente López', 'matias.ramirez@gmail.com', '1145678901'),
('Valentina', 'Díaz', 'Calle Lavalle 900, San Miguel de Tucumán', 'valentina.diaz@gmail.com', '3816789012'),
('Franco', 'Benítez', 'Calle Rioja 1020, Córdoba', 'franco.benitez@gmail.com', '3517890123'),
('Julieta', 'Moreno', 'Calle Pellegrini 2300, Rosario', 'julieta.moreno@gmail.com', '3416781234'),
('Tomás', 'Ramos', 'Av. Perón 1500, San Juan', 'tomas.ramos@gmail.com', '2646789012'),
('Carla', 'Medina', 'Calle 9 de Julio 800, Salta', 'carla.medina@gmail.com', '3876543210'),
('Nicolás', 'Suárez', 'Calle Catamarca 210, Resistencia', 'nicolas.suarez@gmail.com', '3626789012'),
('Micaela', 'Romero', 'Calle Mendoza 150, Córdoba', 'micaela.romero@gmail.com', '3516782345'),
('Federico', 'Vega', 'Calle Florida 123, Buenos Aires', 'federico.vega@gmail.com', '1156789012'),
('Agustina', 'Herrera', 'Av. Mitre 340, Bahía Blanca', 'agustina.herrera@gmail.com', '2916543210'),
('Leandro', 'Cruz', 'Calle Independencia 789, Mar del Plata', 'leandro.cruz@gmail.com', '2236789012'),
('Brenda', 'Ortiz', 'Calle Córdoba 560, Rosario', 'brenda.ortiz@gmail.com', '3417896543'),
('Gonzalo', 'Navarro', 'Calle San Juan 890, Mendoza', 'gonzalo.navarro@gmail.com', '2617890123'),
('Paula', 'Aguilar', 'Av. Sarmiento 1200, Posadas', 'paula.aguilar@gmail.com', '3766789012'),
('Ezequiel', 'Silva', 'Calle Alberdi 456, Córdoba', 'ezequiel.silva@gmail.com', '3517894561'),
('Rocío', 'Mendoza', 'Calle Las Heras 900, San Luis', 'rocio.mendoza@gmail.com', '2666543210'),
('Santiago', 'Domínguez', 'Calle Belgrano 430, Paraná', 'santiago.dominguez@gmail.com', '3436789012'),
('Lautaro', 'Ponce', 'Av. España 300, Corrientes', 'lautaro.ponce@gmail.com', '3796789012'),
('Milagros', 'Campos', 'Calle San Lorenzo 1200, Santa Fe', 'milagros.campos@gmail.com', '3426789012'),
('Diego', 'Acosta', 'Av. San Martín 1100, Neuquén', 'diego.acosta@gmail.com', '2996789012'),
('Florencia', 'Maldonado', 'Calle Roca 760, Trelew', 'florencia.maldonado@gmail.com', '2806543210');

-- para el estado hicimos aleatorio
INSERT INTO Pedido (domicilio, id_comercio, id_usuario, id_repartidor, id_estado) VALUES
('Av. Rivadavia 1234, Buenos Aires', 9, 1, 1, 1),
('Calle Corrientes 2345, Buenos Aires', 10, 2, 2, 2),
('Av. Belgrano 987, Rosario', 11, 3, 3, 3),
('Calle San Martín 543, Córdoba', 12, 4, 4, 4),
('Calle Tucumán 1200, Mendoza', 13, 5, 5, 5),
('Av. Colón 1450, Córdoba', 14, 6, 6, 6),
('Calle Maipú 765, Rosario', 15, 7, 7, 7),
('Av. Alem 234, La Plata', 16, 8, 8, 1),
('Calle Moreno 875, Buenos Aires', 17, 9, 9, 2),
('Av. Libertador 5600, Vicente López', 18, 10, 10, 3),
('Calle Lavalle 900, San Miguel de Tucumán', 19, 11, 11, 4),
('Calle Rioja 1020, Córdoba', 20, 12, 12, 5),
('Calle Pellegrini 2300, Rosario', 21, 13, 13, 6),
('Av. Perón 1500, San Juan', 22, 14, 14, 7),
('Calle 9 de Julio 800, Salta', 23, 15, 15, 1),
('Calle Catamarca 210, Resistencia', 24, 1, 16, 2),
('Calle Mendoza 150, Córdoba', 25, 2, 17, 3),
('Calle Florida 123, Buenos Aires', 26, 3, 18, 4),
('Av. Mitre 340, Bahía Blanca', 27, 4, 19, 5),
('Calle Independencia 789, Mar del Plata', 28, 5, 20, 6),
('Calle Córdoba 560, Rosario', 29, 6, 7, 7),
('Calle San Juan 890, Mendoza', 30, 7, 8, 1),
('Av. Sarmiento 1200, Posadas', 1, 8, 9, 2),
('Calle Alberdi 456, Córdoba', 2, 9, 10, 3),
('Calle Las Heras 900, San Luis', 3, 10, 11, 4),
('Calle Belgrano 430, Paraná', 4, 11, 12, 5),
('Av. España 300, Corrientes', 5, 12, 13, 6),
('Calle San Lorenzo 1200, Santa Fe', 6, 13, 14, 7),
('Av. San Martín 1100, Neuquén', 7, 14, 15, 1),
('Calle Roca 760, Trelew', 8, 15, 16, 2),
('Av. Rivadavia 1250, Buenos Aires', 9, 1, 2, 6),
('Calle Corrientes 2300, Buenos Aires', 10, 2, 3, 6),
('Av. Belgrano 990, Rosario', 11, 3, 4, 6),
('Calle San Martín 550, Córdoba', 12, 4, 5, 6),
('Calle Tucumán 1220, Mendoza', 13, 5, 6, 6),
('Av. Colón 1470, Córdoba', 14, 6, 7, 6),
('Calle Maipú 770, Rosario', 15, 7, 8, 6),
('Av. Alem 240, La Plata', 16, 8, 9, 6),
('Calle Moreno 880, Buenos Aires', 17, 9, 10, 6),
('Av. Libertador 5620, Vicente López', 18, 10, 11, 6),
('Calle Lavalle 910, Tucumán', 19, 11, 12, 6),
('Calle Rioja 1030, Córdoba', 20, 12, 13, 6),
('Calle Pellegrini 2310, Rosario', 21, 13, 14, 6),
('Av. Perón 1510, San Juan', 22, 14, 15, 6),
('Calle 9 de Julio 820, Salta', 23, 15, 16, 6),
('Calle Catamarca 215, Resistencia', 24, 1, 17, 6),
('Calle Mendoza 160, Córdoba', 25, 2, 18, 6),
('Calle Florida 130, Buenos Aires', 26, 3, 19, 6),
('Av. Mitre 350, Bahía Blanca', 27, 4, 20, 6),
('Calle Independencia 790, Mar del Plata', 28, 5, 1, 6),
('Calle Córdoba 570, Rosario', 29, 6, 2, 6),
('Calle San Juan 900, Mendoza', 30, 7, 3, 6),
('Av. Sarmiento 1210, Posadas', 1, 8, 4, 6),
('Calle Alberdi 460, Córdoba', 2, 9, 5, 6),
('Calle Las Heras 910, San Luis', 3, 10, 6, 6),
('Calle Belgrano 440, Paraná', 4, 11, 7, 6),
('Av. España 310, Corrientes', 5, 12, 8, 7),
('Calle San Lorenzo 1210, Santa Fe', 6, 13, 9, 7),
('Av. San Martín 1110, Neuquén', 7, 14, 10, 7),
('Calle Roca 770, Trelew', 8, 15, 11, 7),
('Av. Rivadavia 1300, Buenos Aires', 9, 1, 12, 7),
('Calle Corrientes 2400, Buenos Aires', 10, 2, 13, 7),
('Av. Belgrano 1000, Rosario', 11, 3, 14, 7),
('Calle San Martín 560, Córdoba', 12, 4, 15, 7),
('Calle Tucumán 1230, Mendoza', 13, 5, 16, 7),
('Av. Colón 1480, Córdoba', 14, 6, 17, 7),
('Calle Maipú 780, Rosario', 15, 7, 18, 7),
('Av. Alem 250, La Plata', 16, 8, 19, 7),
('Calle Moreno 890, Buenos Aires', 17, 9, 20, 7),
('Av. Libertador 5630, Vicente López', 18, 10, 1, 7),
('Calle Lavalle 920, Tucumán', 19, 11, 2, 7),
('Calle Rioja 1040, Córdoba', 20, 12, 3, 7),
('Calle Pellegrini 2320, Rosario', 21, 13, 4, 7),
('Av. Perón 1520, San Juan', 22, 14, 5, 7),
('Calle 9 de Julio 830, Salta', 23, 15, 6, 7),
('Calle Catamarca 220, Resistencia', 24, 1, 7, 7),
('Calle Mendoza 170, Córdoba', 25, 2, 8, 7),
('Calle Florida 140, Buenos Aires', 26, 3, 9, 7),
('Av. Mitre 360, Bahía Blanca', 27, 4, 10, 7),
('Calle Independencia 800, Mar del Plata', 28, 5, 11, 7);

INSERT INTO Valoracion (id_pedido, comentario_comercio, puntuacion_comercio, comentario_repartidor, puntuacion_repartidor)
VALUES
(31, 'Excelente servicio, todo llegó caliente.', 5, 'Muy amable y puntual.', 5),
(32, 'Buena atención del comercio.', 4, 'Rápido y atento.', 5),
(33, 'Un poco demorado, pero llegó bien.', 3, 'Cumplió con la entrega.', 4),
(34, 'Excelente presentación.', 5, 'Muy profesional.', 5),
(35, 'Faltó una bebida.', 3, 'Entrega correcta.', 4),
(36, NULL, 4, NULL, 4),
(37, 'Buen trato y servicio.', 4, 'Lento pero educado.', 3),
(38, 'Perfecto, todo fresco.', 5, 'Muy profesional.', 5),
(39, 'Comida un poco fría.', 3, 'Entrega sin problemas.', 4),
(40, 'Muy buena atención.', 5, 'Excelente disposición.', 5),
(41, 'Excelente atención.', 5, 'Muy cordial.', 5),
(42, 'Muy buena calidad.', 5, 'Entrega puntual.', 5),
(43, 'Todo excelente.', 5, 'Muy amable.', 5),
(44, 'Buen servicio.', 4, 'Correcto.', 4),
(45, 'Entrega puntual.', 5, 'Todo perfecto.', 5),
(46, 'Muy buen servicio.', 5, 'Repartidor amable.', 5),
(47, 'Comida rica.', 4, 'Entrega rápida.', 5),
(48, 'Cumplieron con todo.', 5, 'Muy educado.', 5),
(49, NULL, 4, NULL, 4),
(50, 'Buena atención.', 4, 'Cordial.', 4),
(51, 'Todo en orden.', 4, 'Muy bien.', 4),
(52, 'Excelente.', 5, 'Recomendado.', 5),
(53, 'Buen precio y rápido.', 4, 'Correcto.', 4),
(54, 'Excelente experiencia.', 5, 'Atento y puntual.', 5),
(55, 'Pedido cancelado, pero respondieron rápido.', 3, 'Avisó a tiempo.', 4),
(56, 'Cancelado por error del comercio.', 2, 'Repartidor correcto.', 3),
(57, 'Nunca llegó.', 1, 'No se comunicó.', 1),
(58, 'Demoraron mucho y cancelé.', 2, 'Intentó entregarlo.', 3),
(59, 'Cancelado sin explicación.', 1, 'No se presentó.', 1),
(60, 'No pudieron entregar.', 2, 'Llamó antes.', 3),
(61, 'Me avisaron del problema, buena atención.', 4, 'Cortés.', 4),
(62, 'Cancelé porque me equivoqué.', 4, 'Muy amable.', 5),
(63, 'Se disculparon por el error.', 3, 'Buena actitud.', 4),
(64, 'Demora excesiva.', 2, 'Llegó tarde.', 2),
(65, 'Cancelado por falta de stock.', 2, 'Avisó rápido.', 3),
(66, 'Fallo del sistema, pero atendieron bien.', 4, 'Correcto.', 4),
(67, 'Cancelado por error, todo bien.', 3, 'Comprensivo.', 4),
(68, 'No lo volvería a pedir.', 1, 'Mala experiencia.', 1);


-- PRODUCTOS, 3 por cada comercio.
-- Comercio 1: Moda Urbana
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1500, 'Remera básica', 1),
(2500, 'Jean clásico', 1),
(3500, 'Campera de invierno', 1);

-- Comercio 2: Zapatería El Paso
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(3000, 'Zapatillas deportivas', 2),
(4500, 'Botas de cuero', 2),
(2000, 'Sandalias verano', 2);

-- Comercio 3: Joyas del Sol
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(12000, 'Anillo de plata', 3),
(25000, 'Collar de oro', 3),
(8000, 'Pulsera elegante', 3);

-- Comercio 4: ElectroSmart
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(45000, 'Smartphone X', 4),
(25000, 'Auriculares Bluetooth', 4),
(60000, 'Tablet Pro', 4);

-- Comercio 5: Mundo Mascotas
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1200, 'Alimento para perros', 5),
(800, 'Juguete para gatos', 5),
(500, 'Cama para mascotas', 5);

-- Comercio 6: Ferretería Central
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(50, 'Clavos 1kg', 6),
(70, 'Tornillos 1kg', 6),
(100, 'Tuercas y arandelas 1kg', 6);

-- Comercio 7: Librería Atenas
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(500, 'Cuaderno A4', 7),
(200, 'Bolígrafo azul', 7),
(800, 'Agenda 2026', 7);

-- Comercio 8: Detalles & Regalos
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1500, 'Set de velas aromáticas', 8),
(800, 'Taza personalizada', 8),
(1200, 'Marco de fotos', 8);

-- Comercio 9: Bistró Palermo
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1200, 'Ensalada César', 9),
(2500, 'Lomo a la plancha', 9),
(800, 'Postre del día', 9);

-- Comercio 10: Café Aroma
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(500, 'Café espresso', 10),
(400, 'Té verde', 10),
(350, 'Medialuna', 10);

-- Comercio 11: Panadería La Espiga
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(200, 'Pan francés', 11),
(350, 'Medialuna de manteca', 11),
(400, 'Budín casero', 11);

-- Comercio 12: Burger House
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1500, 'Hamburguesa clásica', 12),
(1800, 'Hamburguesa doble', 12),
(700, 'Papas fritas', 12);

-- Comercio 13: Pastelería Dulce Vida
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(500, 'Tarta de frutas', 13),
(350, 'Alfajor de maicena', 13),
(450, 'Brownie', 13);

-- Comercio 14: Helados Polar
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(350, 'Helado de chocolate', 14),
(350, 'Helado de vainilla', 14),
(400, 'Sundae especial', 14);

-- Comercio 15: Speedy Food
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1200, 'Milanesa con guarnición', 15),
(1500, 'Pizza chica', 15),
(500, 'Bebida 500ml', 15);

-- Comercio 16: Pizzería Don Nápoli
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(2500, 'Pizza Napolitana', 16),
(2800, 'Pizza de muzzarella', 16),
(3000, 'Pizza especial', 16);

-- Comercio 17: Bar La Esquina
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(800, 'Cerveza artesanal', 17),
(1500, 'Picada mixta', 17),
(600, 'Trago clásico', 17);

-- Comercio 18: Supermercado Central
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(120, 'Leche 1L', 18),
(200, 'Pan de molde', 18),
(80, 'Huevos docena', 18);

-- Comercio 19: Carnes Premium
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1200, 'Bife de chorizo', 19),
(900, 'Milanesa de carne', 19),
(700, 'Chorizo parrillero', 19);

-- Comercio 20: Verduras Frescas
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(300, 'Lechuga', 20),
(200, 'Tomate x kg', 20),
(250, 'Zapallo', 20);

-- Comercio 21: Belleza Natural
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1200, 'Crema hidratante', 21),
(800, 'Shampoo nutritivo', 21),
(500, 'Jabón facial', 21);

-- Comercio 22: Aromas & Perfumes
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(3500, 'Perfume floral', 22),
(3000, 'Perfume amaderado', 22),
(1500, 'Body lotion', 22);

-- Comercio 23: Farmacia Salud
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(400, 'Ibuprofeno x 20', 23),
(600, 'Paracetamol x 20', 23),
(1200, 'Vitamina C 500mg', 23);

-- Comercio 24: Óptica VisionPlus
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(3500, 'Lentes de sol', 24),
(6000, 'Lentes graduados', 24),
(1500, 'Estuche para lentes', 24);

-- Comercio 25: Suplementos ProLife
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1500, 'Proteína en polvo', 25),
(1200, 'Creatina', 25),
(800, 'Aminoácidos', 25);

-- Comercio 26: Look Fashion
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(2000, 'Remera estampada', 26),
(3500, 'Jean skinny', 26),
(4000, 'Campera de cuero', 26);

-- Comercio 27: TecnoMundo
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(55000, 'Laptop X', 27),
(25000, 'Tablet Android', 27),
(18000, 'Auriculares Gaming', 27);

-- Comercio 28: Café del Parque
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(400, 'Café latte', 28),
(350, 'Medialuna', 28),
(500, 'Té chai', 28);

-- Comercio 29: Comida Express
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(1200, 'Empanadas surtidas', 29),
(1500, 'Milanesa con guarnición', 29),
(500, 'Bebida 500ml', 29);

-- Comercio 30: Pizza & Más
INSERT INTO Producto (precio, nombre, id_comercio) VALUES
(2800, 'Pizza cuatro quesos', 30),
(3000, 'Pizza napolitana', 30),
(3200, 'Pizza especial', 30);



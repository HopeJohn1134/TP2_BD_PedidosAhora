CREATE DATABASE PedidosAhora;
USE PedidosAhora;

CREATE TABLE CategoriaComercio (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(20) UNIQUE NOT NULL
);
-- enum los dias de semana


CREATE TABLE Horario (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    dia_de_semana ENUM('LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO'),
    hora_entrada TIMESTAMP,
    hora_salida TIMESTAMP
);
-- preguntarle al profe ======================================================================
CREATE TABLE HorarioXComercio (
    id_horarioxcomercio INT AUTO_INCREMENT PRIMARY KEY,
    id_horario INT UNSIGNED NOT NULL,
    id_comercio INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario),
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio)
);

CREATE TABLE HorarioXRepartidor (
    id_horarioxrepartidor INT AUTO_INCREMENT PRIMARY KEY,
    id_horario INT UNSIGNED NOT NULL,
    id_repartidor INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario),
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidor (id_repartidor)
);

CREATE TABLE Comercio (
    id_comercio INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_categoria INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES CategoriaComercio (id_categoria),
    CHECK (telefono REGEXP '^[0-9]{7,15}$')
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (correo_electronico LIKE '%_@_%._%'),
    CHECK (telefono REGEXP '^[0-9]{7,15}$')
);

CREATE TABLE MedioDeTransporte (
    id_transporte INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL
);

-- Se podria agregar vehiculos como tabla
CREATE TABLE Repartidor (
    id_repartidor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_transporte INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_transporte)
        REFERENCES MedioDeTransporte (id_transporte)
);
-- explicar porque default ""
-- valoracion promedio de comeercio y repartidor
CREATE TABLE Valoracion (
    id_valoracion INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comentario_comercio TEXT DEFAULT '',
    puntuacion_comercio TINYINT UNSIGNED NOT NULL,
    comentario_repartidor TEXT DEFAULT '',
    puntuacion_repartidor TINYINT UNSIGNED NOT NULL,
    CHECK (puntuacion_comercio BETWEEN 1 AND 5),
    CHECK (puntuacion_repartidor BETWEEN 1 AND 5)
);
-- preguntar por int vs tinyint en primary key
CREATE TABLE EstadoDelPedido (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    domicilio VARCHAR(50) NOT NULL,
    id_comercio INT UNSIGNED NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    id_repartidor INT UNSIGNED NOT NULL,
    id_valoracion INT UNSIGNED NOT NULL,
    id_estado INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_estado)
        REFERENCES EstadoDelPedido (id_estado),
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio),
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id_usuario),
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidor (id_repartidor),
    FOREIGN KEY (id_valoracion)
        REFERENCES Valoracion (id_valoracion)
);

CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    precio DECIMAL(12 , 2 ) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_comercio INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio)
);

CREATE TABLE MedioDePago (
    id_medio_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
-- ver si agregar el precio pagado
CREATE TABLE Pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    pagado BOOL DEFAULT FALSE,
    id_medio INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_medio)
        REFERENCES MedioDePago (id_medio_pago),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

-- nuestra app solo toma porcentajes para promociones de producto
-- las promos son solo para productos y se aplican en pagos, desaparece la relacion directa de promocion y pedido
-- estructura para almacenar los dias de la semana con bits
CREATE TABLE Promocion (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    porcentaje_descuento TINYINT UNSIGNED NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_final DATETIME NOT NULL,
    CHECK (porcentaje_descuento BETWEEN 0 AND 100)
);

-- preguntar al profe ==================================================================
-- n:n y 1:n
CREATE TABLE ProductoXPedido (
    id_productoxpedido INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE PromocionXProducto (
    id_promocionxproducto INT AUTO_INCREMENT PRIMARY KEY,
    id_promocion INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto)
);
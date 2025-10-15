CREATE DATABASE PedidosAhora;

USE PedidosAhora;

CREATE TABLE Horario (
    id_horario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dia_de_semana ENUM('LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO'),
    hora_entrada TIME,
    hora_salida TIME,
    eliminado BOOLEAN DEFAULT FALSE,
    CHECK (hora_entrada < hora_salida)
);

CREATE TABLE MedioDeTransporte (
    id_transporte INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Repartidor (
    id_repartidor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_baja TIMESTAMP DEFAULT NULL,
    id_transporte INT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_transporte)
        REFERENCES MedioDeTransporte (id_transporte),
	INDEX idx_repartidor_transporte_activo (id_transporte, eliminado)
);

CREATE TABLE HorarioXRepartidor (
    id_horarioxrepartidor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_horario INT UNSIGNED NOT NULL,
    id_repartidor INT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario),
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidor (id_repartidor)
    
);

CREATE TABLE CategoriaComercio (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50) UNIQUE NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Comercio (
    id_comercio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(100) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_baja TIMESTAMP DEFAULT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_categoria)
        REFERENCES CategoriaComercio (id_categoria),
    CHECK (telefono REGEXP '^[0-9]{7,20}$'),
    INDEX idx_comercio_categoria_activo (id_categoria, eliminado)
);

CREATE TABLE HorarioXComercio (
    id_horarioxcomercio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_horario INT UNSIGNED NOT NULL,
    id_comercio INT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario),
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio)
);

CREATE TABLE Usuario (
    id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_baja TIMESTAMP DEFAULT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    CHECK (correo_electronico LIKE '%_@_%._%'),
    CHECK (telefono REGEXP '^[0-9]{7,20}$')
);

CREATE TABLE EstadoDelPedido (
    id_estado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Pedido (
    id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    domicilio VARCHAR(100) NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_comercio INT UNSIGNED NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    id_repartidor INT UNSIGNED NOT NULL,
    id_estado INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_estado)
        REFERENCES EstadoDelPedido (id_estado),
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio),
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario (id_usuario),
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidor (id_repartidor)
);

CREATE TABLE Valoracion (
    id_valoracion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT UNSIGNED NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comentario_comercio TEXT DEFAULT NULL,
    puntuacion_comercio TINYINT UNSIGNED NOT NULL,
    comentario_repartidor TEXT DEFAULT NULL,
    puntuacion_repartidor TINYINT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    CHECK (puntuacion_comercio BETWEEN 1 AND 5),
    CHECK (puntuacion_repartidor BETWEEN 1 AND 5),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE Producto (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    precio DECIMAL(12 , 2 ) UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_baja TIMESTAMP DEFAULT NULL,
    id_comercio INT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_comercio) REFERENCES Comercio (id_comercio),
	INDEX idx_producto_comercio_activo (id_comercio, eliminado)
);

CREATE TABLE MedioDePago (
    id_medio_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Pago (
    id_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pagado BOOL DEFAULT FALSE,
    fecha_pago TIMESTAMP DEFAULT NULL,
    id_medio INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_medio)
        REFERENCES MedioDePago (id_medio_pago),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE Promocion (
    id_promocion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    porcentaje_descuento TINYINT UNSIGNED NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_final DATETIME NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_baja TIMESTAMP DEFAULT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    CHECK (porcentaje_descuento BETWEEN 0 AND 100),
    CHECK (fecha_inicio < fecha_final),
    INDEX idx_promocion_fecha_activa (fecha_inicio, fecha_final, eliminado)
);

CREATE TABLE ProductoXPedido (
    id_productoxpedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    cantidad SMALLINT UNSIGNED NOT NULL,
    precio_unitario DECIMAL(12 , 2 ) UNSIGNED NOT NULL,
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE PromocionXProducto (
    id_promocionxproducto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_promocion INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto)
);
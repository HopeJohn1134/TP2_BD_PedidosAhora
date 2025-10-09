CREATE DATABASE PedidosAhora;
USE PedidosAhora;
-- OK
CREATE TABLE CategoriaComercio (
    id_categoria INT UNSIGNED PRIMARY KEY,
    categoria VARCHAR(20) UNIQUE NOT NULL
);
-- OK
CREATE TABLE Horario (
    id_horario INT UNSIGNED PRIMARY KEY,
    dia_de_semana VARCHAR(10),
    horario VARCHAR(100)
);

CREATE TABLE Comercio (
    id_comercio INT UNSIGNED PRIMARY KEY,
    direccion VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(15) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES Categoria_comercio (id_categoria),
    id_horario_atencion INT NOT NULL,
    FOREIGN KEY (id_horario_atencion)
        REFERENCES Horario (id_horario),
    CHECK (telefono REGEXP '^[0-9]{7,15}$')
);

CREATE TABLE Usuario (
    id_usuario INT UNSIGNED PRIMARY KEY,
    apellido VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(15) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (correo_electronico LIKE '%_@_%._%'),
    CHECK (telefono REGEXP '^[0-9]{7,15}$')
);

CREATE TABLE MedioDeTransporte (
    id_transporte INT UNSIGNED PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL
);
-- revisar con el profe
CREATE TABLE Turno (
    id_turno INT UNSIGNED PRIMARY KEY,
    nombre_turno VARCHAR(50) UNIQUE NOT NULL,
    id_horario INT NOT NULL,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario)
);

CREATE TABLE Repartidor (
    id_repartidor INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_transporte INT NOT NULL,
    FOREIGN KEY (id_transporte)
        REFERENCES Medio_de_Transporte (id_transporte),
    id_turno INT NOT NULL,
    FOREIGN KEY (id_turno)
        REFERENCES Turno (id_turno)
);

CREATE TABLE Valoracion (
    id_valoracion INT UNSIGNED PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comentario_comercio TEXT NOT NULL,
    puntuacion_comercio INT NOT NULL,
    comentario_repartidor TEXT NOT NULL,
    puntuacion_repartidor INT NOT NULL,
    CHECK (puntuacion_comercio BETWEEN 0 AND 5),
    CHECK (puntuacion_repartidor BETWEEN 0 AND 5)
);

CREATE TABLE Estado (
    id_estado INT UNSIGNED PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Pedido (
    id_pedido INT UNSIGNED PRIMARY KEY,
    domicilio VARCHAR(50) NOT NULL,
    id_comercio INT NOT NULL,
    id_usuario INT NOT NULL,
    id_repartidor INT NOT NULL,
    id_valoracion INT NOT NULL,
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado)
        REFERENCES Estado (id_estado),
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
    id_producto INT UNSIGNED PRIMARY KEY,
    precio DECIMAL(8 , 2 ) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_comercio INT NOT NULL,
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio)
);

CREATE TABLE MedioDePago (
    id_medio_pago INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE Pago (
    pagado BOOL,
    id_pago INT UNSIGNED PRIMARY KEY,
    id_medio_pago INT NOT NULL,
    id_pedido INT NOT NULL,
    FOREIGN KEY (id_medio_pago)
        REFERENCES Medio_de_pago (id_medio_pago),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE Promocion (
    id_promocion INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    valor_descuento INT NOT NULL,
    dias_de_semana DATE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
);

CREATE TABLE TieneEsta (
    id_producto INT NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_pedido , id_producto),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE EstaDentroTiene (
    id_promocion INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_promocion , id_producto),
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto)
);

CREATE TABLE AsignadoTiene (
    id_promocion INT NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_pedido , id_promocion),
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

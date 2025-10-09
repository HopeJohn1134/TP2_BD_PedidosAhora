CREATE DATABASE PedidosAhora;
USE PedidosAhora;

CREATE TABLE CategoriaComercio (
    id_categoria INT UNSIGNED PRIMARY KEY,
    categoria VARCHAR(20) UNIQUE NOT NULL
);
-- enum los dias de semana


CREATE TABLE Horario (
    id_horario INT UNSIGNED PRIMARY KEY,
    dia_de_semana ENUM ("LUNES","MARTES","MIERCOLES","JUEVES","VIERNES","SABADO","DOMINGO"), 
    hora_entrada TIMESTAMP,
    hora_salida TIMESTAMP
);
-- preguntarle al profe ======================================================================
CREATE TABLE HorarioXComercio (
    id_horarioxcomercio INT UNSIGNED PRIMARY KEY,
    id_horario INT UNSIGNED NOT NULL,
    id_comercio INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario),
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio)
);

CREATE TABLE HorarioXRepartidor (
    id_horarioxrepartidor INT UNSIGNED PRIMARY KEY,
    id_horario INT UNSIGNED NOT NULL,
    id_repartidor INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_horario)
        REFERENCES Horario (id_horario),
    FOREIGN KEY (id_repartidor)
        REFERENCES Repartidor (id_repartidor)
);

CREATE TABLE Comercio (
    id_comercio INT UNSIGNED PRIMARY KEY,
    direccion VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(15) NOT NULL,
    fecha_alta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_categoria INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES Categoria_comercio (id_categoria),
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


CREATE TABLE Repartidor (
    id_repartidor INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_transporte INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_transporte)
        REFERENCES Medio_de_Transporte (id_transporte)
);

CREATE TABLE Valoracion (
    id_valoracion INT UNSIGNED PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comentario_comercio TEXT NOT NULL,
    puntuacion_comercio INT UNSIGNED NOT NULL,
    comentario_repartidor TEXT NOT NULL,
    puntuacion_repartidor INT UNSIGNED NOT NULL,
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
    id_comercio INT UNSIGNED NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    id_repartidor INT UNSIGNED NOT NULL,
    id_valoracion INT UNSIGNED NOT NULL,
    id_estado INT UNSIGNED NOT NULL,
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
    id_comercio INT UNSIGNED NOT NULL,
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
    id_medio_pago INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_medio_pago)
        REFERENCES Medio_de_pago (id_medio_pago),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE Promocion (
    id_promocion INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    valor_descuento INT UNSIGNED NOT NULL,
    dias_de_semana DATE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
);
-- preguntar al profe ==================================================================
-- n:n y 1:n
CREATE TABLE TieneEsta (
    id_producto INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido , id_producto),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE EstaDentroTiene (
    id_promocion INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto)
);

CREATE TABLE AsignadoTiene (
    id_promocion INT UNSIGNED NOT NULL,
    id_pedido INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_pedido , id_promocion),
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

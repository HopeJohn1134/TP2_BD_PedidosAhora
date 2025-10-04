CREATE DATABASE PedidosAhora;
USE PedidosAhora;

CREATE TABLE Categoria_comercio (
    id_categoria INT PRIMARY KEY,
    categoria VARCHAR(20) unique not null
);

create table Horario (
	id_horario int primary key,
    dia_de_semana varchar(10),
    horario varchar(100) -- agregar check
);

CREATE TABLE Comercio (
    id_comercio INT PRIMARY KEY,
    direccion VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    fecha_alta timestamp default current_timestamp,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES Categoria_comercio (id_categoria),
    id_horario_atencion Int not null,
	FOREIGN KEY (id_horario_atencion)
        REFERENCES Horario (id_horario)
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    apellido VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL, -- agregar check
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    fecha_alta timestamp default current_timestamp 
);

CREATE TABLE Medio_de_Transporte (
    id_transporte INT PRIMARY KEY,
    tipo VARCHAR(50) unique not NULL
);

CREATE TABLE Turno (
    id_turno INT PRIMARY KEY,
    nombre_turno varchar(50) unique not null,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL, -- check hora fin mayor que hora inicio
    dia VARCHAR(100) NOT NULL
);

CREATE TABLE Repartidor (
    id_repartidor INT PRIMARY KEY,
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
    fecha DATE NOT NULL,
    id_valoracion INT PRIMARY KEY,
    comentario_comercio TEXT NOT NULL,
    puntuacion_comercio INT NOT NULL,
    comentario_repartidor TEXT NOT NULL,
    puntuacion_repartidor INT NOT NULL
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY,
    estado INT NOT NULL,
    domicilio VARCHAR(50) NOT NULL,
    id_comercio INT NOT NULL,
    id_usuario INT NOT NULL,
    id_repartidor INT NOT NULL,
    id_valoracion INT NOT NULL,
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
    id_producto INT PRIMARY KEY,
    precio DECIMAL(6 , 2 ) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_comercio INT NOT NULL,
    FOREIGN KEY (id_comercio)
        REFERENCES Comercio (id_comercio)
);

CREATE TABLE Medio_de_pago (
    id_medio_pago INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Pago (
    pagado BOOL,
    id_pago INT PRIMARY KEY,
    id_medio_pago INT NOT NULL,
    id_pedido INT NOT NULL,
    FOREIGN KEY (id_medio_pago)
        REFERENCES Medio_de_pago (id_medio_pago),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
);

CREATE TABLE Promocion (
    id_promocion INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    valor_descuento INT NOT NULL,
    dias_de_semana DATE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
)

CREATE TABLE tiene_está (
    id_producto INT NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_pedido , id_producto),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
)

CREATE TABLE estadentro_tiene (
    id_promocion INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_promocion , id_producto),
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_producto)
        REFERENCES Producto (id_producto)
)

CREATE TABLE asignado_tiene (
    id_promocion INT NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_pedido , id_promocion),
    FOREIGN KEY (id_promocion)
        REFERENCES Promocion (id_promocion),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido)
)

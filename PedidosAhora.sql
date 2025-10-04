CREATE DATABASE PedidosAhora;
USE PedidosAhora;

CREATE TABLE Comercio
(
  id_comercio INT PRIMARY KEY ,
  direccion INT NOT NULL,
  nombre INT NOT NULL,
  telefono INT NOT NULL,
  categoria INT NOT NULL,
  horario_atencion INT NOT NULL
);

CREATE TABLE Usuario
(
  id_usuario INT PRIMARY KEY,
  apellido INT NOT NULL,
  domicilio INT NOT NULL,
  correo_electronico INT NOT NULL,
  nombre INT NOT NULL,
  telefono INT NOT NULL,
  fecha_alta INT NOT NULL
);

CREATE TABLE Medio_de_Transporte
(
  id_transporte INT PRIMARY KEY,
  nombre INT NOT NULL
);

CREATE TABLE Turno
(
  id_turno INT PRIMARY KEY,
  nombre INT NOT NULL,
  hora_inicio INT NOT NULL,
  hora_fin INT NOT NULL,
  dia INT NOT NULL
);

CREATE TABLE Repartidor
(
  id_repartidor INT PRIMARY KEY,
  nombre INT NOT NULL,
  apellido INT NOT NULL,
  id_transporte INT NOT NULL,
  FOREIGN KEY (id_transporte) REFERENCES Medio_de_Transporte(id_transporte),
  id_turno INT NOT NULL,
  FOREIGN KEY (id_turno) REFERENCES Turno(id_turno)
);

CREATE TABLE Valoracion
(
  fecha INT NOT NULL,
  id_valoracion INT PRIMARY KEY,
  comentario_comercio INT NOT NULL,
  puntuacion_comercio INT NOT NULL,
  comentario_repartidor INT NOT NULL,
  puntuacion_repartidor INT NOT NULL
);

CREATE TABLE Pedido
(
  id_pedido INT PRIMARY KEY,
  estado INT NOT NULL,
  domicilio INT NOT NULL,
  id_comercio INT NOT NULL,
  id_usuario INT NOT NULL,
  id_repartidor INT NOT NULL,
  id_valoracion INT NOT NULL,
  FOREIGN KEY (id_comercio) REFERENCES Comercio(id_comercio),
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_repartidor) REFERENCES Repartidor(id_repartidor),
  FOREIGN KEY (id_valoracion) REFERENCES Valoracion(id_valoracion)
);

CREATE TABLE Producto
(
  id_producto INT PRIMARY KEY,
  precio INT NOT NULL,
  nombre INT NOT NULL,
  id_comercio INT NOT NULL,
  FOREIGN KEY (id_comercio) REFERENCES Comercio(id_comercio)
);

CREATE TABLE Medio_de_pago
(
  id_medio_pago INT PRIMARY KEY,
  nombre INT NOT NULL
);

CREATE TABLE Pago
(
  pagado INT NOT NULL,
  id_pago INT Primary KEY,
  id_medio_pago INT NOT NULL,
  id_pedido INT NOT NULL,
  FOREIGN KEY (id_medio_pago) REFERENCES Medio_de_pago(id_medio_pago),
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Promocion
(
  id_promocion INT PRIMARY KEY,
  nombre INT NOT NULL,
  valor_descuento INT NOT NULL,
  dias_de_semana INT NOT NULL,
  fecha_inicio INT NOT NULL,
  fecha_final INT NOT NULL
);

CREATE TABLE tiene_está
(
  id_producto INT NOT NULL,
  id_pedido INT NOT NULL,
  PRIMARY KEY (id_pedido, id_producto),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE estadentro_tiene
(
  id_promocion INT NOT NULL,
  id_producto INT NOT NULL,
  PRIMARY KEY (id_promocion, id_producto),
  FOREIGN KEY (id_promocion) REFERENCES Promocion(id_promocion),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE asignado_tiene
(
  id_promocion INT NOT NULL,
  id_pedido INT NOT NULL,
  PRIMARY KEY (id_pedido, id_promocion),
  FOREIGN KEY (id_promocion) REFERENCES Promocion(id_promocion),
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

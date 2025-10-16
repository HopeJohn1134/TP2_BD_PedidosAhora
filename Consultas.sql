USE PedidosAhora;

-- consultas de los indices
-- index comercios
SHOW INDEX FROM Comercio;
-- index productos
SHOW INDEX FROM Producto;
-- index usuarios
SHOW INDEX FROM Usuario;
-- index repartidors
SHOW INDEX FROM Repartidor;
-- index de promociones
SHOW INDEX FROM Promocion;


-- 1) 10 comercios con mas valoracion(por valoracion)
SELECT
	C.id_comercio AS IDComercio,
    C.nombre AS NombreComercio,
    CC.categoria AS Categoria,
    TRUNCATE(AVG(V.puntuacion_comercio), 2) AS PuntuacionPromedio
FROM
    Comercio C
        JOIN CategoriaComercio CC ON C.id_categoria = CC.id_categoria
        JOIN Pedido P ON C.id_comercio = P.id_comercio
        JOIN Valoracion V ON P.id_pedido = V.id_pedido
WHERE
    C.eliminado = FALSE
GROUP BY C.id_comercio , C.nombre , CC.categoria
ORDER BY PuntuacionPromedio DESC
LIMIT 10;

-- 2) Productos que tienen promociones activas ordenados por valor del descuento
SELECT 
	PR.id_producto AS IdProducto,
    PR.nombre AS NombreProducto,
    PR.precio AS PrecioOriginal,
    PO.nombre AS NombrePromocion,
    PO.porcentaje_descuento AS Descuento
FROM
    Producto PR
        JOIN
    PromocionXProducto PP ON PR.id_producto = PP.id_producto
        JOIN
    Promocion PO ON PP.id_promocion = PO.id_promocion
WHERE
    PR.eliminado = FALSE
        AND PP.eliminado = FALSE
        AND PO.eliminado = FALSE
        AND NOW() BETWEEN PO.fecha_inicio AND PO.fecha_final
ORDER BY Descuento DESC;


-- 3) Cantidad Total de Productos Vendidos por Categoría de Comercio
SELECT 
    CC.categoria AS CategoriaComercio,
    SUM(PXP.cantidad) AS TotalUnidadesVendidas
FROM
    CategoriaComercio CC
        JOIN
    Comercio C ON CC.id_categoria = C.id_categoria
        JOIN
    Pedido P ON C.id_comercio = P.id_comercio
        JOIN
    ProductoXPedido PXP ON P.id_pedido = PXP.id_pedido
WHERE
    CC.eliminado = FALSE
        AND C.eliminado = FALSE
GROUP BY CC.categoria
ORDER BY TotalUnidadesVendidas DESC;

-- 4) Repartidores con una puntuación promedio superior a 4 estrellas

SELECT
    R.nombre,
    R.apellido,
    TRUNCATE(AVG(V.puntuacion_repartidor), 2) AS PuntuacionPromedioRepartidor,
    COUNT(V.id_valoracion) AS TotalValoraciones
FROM
    Repartidor R
JOIN
    Pedido P ON R.id_repartidor = P.id_repartidor
JOIN
    Valoracion V ON P.id_pedido = V.id_pedido
WHERE
    R.eliminado = FALSE
GROUP BY
    R.id_repartidor, R.nombre, R.apellido
HAVING
    AVG(V.puntuacion_repartidor) > 4.0
ORDER BY
    PuntuacionPromedioRepartidor ASC;

-- 5) comentarios de los pedidos cancelados
SELECT
    V.id_valoracion,
    P.id_pedido,
    E.estado AS EstadoPedido,
    V.comentario_comercio,
    V.puntuacion_comercio,
    V.comentario_repartidor,
    V.puntuacion_repartidor,
    V.fecha AS FechaValoracion
FROM
    Pedido P
JOIN
    EstadoDelPedido E ON P.id_estado = E.id_estado
LEFT JOIN
    Valoracion V ON P.id_pedido = V.id_pedido -- LEFT JOIN para incluir pedidos cancelados incluso sin valoración
WHERE
    E.estado = 'CANCELADO' -- Asumiendo que existe un estado 'CANCELADO'
ORDER BY
    P.id_pedido DESC;
    
-- 6) comercios abiertos en el horario actual
SET lc_time_names = 'es_ES';
SELECT
	C.id_comercio AS ID,
    C.nombre AS NombreComercio,
    C.direccion,
    H.dia_de_semana,
    H.hora_entrada,
    H.hora_salida
FROM
    Comercio C
JOIN
    HorarioXComercio HC ON C.id_comercio = HC.id_comercio
JOIN
    Horario H ON HC.id_horario = H.id_horario
WHERE
    C.eliminado = FALSE
    AND HC.eliminado = FALSE
    AND H.eliminado = FALSE
    AND H.dia_de_semana = UPPER(DAYNAME(NOW()))
    AND TIME(NOW()) BETWEEN H.hora_entrada AND H.hora_salida 
ORDER BY
    C.nombre;

-- 7) repartidores llevando un pedido (pedido con estado: EN_CAMINO)
SELECT
    R.nombre AS NombreRepartidor,
    R.apellido AS ApellidoRepartidor,
    MT.tipo AS MedioTransporte,
    COUNT(P.id_pedido) AS CantidadPedidosEnRuta
FROM
    Repartidor R
JOIN
    MedioDeTransporte MT ON R.id_transporte = MT.id_transporte
JOIN
    Pedido P ON R.id_repartidor = P.id_repartidor
JOIN
    EstadoDelPedido E ON P.id_estado = E.id_estado
WHERE
    R.eliminado = FALSE
    AND E.estado = 'EN_CAMINO' -- Asumiendo el estado
GROUP BY
    R.id_repartidor, R.nombre, R.apellido, MT.tipo
ORDER BY
    CantidadPedidosEnRuta DESC;
    
-- 8) lista de los productos mas vendidos de las ultimas 24hs
SELECT
    PR.nombre AS NombreProducto,
    C.nombre AS NombreComercio,
    SUM(PXP.cantidad) AS TotalUnidadesVendidas
FROM
    ProductoXPedido PXP
JOIN
    Producto PR ON PXP.id_producto = PR.id_producto
JOIN
    Pedido P ON PXP.id_pedido = P.id_pedido
JOIN
    Comercio C ON PR.id_comercio = C.id_comercio
WHERE
    P.fecha_pedido >= DATE_SUB(NOW(), INTERVAL 24 HOUR) -- Condición: Pedidos en las últimas 24 horas
GROUP BY
    PR.id_producto, PR.nombre, C.nombre
ORDER BY
    TotalUnidadesVendidas DESC
LIMIT 5;

-- 9) medios de pago mas usado (cantidad de pagos hechos mayor a menor)
SELECT
    MP.nombre AS MedioDePago,
    COUNT(PG.id_pago) AS TotalUsos,
    ROUND(
        COUNT(PG.id_pago) / 
        (SELECT COUNT(*) FROM Pago) * 100, 2
    ) AS PorcentajeUso
FROM MedioDePago MP
LEFT JOIN Pago PG ON MP.id_medio_pago = PG.id_medio
GROUP BY MP.id_medio_pago, MP.nombre
ORDER BY TotalUsos DESC;

-- 10) 5 promociones que mas se usaron (activa e inactivas)
SELECT 
    C.id_comercio,
    C.nombre,
    SUM(PXP.cantidad * PXP.precio_unitario) AS TotalVendido
FROM
    Comercio C
JOIN
    Pedido P ON C.id_comercio = P.id_comercio
JOIN
    ProductoXPedido PXP ON P.id_pedido = PXP.id_pedido
WHERE
    C.eliminado = FALSE
GROUP BY
    C.id_comercio, C.nombre
HAVING
    TotalVendido > (
        SELECT AVG(TotalPorComercio)
        FROM (
            SELECT 
                SUM(PXP2.cantidad * PXP2.precio_unitario) AS TotalPorComercio
            FROM 
                Pedido P2
            JOIN 
                ProductoXPedido PXP2 ON P2.id_pedido = PXP2.id_pedido
            GROUP BY 
                P2.id_comercio
        ) AS Subconsulta
    )
ORDER BY 
    TotalVendido DESC;





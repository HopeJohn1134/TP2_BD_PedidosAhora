-- consultas de los indices
-- consulta comercios por categoria
SELECT * FROM Comercio WHERE id_categoria = ? AND eliminado = FALSE;
-- consulta productos por comercio
SELECT * FROM Producto WHERE id_comercio = ? AND eliminado = FALSE;
-- consulta pedido por usuario
SELECT * FROM Pedido WHERE id_usuario = ? ORDER BY fecha_pedido DESC;
-- consulta repartidor por tipo transporte
SELECT * FROM Repartidor WHERE id_transporte = ? AND eliminado = FALSE;
-- consulta de promociones activa
SELECT * FROM Promocion WHERE NOW() BETWEEN fecha_inicio AND fecha_final AND eliminado = FALSE;


-- 1) 10 comercios con mas valoracion
SELECT
    C.nombre AS NombreComercio,
    CC.categoria AS Categoria,
    TRUNCATE(AVG(V.puntuacion_comercio), 2) AS PuntuacionPromedio
FROM
    Comercio C
JOIN
    CategoriaComercio CC ON C.id_categoria = CC.id_categoria
JOIN
    Pedido P ON C.id_comercio = P.id_comercio
JOIN
    Valoracion V ON P.id_pedido = V.id_pedido
WHERE
    C.eliminado = FALSE
GROUP BY
    C.id_comercio, C.nombre, CC.categoria
HAVING
    AVG(V.puntuacion_comercio) >= ( -- Subconsulta para filtrar por un promedio mínimo aceptable (ej: 4.0)
        SELECT AVG(puntuacion_comercio) FROM Valoracion
    )
ORDER BY
    PuntuacionPromedio DESC
LIMIT 10;

-- 2) Productos que tienen promociones activas ordenados por valor del descuento
SELECT
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
    AND NOW() BETWEEN PO.fecha_inicio AND PO.fecha_final -- Condición Lógica de fecha
ORDER BY
    Descuento DESC;

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
GROUP BY
    CC.categoria
ORDER BY
    TotalUnidadesVendidas DESC;

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
-- 6) comercios abiertos en el horario actual
-- 7) repartidores llevando un pedido (pedido con estado: EN_CAMINO)
-- 8) lista de los productos mas vendidos de las ultimas 24hs
-- 9) medio de pago mas usado (cantidad de pagos hechos)
-- 10) promociones que mas se usaron (activa e inactivas)








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
--

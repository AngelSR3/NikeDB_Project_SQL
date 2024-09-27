USE nikedb;

---------------------------------------------------------
-- TODOS LOS PRODUCTOS DEL INVENTARIO
---------------------------------------------------------
SELECT * FROM productos;
--#######################################################


---------------------------------------------------------
-- CATEGORÍA ZAPATILLAS
---------------------------------------------------------
SELECT * 
FROM productos pr
JOIN categoriaproducto cp ON pr.id_producto = cp.id_producto
JOIN categoria ca ON cp.id_categoria = ca.id_categoria
WHERE ca.nombre = "zapatos";
--#######################################################


---------------------------------------------------------
-- Productos precio mayor a 100.000
---------------------------------------------------------
SELECT id_producto, nombre, precio
FROM productos
WHERE productos.precio > 100000;
--#######################################################


---------------------------------------------------------
-- Productos de color Negro 
---------------------------------------------------------
SELECT id_producto, nombre, talla, color
FROM productos
WHERE productos.color = "Negro";
--#######################################################


---------------------------------------------------------
-- Productos con menos de 15 unidades en stock
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto 
WHERE prin.cantidad_disponible <= 15;
--#######################################################


---------------------------------------------------------
-- Productos con calificación en 5
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, rs.calificación
FROM productos pr
JOIN resenasprod rs ON rs.id_producto = pr.id_producto
WHERE rs.calificación = 5;
--#######################################################


---------------------------------------------------------
-- Ver detalles de cada producto dando su ID
---------------------------------------------------------
SELECT *
FROM productos pr
WHERE pr.id_producto = 1; --ESTE NUM ES EL ID A BUSCAR
--#######################################################


---------------------------------------------------------
-- Contar el número total de productos en cada categoria
---------------------------------------------------------
SELECT cat.nombre AS categoria, COUNT(cp.id_producto) AS toal_productos
FROM categoria cat
JOIN categoriaproducto cp ON cat.id_categoria = cp.id_categoria
GROUP BY cat.nombre;
--#######################################################


---------------------------------------------------------
-- Mostrar productos talla M
---------------------------------------------------------
SELECT id_producto, nombre, talla
FROM productos pr
WHERE pr.talla = "M";
--#######################################################


---------------------------------------------------------
-- Mostrar clientes registrados
---------------------------------------------------------
SELECT id_clientes, nombre, email, telefono
FROM clientes cl;
--#######################################################


---------------------------------------------------------
-- Buscar cliente por correo
---------------------------------------------------------
SELECT id_clientes, email, nombre
FROM clientes cl
WHERE cl.email = "juanc123z@gmail.com"; --Correo a buscar
--#######################################################


---------------------------------------------------------
-- Clientes que han realizado al menos un pedido
---------------------------------------------------------
SELECT DISTINCT cl.id_clientes, cl.nombre
FROM clientes cl
JOIN pedidos pd ON cl.id_clientes = pd.id_cliente;
--#######################################################


---------------------------------------------------------
-- Consultar datos de un cliente especifico
---------------------------------------------------------
SELECT id_clientes, nombre, email, telefono
FROM clientes
WHERE id_clientes = 1; --Este num es el Id a buscar
--#######################################################


---------------------------------------------------------
-- Clientes que tienen más de 2 pedidos
---------------------------------------------------------
SELECT cl.id_clientes, cl.nombre, COUNT(pd.id_pedido) AS cantidad_pedidos
FROM clientes cl
JOIN pedidos pd ON cl.id_clientes = pd.id_cliente
GROUP BY cl.id_clientes, cl.nombre
HAVING COUNT(pd.id_pedido)>2; --Cantidad de pedidos
--#######################################################


---------------------------------------------------------
-- Clientes con 0 pedidos
---------------------------------------------------------
SELECT cl.id_clientes, cl.nombre
FROM clientes cl
LEFT JOIN pedidos pd ON cl.id_clientes = pd.id_cliente
WHERE pd.id_pedido IS NULL;
--#######################################################


---------------------------------------------------------
-- Clientes que han comprado productos de categoria Camisa
---------------------------------------------------------
SELECT cl.id_clientes, cl.nombre
FROM clientes cl
JOIN pedidos pd ON cl.id_clientes = pd.id_cliente
JOIN productospedidos prp ON prp.id_pedido = pd.id_pedido
JOIN productos pr ON prp.id_producto = pr.id_producto
JOIN categoriaproducto catp ON  pr.id_producto = catp.id_producto
JOIN categoria cat ON catp.id_categoria = cat.id_categoria
WHERE cat.nombre = "camisas"; --"camisas" es la categoria 
--#######################################################


---------------------------------------------------------
-- Clientes con pedidos pendientes de pago
---------------------------------------------------------
SELECT cl.id_clientes, cl.nombre, pd.id_pedido
FROM clientes cl
JOIN pedidos pd ON pd.id_cliente = cl.id_clientes
WHERE pd.estado = "pendiente";
--#######################################################


---------------------------------------------------------
-- Pedidos en un rango de fechas
---------------------------------------------------------
SELECT * 
FROM pedidos
WHERE fecha_pedido BETWEEN "2024-01-01" AND "2024-05-01";
--#######################################################


---------------------------------------------------------
-- Ver un pedido especifico
---------------------------------------------------------
SELECT id_pedido, id_cliente, estado, total, direccion_envio 
FROM pedidos pd
WHERE id_pedido = 17; --Id del pedido a verificar
--#######################################################


---------------------------------------------------------
-- Pedidos en estado pendiente
---------------------------------------------------------
SELECT id_pedido, estado
FROM pedidos
WHERE estado = "pendiente";
--#######################################################


---------------------------------------------------------
-- Total dinero generado en un lapso de tiempo
---------------------------------------------------------
SELECT SUM(total) AS total_ventas_entre_Fechas
FROM pedidos
WHERE fecha_pedido BETWEEN "2024-01-01" AND "2024-05-01";
--#######################################################


---------------------------------------------------------
-- Pedidos realizados por un cliente dando su ID
---------------------------------------------------------
SELECT pd.id_pedido, pd.estado, pd.total, cl.nombre, cl.id_clientes
FROM pedidos pd
JOIN clientes cl ON pd.id_cliente = cl.id_clientes
WHERE cl.id_clientes = 1;
--#######################################################


---------------------------------------------------------
-- Productos de un pedido especifico
---------------------------------------------------------
SELECT pd.id_pedido, pr.nombre
FROM pedidos pd
JOIN productospedidos prp ON prp.id_pedido = pd.id_pedido
JOIN productos pr ON prp.id_producto = pr.id_producto
WHERE pd.id_pedido = 1; --Id del pedido a revisar
--#######################################################


---------------------------------------------------------
-- Mostrar el pedido de mayor precio en la DB
---------------------------------------------------------
SELECT id_pedido, total
FROM pedidos
WHERE total = (SELECT MAX(total) FROM pedidos);
--#######################################################


---------------------------------------------------------
-- Pedidos que tengan productos de categorias
---------------------------------------------------------
SELECT pd.id_pedido, pr.nombre, cat.nombre AS Categoria
FROM pedidos pd
JOIN productospedidos prp ON pd.id_pedido = prp.id_pedido
JOIN productos pr ON prp.id_producto = pr.id_producto
JOIN categoriaproducto catp ON pr.id_producto = catp.id_producto
JOIN categoria cat ON catp.id_categoria = cat.id_categoria
WHERE cat.nombre = "camisas";
--#######################################################


---------------------------------------------------------
-- Cantidad disponible de producto especifico
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
WHERE pr.id_producto = 17;
--#######################################################


---------------------------------------------------------
-- Ver que productos hay en cada inventario
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, inv.nombre
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
JOIN inventario inv ON inv.id_inventario = prin.id_inventario
WHERE inv.id_inventario = 2; --ID de inventario 1 o 2
--#######################################################


---------------------------------------------------------
-- Productos que tienen mas de 30 unidades en inventario
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
WHERE prin.cantidad_disponible > 30;
--#######################################################


---------------------------------------------------------
-- Productos a punto de agotarse o agotados
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
WHERE prin.cantidad_disponible < 3;
--#######################################################


---------------------------------------------------------
-- Inventario al que pertenece producto especifico
---------------------------------------------------------
SELECT pr.id_producto, pr.nombre, inv.nombre
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
JOIN inventario inv ON inv.id_inventario = prin.id_inventario
WHERE pr.id_producto = 5; --ID del producto a revisar
--#######################################################


---------------------------------------------------------
-- Cantidad de productos vendidos en rango de fechas
---------------------------------------------------------
SELECT COUNT(pr.id_producto) AS Productos_vendidos
FROM productos pr
JOIN productospedidos prp ON pr.id_producto = prp.id_producto
JOIN pedidos pd ON prp.id_pedido = pd.id_pedido
WHERE pd.fecha_pedido BETWEEN "2024-01-01" AND "2024-02-28";
--#######################################################


---------------------------------------------------------
-- Paises disponibles para la tienda
---------------------------------------------------------
SELECT *
FROM pais;
--#######################################################


---------------------------------------------------------
-- Ciudades disponibles
---------------------------------------------------------
SELECT *
FROM ciudad;
--#######################################################


---------------------------------------------------------
-- Ciudad de cada Pais disponible
---------------------------------------------------------
SELECT cd.nombre, ps.nombre
FROM pais ps
JOIN ciudad cd ON ps.id_pais = cd.id_pais;
--#######################################################


---------------------------------------------------------
-- Mostrar todas las tiendas
---------------------------------------------------------
SELECT *
FROM tienda;
--#######################################################


---------------------------------------------------------
-- Mostrar cada tienda con su inventario
---------------------------------------------------------
SELECT td.id_tienda, td.nombre AS tienda, inv.nombre AS Inventario
FROM tienda td
JOIN inventario inv ON td.id_inventario = inv.id_inventario;
--#######################################################


---------------------------------------------------------
-- Mostrar ubicación de todas tienda
---------------------------------------------------------
SELECT td.nombre, cd.nombre, ub.direccion
FROM tienda td
JOIN ubicacion ub ON ub.id_ubicacion = td.id_ubicación
JOIN ciudad cd ON ub.id_ciudad = cd.id_ciudad;
--#######################################################


---------------------------------------------------------
-- Mostrar cantidad total de tiendas en el sistema
---------------------------------------------------------
SELECT COUNT(*) AS total_tiendas
FROM tienda;
--#######################################################


---------------------------------------------------------
-- Mostrar favoritos de cada cliente
---------------------------------------------------------
SELECT cl.id_clientes, cl.nombre, pr.nombre
FROM clientes cl
JOIN favoritos fv ON cl.id_clientes = fv.id_clientes
JOIN favoritosproductos fvpr ON fvpr.id_favoritos = fv.id_favoritos
JOIN productos pr ON fvpr.id_producto = pr.id_producto
WHERE cl.id_clientes = 2; -- Favoritos del usuario con ID X
--#######################################################


---------------------------------------------------------
-- Productos que tienen más de una categoria
---------------------------------------------------------
SELECT p.id_producto, p.nombre, COUNT(cp.id_categoria) AS num_categorias
FROM productos p
JOIN categoriaproducto cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
HAVING COUNT(cp.id_categoria) > 1;
--#######################################################
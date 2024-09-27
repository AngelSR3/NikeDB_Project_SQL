###### 🛸AsmvProject🛸

---
# Bienvenido a Tienda Nike 👽️
⚠️➡︎ Base de datos relacional de Tiendas Nike hecha con SQL

---
## Tabla de contenidos 📋
- [Tecnologías usadas](#Tecnologías)
- [Funcionalidad](#Funcionalidad)
- [Autor/es](#Autor)
---
## 👽️Hecho por:
- [Arley Mantilla](#Autor)
- [Angel Simanca](#Autor)
- [AsmvProjects](#AsmvProjects)

---
## Tecnologías📱
- SQL
- StarUML
- VisualStudioCode

---
## Funcionalidad💭
> [!IMPORTANT]  
> Funcionalidades educativas únicamente
- Gestionar base de datos de tienda NIKE
- Crear, eliminar y editar datos
---
## Explicación de tablas
### Consultas
- 1. Obtener todos los productos disponibles en inventario.
```SQL
SELECT * FROM productos;
```
- 2. Listar los productos de la categoría "Zapatillas".
```SQL
SELECT * 
FROM productos pr
JOIN categoriaproducto cp ON pr.id_producto = cp.id_producto
JOIN categoria ca ON cp.id_categoria = ca.id_categoria
WHERE ca.nombre = "zapatos";
```
- 3. Mostrar los productos con un precio mayor a $100.
```SQL
SELECT id_producto, nombre, precio
FROM productos
WHERE productos.precio > 100000;
```
- 4. Buscar productos de color "Negro" disponibles en la tienda.
```SQL
SELECT id_producto, nombre, talla, color
FROM productos
WHERE productos.color = "Negro";
```
- 5. Listar los productos que tienen menos de 10 unidades en stock.
```SQL
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto 
WHERE prin.cantidad_disponible <= 15;
```
- 6. Consultar los productos que tienen una calificación mayor a 4 estrellas.
```SQL
SELECT pr.id_producto, pr.nombre, rs.calificación
FROM productos pr
JOIN resenasprod rs ON rs.id_producto = pr.id_producto
WHERE rs.calificación = 5;
```
- 7. Ver los detalles de un producto específico dado su id.
```SQL
SELECT *
FROM productos pr
WHERE pr.id_producto = 1; --ESTE NUM ES EL ID A BUSCAR
```
- 8. Contar el número total de productos en cada categoría.
```SQL
SELECT cat.nombre AS categoria, COUNT(cp.id_producto) AS toal_productos
FROM categoria cat
JOIN categoriaproducto cp ON cat.id_categoria = cp.id_categoria
GROUP BY cat.nombre;
```
- 9. Mostrar los productos de la talla "M".
```SQL
SELECT id_producto, nombre, talla
FROM productos pr
WHERE pr.talla = "M";
```

### Consultas sobre clientes:
- 10. Obtener todos los clientes registrados.
```SQL
SELECT id_clientes, nombre, email, telefono
FROM clientes cl;
```
- 11. Buscar un cliente por su correo electrónico.
```SQL
SELECT id_clientes, email, nombre
FROM clientes cl
WHERE cl.email = "juanc123z@gmail.com"; --Correo a buscar
```
- 12. Listar los clientes que han realizado al menos un pedido.
```SQL
SELECT DISTINCT cl.id_clientes, cl.nombre
FROM clientes cl
JOIN pedidos pd ON cl.id_clientes = pd.id_cliente;
```
- 13. Consultar los detalles de un cliente específico (nombre, dirección, etc.).
```SQL
SELECT id_clientes, nombre, email, telefono
FROM clientes
WHERE id_clientes = 1; --Este num es el Id a buscar
```
- 14. Listar los clientes que tienen más de 2 pedidos.
```SQL
SELECT cl.id_clientes, cl.nombre, COUNT(pd.id_pedido) AS cantidad_pedidos
FROM clientes cl
JOIN pedidos pd ON cl.id_clientes = pd.id_cliente
GROUP BY cl.id_clientes, cl.nombre
HAVING COUNT(pd.id_pedido)>2; --Cantidad de pedidos
```
- 15. Mostrar los clientes que no han hecho ningún pedido.
```SQL
SELECT cl.id_clientes, cl.nombre
FROM clientes cl
LEFT JOIN pedidos pd ON cl.id_clientes = pd.id_cliente
WHERE pd.id_pedido IS NULL;
```
- 16. Consultar los clientes que compraron productos de la categoría "Camisas".
```SQL
SELECT cl.id_clientes, cl.nombre
FROM clientes cl
JOIN pedidos pd ON cl.id_clientes = pd.id_cliente
JOIN productospedidos prp ON prp.id_pedido = pd.id_pedido
JOIN productos pr ON prp.id_producto = pr.id_producto
JOIN categoriaproducto catp ON  pr.id_producto = catp.id_producto
JOIN categoria cat ON catp.id_categoria = cat.id_categoria
WHERE cat.nombre = "camisas"; --"camisas" es la categoria
```
- 17. Mostrar los clientes con pedidos pendientes de pago.
```SQL
SELECT cl.id_clientes, cl.nombre, pd.id_pedido
FROM clientes cl
JOIN pedidos pd ON pd.id_cliente = cl.id_clientes
WHERE pd.estado = "pendiente";
```
### Consultas sobre pedidos:
- 18. Obtener todos los pedidos realizados en un rango de fechas.
```SQL
SELECT * 
FROM pedidos
WHERE fecha_pedido BETWEEN "2024-01-01" AND "2024-05-01";
```
- 19. Ver los detalles de un pedido específico.
```SQL
SELECT id_pedido, id_cliente, estado, total, direccion_envio 
FROM pedidos pd
WHERE id_pedido = 17; --Id del pedido a verificar
```
- 20. Listar los pedidos que aún están en estado "Pendiente".
```SQL
SELECT id_pedido, estado
FROM pedidos
WHERE estado = "pendiente";
```
- 21. Consultar el total de ventas generadas en un día específico.
```SQL
SELECT SUM(total) AS total_ventas_entre_Fechas
FROM pedidos
WHERE fecha_pedido BETWEEN "2024-01-01" AND "2024-05-01";
```
- 22. Listar todos los pedidos de un cliente dado su id.
```SQL
SELECT pd.id_pedido, pd.estado, pd.total, cl.nombre, cl.id_clientes
FROM pedidos pd
JOIN clientes cl ON pd.id_cliente = cl.id_clientes
WHERE cl.id_clientes = 1;
```
- 23. Consultar los productos asociados a un pedido específico.
```SQL
SELECT pd.id_pedido, pr.nombre
FROM pedidos pd
JOIN productospedidos prp ON prp.id_pedido = pd.id_pedido
JOIN productos pr ON prp.id_producto = pr.id_producto
WHERE pd.id_pedido = 1; --Id del pedido a revisar
```
- 24. Mostrar el pedido de mayor valor en el sistema.
```SQL
SELECT id_pedido, total
FROM pedidos
WHERE total = (SELECT MAX(total) FROM pedidos);
```
- 25. Listar los pedidos que contienen productos de la categoría "Camisas".
```SQL
SELECT pd.id_pedido, pr.nombre, cat.nombre AS Categoria
FROM pedidos pd
JOIN productospedidos prp ON pd.id_pedido = prp.id_pedido
JOIN productos pr ON prp.id_producto = pr.id_producto
JOIN categoriaproducto catp ON pr.id_producto = catp.id_producto
JOIN categoria cat ON catp.id_categoria = cat.id_categoria
WHERE cat.nombre = "camisas";
```

### Consultas sobre inventario:
- 26. Mostrar el stock disponible de un producto específico.
```SQL
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
WHERE pr.id_producto = 17;
```
- 27. Consultar el total de productos disponibles en el inventario.
```SQL
SELECT pr.id_producto, pr.nombre, inv.nombre
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
JOIN inventario inv ON inv.id_inventario = prin.id_inventario
WHERE inv.id_inventario = 2; --ID de inventario 1 o 2
```
- 28. Listar los productos cuya cantidad en inventario es mayor a 30 unidades.
```SQL
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
WHERE prin.cantidad_disponible > 30;
```
- 29. Consultar los productos que están a punto de agotarse (menos de 3 unidades).
```SQL
SELECT pr.id_producto, pr.nombre, prin.cantidad_disponible
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
WHERE prin.cantidad_disponible < 3;
```
- 30. Ver la ubicación de almacenamiento de un producto específico.
```SQL
SELECT pr.id_producto, pr.nombre, inv.nombre
FROM productos pr
JOIN productosinventario prin ON pr.id_producto = prin.id_producto
JOIN inventario inv ON inv.id_inventario = prin.id_inventario
WHERE pr.id_producto = 5; --ID del producto a revisar
```
- 31. Mostrar cuántos productos fueron vendidos en un rango de fechas.
```SQL
SELECT COUNT(pr.id_producto) AS Productos_vendidos
FROM productos pr
JOIN productospedidos prp ON pr.id_producto = prp.id_producto
JOIN pedidos pd ON prp.id_pedido = pd.id_pedido
WHERE pd.fecha_pedido BETWEEN "2024-01-01" AND "2024-02-28";
```

### Consultas sobre paises:
- 32. Mostrar los paises en los que existen tiendas 
```SQL
SELECT *
FROM pais;
```
- 33. Mostrar las ciudades en las que hay tiendas
```SQL
SELECT *
FROM ciudad;
```
- 34. Mostrar cada pais con su respectiva ciudad
```SQL
SELECT cd.nombre, ps.nombre
FROM pais ps
JOIN ciudad cd ON ps.id_pais = cd.id_pais;
```

### Consultas sobre tiendas:
- 35. Mostrar todas las tiendas disponibles
```SQL
SELECT *
FROM tienda;
```
- 36. Mostrar inventario de cada tienda
```SQL
SELECT td.id_tienda, td.nombre AS tienda, inv.nombre AS Inventario
FROM tienda td
JOIN inventario inv ON td.id_inventario = inv.id_inventario;
```
- 37. Mostrar ubicación de cada tienda
```SQL
SELECT td.nombre, cd.nombre, ub.direccion
FROM tienda td
JOIN ubicacion ub ON ub.id_ubicacion = td.id_ubicación
JOIN ciudad cd ON ub.id_ciudad = cd.id_ciudad;
```
- 38. Mostrar cantidad total de tiendas en el sistema
```SQL
SELECT COUNT(*) AS total_tiendas
FROM tienda;
```

### OTRAS
- 39. Mostrar favoritos de cada cliente
```SQL
SELECT cl.id_clientes, cl.nombre, pr.nombre
FROM clientes cl
JOIN favoritos fv ON cl.id_clientes = fv.id_clientes
JOIN favoritosproductos fvpr ON fvpr.id_favoritos = fv.id_favoritos
JOIN productos pr ON fvpr.id_producto = pr.id_producto
WHERE cl.id_clientes = 2; -- Favoritos del usuario con ID X
```
- 40. Mostrar productos con mas de una categoria
```SQL
SELECT p.id_producto, p.nombre, COUNT(cp.id_categoria) AS num_categorias
FROM productos p
JOIN categoriaproducto cp ON p.id_producto = cp.id_producto
GROUP BY p.id_producto, p.nombre
HAVING COUNT(cp.id_categoria) > 1;
```
---
## Autor👨‍💻
#### "Codifica tus sueños"
> Arley Mantilla
- Email : 		Arleydev14@gmail.com
- LinkedIn : 	www.linkedin.com/in/arleydev14
- GitHub :		https://github.com/ArleyDev14

> Angel Simanca
- Email : 		Angelduvan1016@gmail.com
- LinkedIn : 	www.linkedin.com/in/Angelsr3
- GitHub :		https://github.com/AngelSR3
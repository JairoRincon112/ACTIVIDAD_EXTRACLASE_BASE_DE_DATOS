-- ===========================================
-- CONSULTAS COMPLEJAS
-- ===========================================

-- 1. Pedidos con cliente y empleado asignado
SELECT p.id_pedido, c.nombre AS cliente, e.nombres AS empleado, p.fecha, p.estado, p.total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN empleados e ON p.id_empleado = e.id_empleado;

-- 2. Productos vendidos en cada pedido
SELECT dp.id_pedido, pr.nombre AS producto, dp.cantidad, dp.subtotal
FROM detalle_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto;

-- 3. Pagos con datos del cliente
SELECT pg.id_pago, pg.metodo_pago, pg.monto, c.nombre AS cliente, pg.fecha_pago
FROM pagos pg
JOIN pedidos p ON pg.id_pedido = p.id_pedido
JOIN clientes c ON p.id_cliente = c.id_cliente;

-- 4. Total de ventas por cliente
SELECT c.nombre, SUM(p.total) AS total_gastado
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
GROUP BY c.nombre;

-- 5. Inventario por producto
SELECT pr.nombre, i.lote, i.vencimiento, i.stock
FROM inventario i
JOIN productos pr ON i.id_inventario = pr.id_inventario;

-- 6. Cantidad de productos vendidos por marca
SELECT m.nombre AS marca, SUM(dp.cantidad) AS total_vendidos
FROM detalle_pedidos dp
JOIN productos pr ON dp.id_producto = pr.id_producto
JOIN marcas m ON pr.id_marca = m.id_marca
GROUP BY m.nombre;

-- 7. Pedidos pendientes con detalle de cliente
SELECT p.id_pedido, c.nombre, p.estado, p.total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE p.estado = 'Pendiente';

-- 8. Empleado con más pedidos registrados
SELECT e.nombres, e.apellidos, COUNT(p.id_pedido) AS pedidos_registrados
FROM empleados e
JOIN pedidos p ON e.id_empleado = p.id_empleado
GROUP BY e.nombres, e.apellidos
ORDER BY pedidos_registrados DESC
LIMIT 1;

-- 9. Proveedor con más productos registrados
SELECT prov.nombre, COUNT(pr.id_producto) AS productos_suministrados
FROM proveedores prov
JOIN productos pr ON prov.id_proveedor = pr.id_proveedor
GROUP BY prov.nombre
ORDER BY productos_suministrados DESC;

-- 10. Clientes y sus últimos pedidos
SELECT c.nombre, p.numero_factura, p.fecha, p.total
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
ORDER BY p.fecha DESC;

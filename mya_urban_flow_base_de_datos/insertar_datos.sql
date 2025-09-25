-- ===========================================
-- CLIENTES 
-- ===========================================
INSERT INTO clientes (documento, email, telefono, nombre, direccion) VALUES
('1001', 'ana@gmail.com', '3001111111', 'Ana Torres', 'Cra 10 #23-45'),
('1002', 'luis@gmail.com', '3002222222', 'Luis Pérez', 'Cl 50 #12-30'),
('1003', 'sofia@gmail.com', '3003333333', 'Sofía Díaz', 'Cra 7 #89-12'),
('1004', 'javier@gmail.com', '3004444444', 'Javier López', 'Cra 15 #21-09'),
('1005', 'marta@gmail.com', '3005555555', 'Marta Ramírez', 'Cl 100 #50-15'),
('1006', 'camilo@gmail.com', '3006666666', 'Camilo Suárez', 'Cra 8 #34-20');

-- ===========================================
-- CATEGORIAS 
-- ===========================================
INSERT INTO categorias (nombre, descripcion) VALUES
('Deportivos', 'Zapatillas para running y deporte'),
('Casuales', 'Zapatos casuales para uso diario'),
('Formales', 'Zapatos elegantes para eventos');

-- ===========================================
-- MARCAS 
-- ===========================================
INSERT INTO marcas (nombre, pais_origen) VALUES
('Nike', 'EEUU'),
('Adidas', 'Alemania'),
('Puma', 'Alemania');

-- ===========================================
-- PROVEEDORES 
-- ===========================================
INSERT INTO proveedores (nit, nombre, email, telefono) VALUES
('9001', 'Distribuidora Norte', 'dnorte@gmail.com', '601111111'),
('9002', 'Proveedor Central', 'pcentral@gmail.com', '602222222'),
('9003', 'Global Shoes', 'gshoes@gmail.com', '603333333');

-- ===========================================
-- INVENTARIO 
-- ===========================================
INSERT INTO inventario (lote, vencimiento, stock) VALUES
('L001', '2026-01-01', 100),
('L002', '2026-06-15', 150),
('L003', '2026-12-30', 200),
('L004', '2027-03-10', 120),
('L005', '2027-08-25', 90);

-- ===========================================
-- PRODUCTOS 
-- ===========================================
INSERT INTO productos (sku, nombre, talla, color, precio, stock, id_categoria, id_marca, id_proveedor, id_inventario) VALUES
('SKU001', 'Nike Air Zoom', '42', 'Negro', 350000, 50, 1, 1, 1, 1),
('SKU002', 'Adidas Ultraboost', '40', 'Blanco', 400000, 70, 1, 2, 2, 2),
('SKU003', 'Puma RS-X', '41', 'Rojo', 320000, 80, 2, 3, 3, 3),
('SKU004', 'Nike Revolution', '39', 'Azul', 280000, 40, 1, 1, 1, 4),
('SKU005', 'Adidas Stan Smith', '43', 'Verde', 300000, 60, 2, 2, 2, 5),
('SKU006', 'Puma Suede', '42', 'Gris', 270000, 35, 2, 3, 3, 1);

-- ===========================================
-- EMPLEADOS 
-- ===========================================
INSERT INTO empleados (documento, email, nombres, apellidos, cargo) VALUES
('2001', 'maria.ventas@gmail.com', 'Maria', 'Gómez', 'Vendedora'),
('2002', 'jose.admin@gmail.com', 'Jose', 'Martínez', 'Administrador'),
('2003', 'carla.logistica@gmail.com', 'Carla', 'López', 'Logística');

-- ===========================================
-- PEDIDOS 
-- ===========================================
INSERT INTO pedidos (id_cliente, id_empleado, fecha, estado, direccion, total, numero_factura) VALUES
(1, 1, '2025-09-01', 'Enviado', 'Cra 10 #23-45', 700000, 'FAC001'),
(2, 2, '2025-09-05', 'Pendiente', 'Cl 50 #12-30', 400000, 'FAC002'),
(3, 3, '2025-09-10', 'Entregado', 'Cra 7 #89-12', 350000, 'FAC003'),
(4, 1, '2025-09-15', 'Enviado', 'Cra 15 #21-09', 600000, 'FAC004'),
(5, 2, '2025-09-20', 'Pendiente', 'Cl 100 #50-15', 300000, 'FAC005');

-- ===========================================
-- DETALLE_PEDIDOS 
-- ===========================================
INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 2, 350000, 700000),
(2, 2, 1, 400000, 400000),
(3, 3, 1, 350000, 350000),
(4, 4, 2, 300000, 600000),
(5, 5, 1, 300000, 300000);

-- ===========================================
-- PAGOS 
-- ===========================================
INSERT INTO pagos (id_pedido, metodo_pago, monto, fecha_pago, referencia_transaccion) VALUES
(1, 'Tarjeta Crédito', 700000, '2025-09-02', 'TRX001'),
(2, 'Nequi', 400000, '2025-09-06', 'TRX002'),
(3, 'Efectivo', 350000, '2025-09-11', 'TRX003'),
(4, 'Tarjeta Débito', 600000, '2025-09-16', 'TRX004'),
(5, 'Daviplata', 300000, '2025-09-21', 'TRX005');

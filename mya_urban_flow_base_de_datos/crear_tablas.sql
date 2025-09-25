-- ===========================================
-- CREACIÓN DE TABLAS PARA MYA URBAN FLOW
-- ===========================================

-- TABLA CLIENTES
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    documento VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150)
);

-- TABLA CATEGORIAS
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT
);

-- TABLA MARCAS
CREATE TABLE marcas (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    pais_origen VARCHAR(100)
);

-- TABLA PROVEEDORES
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nit VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

-- TABLA INVENTARIO
CREATE TABLE inventario (
    id_inventario SERIAL PRIMARY KEY,
    lote VARCHAR(50) UNIQUE NOT NULL,
    vencimiento DATE,
    stock INT NOT NULL
);

-- TABLA PRODUCTOS
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    sku VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    talla VARCHAR(10),
    color VARCHAR(30),
    precio NUMERIC(10,2) NOT NULL,
    stock INT DEFAULT 0,
    id_categoria INT REFERENCES categorias(id_categoria),
    id_marca INT REFERENCES marcas(id_marca),
    id_proveedor INT REFERENCES proveedores(id_proveedor),
    id_inventario INT REFERENCES inventario(id_inventario)
);

-- TABLA EMPLEADOS
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    documento VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)
);

-- TABLA PEDIDOS
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_empleado INT REFERENCES empleados(id_empleado),
    fecha DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    direccion VARCHAR(150),
    total NUMERIC(12,2) NOT NULL,
    numero_factura VARCHAR(30) UNIQUE NOT NULL
);

-- TABLA DETALLE_PEDIDOS
CREATE TABLE detalle_pedidos (
    id_detalle_pedido SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido),
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL
);

-- TABLA PAGOS
CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido),
    metodo_pago VARCHAR(50) NOT NULL,
    monto NUMERIC(12,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    referencia_transaccion VARCHAR(50) UNIQUE NOT NULL
);

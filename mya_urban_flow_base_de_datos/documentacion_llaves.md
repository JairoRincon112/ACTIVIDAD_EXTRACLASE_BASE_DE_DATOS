# 📌 Documentación de Llaves — Mya Urban Flow

## CLIENTES
- **PK:** id_cliente  
- **UK:** documento, email, telefono  

## CATEGORIAS
- **PK:** id_categoria  
- **UK:** nombre  

## MARCAS
- **PK:** id_marca  
- **UK:** nombre  

## PROVEEDORES
- **PK:** id_proveedor  
- **UK:** nit, email  

## INVENTARIO
- **PK:** id_inventario  
- **UK:** lote  

## PRODUCTOS
- **PK:** id_producto  
- **UK:** sku  
- **FK:** id_categoria → categorias(id_categoria)  
- **FK:** id_marca → marcas(id_marca)  
- **FK:** id_proveedor → proveedores(id_proveedor)  
- **FK:** id_inventario → inventario(id_inventario)  

## EMPLEADOS
- **PK:** id_empleado  
- **UK:** documento, email  

## PEDIDOS
- **PK:** id_pedido  
- **UK:** numero_factura  
- **FK:** id_cliente → clientes(id_cliente)  
- **FK:** id_empleado → empleados(id_empleado)  

## DETALLE_PEDIDOS
- **PK:** id_detalle_pedido  
- **FK:** id_pedido → pedidos(id_pedido)  
- **FK:** id_producto → productos(id_producto)  

## PAGOS
- **PK:** id_pago  
- **UK:** referencia_transaccion  
- **FK:** id_pedido → pedidos(id_pedido)  

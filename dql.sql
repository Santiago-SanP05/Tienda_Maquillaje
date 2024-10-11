USE Veci_tienda;

-- 1. Listar todos los productos de cosméticos de un tipo específico (por ejemplo, "labial").
DELIMITER $$
CREATE PROCEDURE Listar_Producto_Especifico(IN Tipo_Seleccionado VARCHAR(50))
BEGIN
	SELECT p.Nombre_producto, t.Nombre_tipo, p.Descripcion, p.Precio, p.Stock
	FROM Productos p
	JOIN Tipos t ON p.ID_tipo = t.ID_Tipo
	JOIN Categorias c ON p.ID_categoria = c.ID_Categoria
	WHERE t.Nombre_tipo = Tipo_Seleccionado;
END $$
DELIMITER ;

-- 6. Consultar el stock disponible de un producto por su nombre o identificador.
DELIMITER //
CREATE PROCEDURE ConsultarStock(IN p_nombre_producto VARCHAR(100), IN p_id_producto INT)
BEGIN
    SELECT Nombre_producto, Stock
    FROM Productos
    WHERE (Nombre_producto = p_nombre_producto OR ID_Producto = p_id_producto)
    AND (p_nombre_producto IS NOT NULL OR p_id_producto IS NOT NULL);
END //

DELIMITER ;

-- 7. Mostrar las órdenes de compra realizadas a un proveedor específico en el último año.

DELIMITER //

CREATE PROCEDURE MostrarOrdenesPorProveedor(IN p_id_proveedor INT)
BEGIN
    SELECT *
    FROM Orden_proveedores
    WHERE ID_proveedor = p_id_proveedor
    AND Fecha_Orden >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

DELIMITER ;



-- 8. Listar los empleados que han trabajado más de un año en la tienda.


DELIMITER //

CREATE PROCEDURE ListarEmpleadosAntiguedad()
BEGIN
    SELECT *
    FROM Empleados
    WHERE Fecha_Contratacion <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

DELIMITER ;


-- 9. Obtener la cantidad total de productos vendidos en un día específico.


DELIMITER //

CREATE PROCEDURE CantidadTotalVendidaPorFecha(IN p_fecha DATE)
BEGIN
    SELECT SUM(Ventas_Productos.Cantidad) AS Total_Vendido
    FROM Ventas_Productos
    JOIN Ventas ON Ventas_Productos.ID_venta = Ventas.ID_Venta
    WHERE Ventas.Fecha_venta = p_fecha;
END //

DELIMITER ;


-- 10 Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron.

DELIMITER //

CREATE PROCEDURE ConsultarVentasProducto(IN p_nombre_producto VARCHAR(100),IN p_id_producto INT)
BEGIN
    SELECT p.Nombre_producto, SUM(vp.Cantidad) AS Unidades_Vendidas
    FROM Ventas_Productos vp
    JOIN Productos p ON vp.ID_producto = p.ID_Producto
    JOIN Ventas v ON vp.ID_venta = v.ID_Venta
    WHERE (p.Nombre_producto = p_nombre_producto OR p.ID_producto = p_id_producto)
    AND (p_nombre_producto IS NOT NULL OR p_id_producto IS NOT NULL)
    GROUP BY p.Nombre_producto;
END //

DELIMITER ;

-- LLAMADOS DE CONSULTAS

--1.
CALL Listar_Producto_Especifico('Labial');
--2.
SELECT p.Nombre_producto, p.Descripcion, p.Precio, p.Stock
FROM Productos p
JOIN Categorias c ON p.ID_categoria = c.ID_Categoria
WHERE c.Categoria = 'Cosméticos'  -- Cambia esta categoría según lo necesites
AND p.Stock < 200; 
--3.
SELECT v.ID_Venta, v.Fecha_venta, c.Nombre_Completo, e.Nombre_Empleado
FROM Ventas v
JOIN Clientes c ON v.ID_cliente = c.ID_Cliente
JOIN Empleados e ON v.ID_empleado = e.ID_Empleado
WHERE c.Nombre_Completo = 'María García'
AND v.Fecha_venta BETWEEN '2024-10-01' AND '2024-10-12'; 
--4.
SELECT e.Nombre_Empleado, COUNT(v.ID_Venta) AS Total_Ventas
FROM Ventas v
JOIN Empleados e ON v.ID_empleado = e.ID_Empleado
WHERE e.Nombre_Empleado = 'Laura Gómez'  
AND MONTH(v.Fecha_venta) = 10  
AND YEAR(v.Fecha_venta) = 2024  
GROUP BY e.Nombre_Empleado;
--5.
SELECT
	P.Nombre_producto as Producto,
    VP.Cantidad as CantidadProducto
 FROM Productos P
 JOIN Ventas_Productos VP ON P.ID_Producto = VP.ID_producto
 ORDER BY (VP.Cantidad) DESC;
--6.
CALL ConsultarStock('Labial Rouge', NULL);
--7.
CALL MostrarOrdenesPorProveedor(1);
--8.
CALL ListarEmpleadosAntiguedad();
--9.
CALL CantidadTotalVendidaPorFecha('2024-10-10');
--10
CALL ConsultarVentasProducto(NULL, 1);
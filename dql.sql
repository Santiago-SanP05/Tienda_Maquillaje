USE Veci_tienda;

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

CALL Listar_Producto_Especifico('Labial');

-- ----------------------------------------------------------------

SELECT p.Nombre_producto, p.Descripcion, p.Precio, p.Stock
FROM Productos p
JOIN Categorias c ON p.ID_categoria = c.ID_Categoria
WHERE c.Categoria = 'Cosméticos'  -- Cambia esta categoría según lo necesites
AND p.Stock < 200; 


SELECT v.ID_Venta, v.Fecha_venta, c.Nombre_Completo, e.Nombre_Empleado
FROM Ventas v
JOIN Clientes c ON v.ID_cliente = c.ID_Cliente
JOIN Empleados e ON v.ID_empleado = e.ID_Empleado
WHERE c.Nombre_Completo = 'María García'  -- Cambia este nombre por el cliente específico
AND v.Fecha_venta BETWEEN '2024-10-01' AND '2024-10-12';  -- Cambia el rango de fechas según lo necesites
USE Veci_tienda;

INSERT INTO Tipos (Nombre_tipo) 
VALUES 
('Labial'), 
('Base de maquillaje'), 
('Sombra de ojos'), 
('Cuidado de la piel'), 
('Perfume'), 
('Accesorios');

INSERT INTO Categorias (Categoria) 
VALUES 
('Cosméticos'), 
('Cuidado de la piel'), 
('Perfumes'), 
('Accesorios');

INSERT INTO Productos (Nombre_producto, Descripcion, Precio, Stock, ID_tipo, ID_categoria) 
VALUES 
('Labial Rouge', 'Labial rojo intenso con acabado mate', 15, 200, 1, 1), 
('Base de Maquillaje Natural', 'Base de maquillaje líquida para todo tipo de piel', 25, 100, 2, 1),
('Sombra de Ojos Neutra', 'Paleta de sombras con tonos neutros', 20, 150, 3, 1),
('Crema Hidratante', 'Crema facial hidratante para piel seca con ácido hialurónico', 30, 50, 4, 2),
('Perfume Floral', 'Perfume con aroma floral y notas de jazmín', 50, 80, 5, 3),
('Collar de Plata', 'Collar con dije en forma de estrella hecho de plata', 45, 30, 6, 4);

INSERT INTO Clientes (Nombre_Completo, Correo, Direccion, Telefono) 
VALUES 
('María García', 'maria.garcia@example.com', 'Calle Madrid 45', 612345678),
('Carlos Fernández', 'carlos.fernandez@example.com', 'Av. Barcelona 67', 634567890),
('Lucía Pérez', 'lucia.perez@example.com', 'Calle Valencia 89', 678901234);

INSERT INTO Area_Trabajo (Nombre_Empleado) 
VALUES 
('Ventas'), 
('Bodega'), 
('Administración');

INSERT INTO Puesto_Trabajo (Nombre_Puesto) 
VALUES 
('Asesor de belleza'), 
('Encargado de stock'), 
('Administrador');

INSERT INTO Empresa (Nombre_Empresa) 
VALUES 
('Veci Cosméticos');

INSERT INTO Empleados (Nombre_Empleado, Fecha_Contratacion, ID_area, ID_puesto, ID_empresa) 
VALUES 
('Laura Gómez', '2023-03-10', 1, 1, 1),
('Javier López', '2022-09-20', 2, 2, 1),
('Ana Torres', '2021-07-15', 3, 3, 1);

INSERT INTO Ventas (Fecha_venta, ID_cliente, ID_empleado) 
VALUES 
('2024-10-10', 1, 1),
('2024-10-11', 2, 2),
('2024-10-12', 3, 3);

INSERT INTO Ventas_Productos (Cantidad, ID_producto, ID_venta) 
VALUES 
(2, 1, 1),  -- Cliente 1 compró 2 unidades de Labial Rouge
(1, 4, 2),  -- Cliente 2 compró 1 unidad de Crema Hidratante
(1, 5, 3);  -- Cliente 3 compró 1 unidad de Perfume Floral


INSERT INTO Contacto (Nombre_Contacto) 
VALUES 
('Luis Fernández'), 
('Rosa López');

INSERT INTO Proveedores (Nombre_Proveedor, Telefono, Direccion, ID_contacto) 
VALUES 
('Cosméticos Global', 612345987, 'Polígono Industrial 45', 1),
('Belleza Natural', 609876543, 'Calle Comercial 8', 2);

INSERT INTO Orden_proveedores (Fecha_Orden, Cantidad_Ordenada, Cantidad_Entregado, ID_proveedor, ID_empresa, ID_producto) 
VALUES 
('2024-10-05', 500, 480, 1, 1, 1),  -- Orden de Labial Rouge
('2024-10-06', 300, 300, 2, 1, 4);  -- Orden de Crema Hidratante

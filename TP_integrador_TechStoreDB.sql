-- CREACIÓN BASE DE DATOS
create database techstore_db;
use techstore_db;

-- CREACIÓN TABLAS 

create table categorias(
id_categoria int primary key auto_increment,
nombre varchar (50) not null
);

create table productos(
id_producto int primary key auto_increment,
nombre varchar(50) not null,
descripcion varchar(100),
precio double not null check(precio>=0),
id_categoria int,
stock int not null check(stock>=0)
);

create table clientes(
id_cliente int primary key auto_increment,
nombre varchar(50) not null,
direccion varchar(100),
correo varchar(50) not null,
telefono varchar(20) 
);

create table productos_pedidos(
id_producto_pedido int primary key auto_increment,
id_producto int,
cantidad_pedida int check(cantidad_pedida>0)
);

create table pedidos(
id_pedido int primary key auto_increment,
fecha date not null,
estado varchar(50) not null,
metodo_pago varchar(50) not null,
id_cliente int,
id_producto_pedido int
);

create table compras_clientes(
id_compra_cliente int primary key auto_increment,
id_cliente int,
id_pedido int,
fecha date not null
);

create table proveedores(
id_proveedor int primary key auto_increment,
nombre varchar(50) not null,
direccion varchar(100),
correo varchar(50) not null,
telefono varchar(20) 
);

create table productos_comprados_prov(
id_producto_comprado_prov int primary key auto_increment,
id_producto int,
cantidad_comprada int check(cantidad_comprada>0)
);

create table compras_proveedores(
id_compra_proveedor int primary key auto_increment,
fecha date not null,
id_proveedor int,
id_producto_comprado_prov int
);


-- INSERTS DE REGISTROS

insert into categorias (nombre) values
('Teléfonos móviles'),
('Laptops'),
('Tablets'),
('Accesorios'),
('Audio'),
('Video'),
('Gaming'),
('Smart Home'),
('Wearables'),
('Periféricos');

insert into productos (nombre, descripcion, precio, id_categoria, stock) values
('iPhone 14', 'Teléfono móvil de Apple', 999.99, 1, 50),
('Samsung Galaxy S21', 'Teléfono móvil de Samsung', 799.99, 1, 40),
('MacBook Pro', 'Laptop de Apple', 1999.99, 2, 30),
('Dell XPS 13', 'Laptop de Dell', 1499.99, 2, 25),
('iPad Pro', 'Tablet de Apple', 899.99, 3, 35),
('Samsung Galaxy Tab S7', 'Tablet de Samsung', 649.99, 3, 20),
('AirPods Pro', 'Auriculares de Apple', 249.99, 4, 60),
('JBL Flip 5', 'Altavoz Bluetooth', 119.99, 5, 45),
('Sony WH-1000XM4', 'Auriculares con cancelación de ruido', 349.99, 5, 30),
('Google Nest Hub', 'Pantalla inteligente de Google', 129.99, 8, 40),
('KeyBoard RedDragon Kumara', 'Teclado LED gamer', 400.99, 7, 6);

insert into clientes (nombre, direccion, correo, telefono) values
('Juan Pérez', 'Calle Falsa 123', 'juan.perez@gmail.com', '5551234567'),
('María López', 'Av. Siempre Viva 456', 'maria.lopez@gmail.com', '5557654321'),
('Carlos Sánchez', 'Calle 7 #89', 'carlos.sanchez@gmail.com', '5559876543'),
('Ana Gómez', 'Calle del Sol 234', 'ana.gomez@gmail.com', '5556543210'),
('Luis Rodríguez', 'Av. Principal 789', 'luis.rodriguez@gmail.com', '5553210987'),
('Laura Fernández', 'Calle Luna 567', 'laura.fernandez@gmail.com', '5552109876'),
('Miguel Torres', 'Calle Estrella 678', 'miguel.torres@gmail.com', '5554321098'),
('Andrea Martínez', 'Av. Central 890', 'andrea.martinez@gmail.com', '5558765432'),
('David García', 'Calle Nueva 123', 'david.garcia@gmail.com', '5551230987'),
('Sofía Díaz', 'Av. Las Flores 456', 'sofia.diaz@gmail.com', '5557650987'),
('Pedro González', 'Calle Ocaso 321', 'pedro.gonzalez@gmail.com', '5554321987'),
('Lucía Martínez', 'Av. Los Álamos 654', 'lucia.martinez@gmail.com', '5558761234'),
('Diego Ramos', 'Calle Norte 789', 'diego.ramos@gmail.com', '5553219876'),
('Sara Méndez', 'Av. Sur 123', 'sara.mendez@gmail.com', '5556547890'),
('Raúl Sánchez', 'Calle Este 456', 'raul.sanchez@gmail.com', '5557891234'),
('Elena García', 'Av. Oeste 789', 'elena.garcia@gmail.com', '5558769876'),
('Gabriel Torres', 'Calle Larga 234', 'gabriel.torres@gmail.com', '5554327890'),
('Patricia Díaz', 'Av. Cortada 567', 'patricia.diaz@gmail.com', '5557654321'),
('Javier López', 'Calle Principal 890', 'javier.lopez@gmail.com', '5550987654'),
('Cristina Rodríguez', 'Av. Secundaria 012', 'cristina.rodriguez@gmail.com', '5555678901'),
('Manuel Herrera', 'Calle Sol 123', 'manuel.herrera@gmail.com', '5551112233'),
('Alicia Pérez', 'Av. Libertad 456', 'alicia.perez@gmail.com', '5552223344'),
('Fernando Ríos', 'Calle Mar 789', 'fernando.rios@gmail.com', '5553334455'),
('Marta Campos', 'Av. Esperanza 101', 'marta.campos@gmail.com', '5554445566'),
('Daniel Vega', 'Calle Luna 202', 'daniel.vega@gmail.com', '5555556677'),
('Carla Muñoz', 'Av. Paz 303', 'carla.munoz@gmail.com', '5556667788'),
('Oscar Rivera', 'Calle Arco Iris 404', 'oscar.rivera@gmail.com', '5557778899'),
('Rosa Flores', 'Av. Horizonte 505', 'rosa.flores@gmail.com', '5558889900'),
('Jorge Morales', 'Calle Horizonte 606', 'jorge.morales@gmail.com', '5559990011'),
('Natalia Navarro', 'Av. Nuevo Amanecer 707', 'natalia.navarro@gmail.com', '5550001122');

insert into productos_pedidos (id_producto, cantidad_pedida) values
(1, 2),
(4, 1),
(3, 1),
(5, 2),
(2, 1),
(7, 1),
(6, 1),
(8, 3),
(9, 1),
(10, 2),
(3, 3),
(4, 2),
(5, 1),
(6, 4),
(7, 2),
(8, 1),
(9, 3),
(10, 4),
(1, 2),
(2, 3),
(6, 5),
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(4, 2),
(7, 3),
(3, 1),
(2, 4),
(1, 2),
(3, 3),
(4, 2),
(5, 1),
(6, 4),
(7, 2),
(8, 1),
(9, 3),
(10, 4),
(1, 2),
(2, 3),
(6, 5),
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(4, 2),
(7, 3),
(3, 1),
(2, 4),
(1, 2);

insert into pedidos (fecha, estado, metodo_pago, id_cliente, id_producto_pedido) values
('2020-01-15', 'pendiente', 'tarjeta', 1, 1),
('2020-05-22', 'enviado', 'paypal', 2,2),
('2021-03-13', 'entregado', 'transferencia', 3,5),
('2021-07-24', 'cancelado', 'efectivo', 4,3),
('2022-02-09', 'pendiente', 'tarjeta', 5,6),
('2022-08-19', 'enviado', 'paypal', 6,4),
('2023-04-14', 'entregado', 'transferencia', 7,8),
('2023-11-05', 'cancelado', 'efectivo', 8,7),
('2024-06-18', 'pendiente', 'tarjeta', 9,9),
('2024-01-10', 'enviado', 'paypal', 10,10),
('2020-04-12', 'pendiente', 'tarjeta', 1, 3),
('2020-08-18', 'enviado', 'paypal', 2, 4),
('2021-01-22', 'entregado', 'transferencia', 3, 5),
('2021-01-22', 'pendiente', 'tarjeta', 4, 6),
('2022-04-17', 'pendiente', 'tarjeta', 5, 7),
('2022-10-25', 'enviado', 'paypal', 6, 8),
('2023-02-09', 'entregado', 'transferencia', 7, 9),
('2023-02-09', 'cancelado', 'efectivo', 8, 10),
('2024-03-15', 'pendiente', 'tarjeta', 9, 1),
('2024-05-10', 'enviado', 'paypal', 10, 2),
('2024-03-15', 'entregado', 'transferencia', 1, 11),
('2024-05-10', 'pendiente', 'tarjeta', 2, 12),
('2020-01-15', 'pendiente', 'tarjeta', 1, 1),
('2020-05-22', 'enviado', 'paypal', 2, 2),
('2021-03-13', 'entregado', 'transferencia', 3, 3),
('2021-03-13', 'pendiente', 'tarjeta', 4, 4),
('2022-08-19', 'enviado', 'paypal', 5, 5),
('2023-04-14', 'entregado', 'transferencia', 6, 6),
('2023-04-14', 'cancelado', 'efectivo', 7, 7),
('2024-06-18', 'pendiente', 'tarjeta', 8, 8),
('2024-06-18', 'enviado', 'paypal', 9, 9),
('2024-01-10', 'entregado', 'transferencia', 10, 10),
('2023-04-14', 'pendiente', 'tarjeta', 1, 11),
('2024-01-10', 'enviado', 'paypal', 2, 12),
('2024-06-18', 'cancelado', 'efectivo', 3, 13),
('2021-03-13', 'entregado', 'transferencia', 4, 14),
('2023-04-14', 'pendiente', 'tarjeta', 5, 15),
('2023-07-19', 'entregado', 'tarjeta', 11, 13),
('2023-07-22', 'enviado', 'paypal', 12, 14),
('2023-07-25', 'pendiente', 'transferencia', 13, 15),
('2023-08-02', 'pendiente', 'tarjeta', 14, 16),
('2023-08-02', 'enviado', 'paypal', 15, 17),
('2023-08-05', 'entregado', 'transferencia', 16, 18),
('2023-08-08', 'cancelado', 'efectivo', 17, 19),
('2023-08-11', 'pendiente', 'tarjeta', 18, 20),
('2023-08-14', 'enviado', 'paypal', 19, 21),
('2023-08-17', 'entregado', 'transferencia', 20, 22),
('2023-08-20', 'pendiente', 'tarjeta', 11, 23),
('2023-08-23', 'enviado', 'paypal', 12, 24),
('2023-08-26', 'entregado', 'transferencia', 13, 25),
('2023-08-29', 'pendiente', 'tarjeta', 14, 26),
('2023-09-01', 'enviado', 'paypal', 15, 27),
('2023-09-04', 'entregado', 'transferencia', 16, 28),
('2023-09-07', 'cancelado', 'efectivo', 17, 29),
('2023-09-10', 'pendiente', 'tarjeta', 18, 30),
('2023-09-13', 'enviado', 'paypal', 19, 31),
('2023-09-16', 'entregado', 'transferencia', 20, 32),
('2023-09-19', 'pendiente', 'tarjeta', 11, 33),
('2023-09-22', 'enviado', 'paypal', 12, 34),
('2023-09-25', 'entregado', 'transferencia', 13, 35),
('2023-09-28', 'pendiente', 'tarjeta', 14, 36),
('2023-10-01', 'enviado', 'paypal', 15, 37),
('2023-10-04', 'entregado', 'transferencia', 16, 38),
('2023-10-07', 'cancelado', 'efectivo', 17, 39),
('2023-10-10', 'pendiente', 'tarjeta', 18, 40),
('2023-10-13', 'enviado', 'paypal', 19, 41),
('2023-10-16', 'entregado', 'transferencia', 20, 42);

insert into compras_clientes (id_cliente, id_pedido, fecha) values
(1, 1, '2020-01-15'),
(2, 2, '2020-05-22'),
(3, 3, '2021-03-13'),
(4, 4, '2021-07-24'),
(5, 5, '2022-02-09'),
(6, 6, '2022-08-19'),
(7, 7, '2023-04-14'),
(8, 8, '2023-11-05'),
(9, 9, '2024-06-18'),
(10, 10, '2024-01-10'),
(1, 3, '2020-04-12'),
(2, 4, '2020-08-18'),
(3, 5, '2021-01-22'),
(4, 6, '2021-01-22'),
(5, 7, '2022-04-17'),
(6, 8, '2022-10-25'),
(7, 9, '2023-02-09'),
(8, 10, '2023-02-09'),
(9, 1, '2024-03-15'),
(10, 2, '2024-05-10'),
(1, 11, '2024-03-15'),
(2, 12, '2024-05-10'),
(1, 1, '2020-01-15'),
(2, 2, '2020-05-22'),
(3, 3, '2021-03-13'),
(4, 4, '2021-03-13'),
(5, 5, '2022-08-19'),
(6, 6, '2023-04-14'),
(7, 7, '2023-04-14'),
(8, 8, '2024-06-18'),
(9, 9, '2024-06-18'),
(10, 10, '2024-01-10'),
(1, 11, '2023-04-14'),
(2, 12, '2024-01-10'),
(3, 13, '2024-06-18'),
(4, 14, '2021-03-13'),
(5, 15, '2023-04-14'),
(11, 13, '2023-07-19'),
(12, 14, '2023-07-22'),
(13, 15, '2023-07-25'),
(14, 16, '2023-08-02'),
(15, 17, '2023-08-02'),
(16, 18, '2023-08-05'),
(17, 19, '2023-08-08'),
(18, 20, '2023-08-11'),
(19, 21, '2023-08-14'),
(20, 22, '2023-08-17'),
(11, 23, '2023-08-20'),
(12, 24, '2023-08-23'),
(13, 25, '2023-08-26'),
(14, 26, '2023-08-29'),
(15, 27, '2023-09-01'),
(16, 28, '2023-09-04'),
(17, 29, '2023-09-07'),
(18, 30, '2023-09-10'),
(19, 31, '2023-09-13'),
(20, 32, '2023-09-16'),
(11, 33, '2023-09-19'),
(12, 34, '2023-09-22'),
(13, 35, '2023-09-25'),
(14, 36, '2023-09-28'),
(15, 37, '2023-10-01'),
(16, 38, '2023-10-04'),
(17, 39, '2023-10-07'),
(18, 40, '2023-10-10'),
(19, 41, '2023-10-13'),
(20, 42, '2023-10-16');

insert into proveedores (nombre, direccion, correo, telefono) values
('Anyways Insumos', 'Calle Principal 123', 'anywayinsumos@gmail.com', '5551112222'),
('ElectroMisiones', 'Av. Secundaria 456', 'electromisiones@gmail.com', '5553334444'),
('Fravega', 'Calle Tercera 789', 'fravega@gmail.com', '5555556666'),
('Cetrogar', 'Av. Cuarta 012', 'cetrogar@gmail.com', '5557778888'),
('Musimundo', 'Calle Quinta 345', 'musimundo@gmail.com', '5559990000'),
('Megatone', 'Av. Sexta 678', 'megatone@gmail.com', '5551113333'),
('La anónima', 'Calle Séptima 901', 'laanonima@gmail.com', '5554446666'),
('Naldo', 'Av. Octava 234', 'naldo@gmail.com', '5557779999'),
('VGH', 'Calle Novena 567', 'vghoficial@gmail.com', '5550001111'),
('CompraGamer', 'Av. Décima 890', 'compragamer@gmail.com', '5552223333');

insert into productos_comprados_prov (id_producto, cantidad_comprada) values
(1, 10),
(2, 15),
(3, 20),
(4, 25),
(5, 30),
(6, 35),
(7, 40),
(8, 45),
(9, 50),
(10, 55),
(3, 15),
(4, 20),
(5, 25),
(6, 30),
(7, 35),
(8, 40),
(9, 45),
(10, 50),
(1, 55),
(2, 60),
(4, 30),
(7, 45),
(2, 35),
(5, 50),
(1, 60),
(3, 15),
(4, 20),
(5, 25),
(6, 30),
(7, 35),
(8, 40),
(9, 45),
(10, 50),
(1, 55),
(2, 60),
(4, 30),
(7, 45),
(2, 35),
(5, 50),
(1, 60);

insert into compras_proveedores (fecha, id_proveedor, id_producto_comprado_prov) values
('2020-02-20', 1, 1),
('2020-06-25', 2, 2),
('2021-04-10', 3, 3),
('2021-08-30', 4, 4),
('2022-03-15', 5, 5),
('2022-09-22', 6, 6),
('2023-05-18', 7, 7),
('2023-12-03', 8, 8),
('2024-07-14', 9, 9),
('2024-12-25', 10, 10),
('2020-02-20', 1, 1),
('2020-06-25', 2, 2),
('2021-01-14', 3, 3),
('2021-01-14', 4, 4),
('2022-05-19', 5, 5),
('2022-11-23', 6, 6),
('2023-03-18', 7, 7),
('2023-03-18', 8, 8),
('2024-04-20', 9, 9),
('2024-07-15', 10, 10),
('2024-04-20', 1, 11),
('2024-07-15', 2, 12),
('2020-02-20', 1, 1),
('2020-06-25', 2, 2),
('2021-01-14', 3, 3),
('2021-01-14', 4, 4),
('2022-05-19', 5, 5),
('2022-11-23', 6, 6),
('2023-03-18', 7, 7),
('2023-03-18', 8, 8),
('2024-04-20', 9, 9),
('2024-07-15', 10, 10),
('2024-04-20', 1, 11),
('2024-07-15', 2, 12);

-- CONSULTAS
-- (1)Cantidad de pedidos mensuales
select year(p.fecha) as Anio, month(p.fecha) as Mes, count(*) as Cant_pedidos
from pedidos p
group by year(p.fecha), month(p.fecha)
order by Anio, Mes;

-- (2)Cantidad mensual pedida de cada artículo
select year(p.fecha) as Anio, month(p.fecha) as Mes, pr.id_producto as Articulo, 
sum(pp.cantidad_pedida) as Cantidad_Mensual_Producto_Pedida 
from pedidos p
join productos_pedidos pp on p.id_producto_pedido = pp.id_producto_pedido
join productos pr on pp.id_producto = pr.id_producto
group by year(p.fecha), month(p.fecha), pr.id_producto, pr.nombre;

-- (3)Ranking de artículos
select pr.id_producto as Id_Articulo, pr.nombre as Nombre_Articulo, year(p.fecha) as Anio, month(p.fecha) as Mes,  
sum(pp.cantidad_pedida) as Cantidad_Producto_Pedida 
from pedidos p
join productos_pedidos pp on p.id_producto_pedido = pp.id_producto_pedido
join productos pr on pp.id_producto = pr.id_producto
group by year(p.fecha), month(p.fecha), pr.id_producto, pr.nombre
order by Cantidad_Producto_Pedida desc;

-- (4)Clientes con más pedidos realizados
select c.id_cliente as Id_Cliente, c.nombre as Nombre_Cliente, count(p.id_pedido) as Cantidad_pedidos
from clientes c 
join pedidos p on c.id_cliente = p.id_cliente
group by c.id_cliente
order by Cantidad_pedidos desc;

-- (5)Ingreso mensual total por ventas
select year(p.fecha) as Anio, month(p.fecha) as Mes, sum(pr.precio* pp.cantidad_pedida) as Ingreso_Mensual_Ventas
from pedidos p 
join productos_pedidos pp on p.id_producto_pedido = pp.id_producto_pedido
join productos pr on pp.id_producto = pr.id_producto
group by Anio, Mes
order by Anio, Mes;

-- (6)Producto con stock bajo (menos de 10 unidades)
select pr.nombre as Producto, pr.stock as Stock_Disponible 
from productos pr
where stock < 10;

-- (7)Pedidos pendientes de entrega
select p.id_pedido as id_Pedido, p.id_cliente as id_Cliente, c.nombre as Nombre_Cliente, p.fecha as Fecha_del_pedido
from pedidos p 
join clientes c on p.id_cliente = c.id_cliente
where p.estado = 'pendiente';

-- (8)Productos más vendidos por categoría
select c.nombre as Categoria, pr.id_producto as Id_Producto,pr.nombre as Producto, sum(pp.cantidad_pedida) as Cantidad_Vendida
from categorias c
join productos pr on c.id_categoria = pr.id_categoria
join productos_pedidos pp on pr.id_producto = pp.id_producto
join pedidos p on pp.id_producto_pedido = p.id_producto_pedido
group by c.id_categoria, pr.id_producto
order by c.nombre, Cantidad_Vendida desc;

-- (9)Proveedores con más productos suministrados
select prov.id_proveedor as Id_Proveedor, prov.nombre as Nombre_Proveedor, sum(pcp.cantidad_comprada)as Cant_Prod_Suministrados
from proveedores prov
join compras_proveedores cp on prov.id_proveedor = cp.id_proveedor 
join productos_comprados_prov pcp on cp.id_producto_comprado_prov=pcp.id_producto_comprado_prov   
group by prov.id_proveedor
order by Cant_Prod_Suministrados desc;

-- (10)Historial de compras de un cliente específico, ordenada desde la más reciente a la más antigua:
-- Dado un ID de cliente, mostrar todos los pedidos realizados por ese cliente
select p.id_pedido as Pedido, p.fecha as Fecha_Pedido, p.estado as Estado_Pedido, 
sum(pr.precio * pp.cantidad_pedida) as Total_Pedido
from pedidos p
join productos_pedidos pp on p.id_producto_pedido = pp.id_producto_pedido
join productos pr on pp.id_producto = pr.id_producto
join clientes cl on p.id_cliente = cl.id_cliente
where cl.id_cliente = 4 
group by p.id_pedido, p.fecha, p.estado
order by p.fecha desc;

-- Índices pensados para el uso común entre consultas
create index idx_pedidos_fecha on pedidos(fecha);
create index idx_clientes_id_cliente on clientes(id_cliente);
create index idx_productos_pedidos_id_producto_pedido_id_producto on productos_pedidos(id_producto_pedido, id_producto);
create index idx_productos_stock on productos(stock);
create index idx_compras_proveedores_id_proveedor_id_producto_comprado_prov on compras_proveedores(id_proveedor, id_producto_comprado_prov);
create index idx_productos_pedidos_id_producto on productos_pedidos(id_producto);
create index idx_productos_id_categoria on productos(id_categoria);
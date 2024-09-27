---------------------------------------------------------
-- CREACIÓN BASE DE DATOS
CREATE DATABASE nikedb;
-- INGRESO A LA BASE DE DATOS
USE nikedb;
--#######################################################


---------------------------------------------------------
-- TABLA CATEGORIA --
---------------------------------------------------------
CREATE TABLE categoria(
    id_categoria int PRIMARY KEY,
    nombre varchar(255));
--#######################################################


---------------------------------------------------------
-- TABLA PRODUCTOS --
---------------------------------------------------------
CREATE TABLE productos(
    id_producto int PRIMARY KEY,
    nombre varchar(255),
    descripcion text,   
    precio decimal,
    talla varchar(50),
    color varchar(50));
--#######################################################


---------------------------------------------------------
-- TABLA CONEXIÓN PRODUCTOS--CATEGORIAS
---------------------------------------------------------
CREATE TABLE categoriaproducto(
    id_categoriaproducto int PRIMARY KEY,
    id_categoria int,
    id_producto int,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto));
--#######################################################


---------------------------------------------------------
-- TABLA INVENTARIO --
CREATE TABLE inventario(
    id_inventario int PRIMARY KEY,
    nombre varchar(255));
--#######################################################


---------------------------------------------------------
-- TABLA CONEXIÓN PRODUCTOS--INVENTARIO --
CREATE TABLE productosinventario(
    id_productosinventario int PRIMARY KEY,
    id_producto int,
    id_inventario int,
    cantidad_disponible int,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario));
--#######################################################


---------------------------------------------------------
-- TABLA CLIENTES --
CREATE TABLE clientes(
    id_clientes int PRIMARY KEY,
    nombre varchar(255),
    email varchar(255),
    direccion varchar(255),
    telefono float);
--#######################################################


---------------------------------------------------------
-- TABLA FAVORITOS --
CREATE TABLE favoritos(
    id_favoritos int PRIMARY KEY,
    id_clientes int,
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes));
--#######################################################


---------------------------------------------------------
-- TABLA CONEXIÓN FAVORITOS--PRODUCTOS --
CREATE TABLE favoritosproductos(
    id_favoritosproductos int PRIMARY KEY,
    id_producto int,
    id_favoritos int,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_favoritos) REFERENCES favoritos(id_favoritos));
--#######################################################


---------------------------------------------------------
-- TABLA PAIS --
CREATE TABLE pais(
    id_pais int PRIMARY KEY,
    nombre varchar(255));
--#######################################################


---------------------------------------------------------
-- TABLA CIUDAD --
CREATE TABLE ciudad(
    id_ciudad int PRIMARY KEY,
    id_pais int,
    nombre varchar(255),
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais));
--#######################################################


---------------------------------------------------------
-- TABLA UBICACIÓN --
CREATE TABLE ubicacion(
    id_ubicacion int PRIMARY KEY,
    id_ciudad int,
    direccion varchar(255),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad));
--#######################################################


---------------------------------------------------------
-- TABLA TIENDA --
CREATE TABLE tienda(
    id_tienda int PRIMARY KEY,
    id_inventario int,
    id_ubicación int,
    nombre varchar(255),
    FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario),
    FOREIGN KEY (id_ubicación) REFERENCES ubicacion(id_ubicacion));
--#######################################################


---------------------------------------------------------
-- TABLA PEDIDOS --
CREATE TABLE pedidos(
    id_pedido int PRIMARY KEY,
    id_cliente int,
    fecha_pedido date,
    estado varchar(20),
    total decimal,
    direccion_envio varchar(255),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_clientes));
--#######################################################


---------------------------------------------------------
-- TABLA CONEXIÓN PRODUCTOS--PEDIDOS --
CREATE TABLE productospedidos(
    id_productospedidos int PRIMARY KEY,
    id_producto int,
    id_pedido int,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido));
--#######################################################


---------------------------------------------------------
-- TABLA RESEÑASPROD --
CREATE TABLE resenasprod(
    id_resena int PRIMARY KEY,
    id_producto int,
    calificación int,
    comentario text,
    fecha_creacion date,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto));
--#######################################################
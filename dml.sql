---------------------------------------------------------
-- INGRESO A LA BASE DE DATOS                           |
USE nikedb;                                          
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA CATEGORIA                           |
---------------------------------------------------------
INSERT INTO categoria(id_categoria,nombre)            
VALUES                                                
(1,"camisas"),                                        
(2,"pantalones"),                                     
(3,"sudaderas"),
(4,"chaquetas"),
(5,"busos"),
(6,"zapatos"),
(7,"pantalonetas"),
(8,"medias"),
(9,"accesorios"),
(10,"ropa_interior");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA PRODUCTOS                           |
---------------------------------------------------------
INSERT INTO productos(id_producto,nombre, descripcion, precio,talla,color)
VALUES
(1,"Camisa Blanca Nike", "Camisa de algodon blanca", 89000, "S", "Blanco"),
(2,"Camisa Negra Nike", "Camisa de algodon negra", 89000, "L", "Negro"),
(3,"Pantalon Naranja Nike", "Pantalon jean naranja", 90900,"Unica","Naranja"),
(4,"Pantalon Marron Nike", "Pantalon jean marron", 90900,"S","Marron"),
(5,"Sudadera Negra Nike", "Sudadera negra estampada", 50000, "S", "Azul"),
(6,"Sudadera Blanca NikeBasic", "Sudadera blanca basica", 90000, "XL", "Blanca"),
(7,"Chaqueta Cuero Nike", "Chaqueta de cuero negra", 150000, "M", "Negro"),
(8,"Chaqueta Denim Nike", "Chaqueta de denim azul", 135000, "L", "Azul"),
(9,"Buso Gris Nike", "Buso estampado gris", 90000, "M", "Gris"),
(10,"Buso Negro Nike", "Buso basico negro", 85000, "L", "Negro"),
(11,"Zapatos Negras Nike", "Zapatos deportivos negras", 250000, "38", "Negro"),
(12,"Zapatos Blancas Nike", "Zapatos deportivos blancas", 250000, "40", "Blanco"),
(13,"Pantaloneta Negra Nike", "Pantaloneta deportiva negra", 60000, "M", "Negro"),
(14,"Pantaloneta Blanca Nike", "Pantaloneta deportiva blanca", 60000, "L", "Blanco"),
(15,"Medias Negras Nike", "Medias cortas negras", 13000, "M", "Negro"),
(16,"Medias Blancas Nike", "Medias cortas blancas", 13000, "S", "Blanco"),
(17,"Cinturon Negro Nike", "Cinturon de cuero negro", 45000, "Unica", "Negro"),
(18,"Cinturon Marron Nike", "Cinturon de cuero marron", 45000, "Unica", "Marron"),
(19,"Boxer Negro Nike", "Boxer corto negro", 40000, "M", "Negro"),
(20,"Boxer Blanco Nike", "Boxer corto blanco", 40000, "L", "Blanco");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA QUE RELACIONA PRODUCTOS CON CATEGORIAS
---------------------------------------------------------
INSERT INTO categoriaproducto(id_categoriaproducto,id_categoria,id_producto)
VALUES                                                
(1,1,1),                                            
(2,1,2),                                             
(3,2,3),                                              
(4,2,4),                                              
(5,3,5),                                              
(6,3,6),                                              
(7,4,7),
(8,4,8),
(9,5,9),
(10,5,10),
(11,6,11),
(12,6,12),
(13,7,13),
(14,7,14),
(15,8,15),
(16,8,16),
(17,9,17),
(18,9,18),
(19,10,19),
(20,10,20),
(21,7,20);
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA INVENTARIO                          |
---------------------------------------------------------
INSERT INTO inventario(id_inventario,nombre)
VALUES
(1,"InventarioNikeAngel"),
(2,"InventarioNikeArley");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA QUE RELACIONA INVENTARIO CON PRODUCTOS
---------------------------------------------------------
INSERT INTO productosinventario(id_productosinventario,id_producto,id_inventario,cantidad_disponible)
VALUES
(1,1,1,2),
(2,2,1,65),
(3,3,1,2),
(4,4,2,98),
(5,5,2,8),
(6,6,1,1),
(7,7,2,22),
(8,8,1,72),
(9,9,1,99),
(10,10,2,0),
(11,11,1,199),
(12,12,1,45),
(13,13,2,65),
(14,14,2,43),
(15,15,2,21),
(16,16,1,18),
(17,17,2,2),
(18,18,1,708),
(19,19,1,780),
(20,20,2,58);
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA CLIENTES                            |
---------------------------------------------------------
INSERT INTO clientes(id_clientes, nombre, email, direccion, telefono)
VALUES
(1, "Cristian Caceres", "cristian123@gmail.com", "Cra 23", 3021032103),
(2, "Laura Amaya", "laura123@gmail.com", "Calle 1", 3124567890),
(3, "Juan Ruiz", "andres123@gmail.com", "Calle 12", 3109876543),
(4, "Mariana Flores", "mariana123@gmail.com", "Cra 17", 3187654321),
(5, "Mario Almazo", "jorge123@gmail.com", "Calle 34", 3052345678),
(6, "Paola Ramirez", "paola123@gmail.com", "Calle 12", 3174561234),
(7, "Santiago Perez", "santiago123@gmail.com", "Cra 7", 3009871234),
(8, "Ana Herrera", "ana123a@gmail.com", "Calle 50", 3198765432),
(9, "Carlos Castro", "carlos123@gmail.com", "Cra 11", 3115678901),
(10, "Diana Martinez", "diana123z@gmail.com", "Calle 3", 3123456789),
(11, "Samuel Muñoz", "samuel123z@gmail.com", "Calle 3", 3153786489),
(12, "Camilo Mejia", "camilo123z@gmail.com", "Calle 3", 3174426189),
(13, "Ivan Sandoval", "ivan123z@gmail.com", "Calle 3", 3002256789),
(14, "Alvaro Ruiz", "alvaro123z@gmail.com", "Calle 3", 3001557789),
(15, "Juan Carvajal", "juanc123z@gmail.com", "Calle 3", 3106476789),
(16, "Jose Mantilla", "josem123z@gmail.com", "Calle 3", 3013458989),
(17, "Juan Mariño", "juanm123z@gmail.com", "Calle 3", 3122226789),
(18, "Alexis Tocora", "alexist123z@gmail.com", "Calle 3", 3133456779),
(19, "Angel Simanca", "angels123z@gmail.com", "Calle 3", 3113151719),
(20, "Santiago Coter", "santiagoc123z@gmail.com", "Calle 3", 3183554729);
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA FAVORITOS                           |
---------------------------------------------------------
INSERT INTO favoritos(id_favoritos, id_clientes)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20);
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA QUE RELACIONA FAVORITOS CON PRODUCTOS
---------------------------------------------------------
INSERT INTO favoritosproductos(id_favoritosproductos,id_producto, id_favoritos)
VALUES
(1,1,1),
(2,9,7),
(3,17,14),
(4,19,20),
(5,6,2);
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA PAIS                                |
---------------------------------------------------------
INSERT INTO pais(id_pais,nombre)
VALUES
(1,"Colombia"),
(2,"EstadosUnidos"),
(3,"China"),
(4,"Rusia"),
(5,"Peru"),
(6,"Bolivia"),
(7,"Brasil"),
(8,"Argentina"),
(9,"Paraguay"),
(10,"Chile"),
(11,"Uruguay"),
(12,"Francia"),
(13,"Inglaterra"),
(14,"Alemania"),
(15,"Grecia"),
(16,"España"),
(17,"Ucrania"),
(18,"Ecuador"),
(19,"PuertoRico"),
(20,"Venezuela");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA CIUDAD                              |
---------------------------------------------------------
INSERT INTO ciudad(id_ciudad,id_pais,nombre)
VALUES
(1,1,"Bucaramanga"),
(2,2,"NewYork"),
(3,3,"Begin"),
(4,4,"Moscu"),
(5,5,"Lima"),
(6,6,"La paz"),
(7,7,"RioDeJaneiro"),
(8,8,"BuenosAires"),
(9,9,"Asuncion"),
(10,10,"Santiago"),
(11,11,"Montevideo"),
(12,12,"Paris"),
(13,13,"Londres"),
(14,14,"Berlin"),
(15,15,"Atenas"),
(16,16,"Barcelona"),
(17,17,"Kiev"),
(18,18,"Quito"),
(19,19,"Ponce"),
(20,20,"Caracas");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA UBICACION                           |
---------------------------------------------------------
INSERT INTO ubicacion(id_ubicacion, id_ciudad, direccion)
VALUES
(1,1,"Cra1"),
(2,2,"Cra2"),
(3,3,"Cra3"),
(4,4,"Cra4"),
(5,5,"Cra5"),
(6,6,"Cra6"),
(7,7,"Cra7"),
(8,8,"Cra8"),
(9,9,"Cra9"),
(10,10,"Cra10"),
(11,11,"Cra11"),
(12,12,"Cra12"),
(13,13,"Cra13"),
(14,14,"Cra14"),
(15,15,"Cra15"),
(16,16,"Cra16"),
(17,17,"Cra17"),
(18,18,"Cra18"),
(19,19,"Cra19"),
(20,20,"Cra20");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA TIENDA                              |
---------------------------------------------------------
INSERT INTO tienda(id_tienda,id_inventario,id_ubicación,nombre)
VALUES
(1,2,1,"NikeA"),
(2,2,20,"NikeB"),
(3,1,19,"NikeC"),
(4,2,4,"NikeD"),
(5,2,18,"NikeE"),
(6,1,17,"NikeF"),
(7,1,2,"NikeG"),
(8,2,5,"NikeH"),
(9,1,7,"NikeI"),
(10,2,8,"NikeJ"),
(11,1,16,"NikeK"),
(12,2,15,"NikeM"),
(13,2,14,"NikeN"),
(14,2,13,"NikeO"),
(15,1,12,"NikeP"),
(16,1,11,"NikeQ"),
(17,1,10,"NikeR"),
(18,1,9,"NikeS"),
(19,2,6,"NikeT"),
(20,1,3,"NikeU");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA PEDIDOS                             |
---------------------------------------------------------
INSERT INTO pedidos(id_pedido,id_cliente,fecha_pedido,estado,total,direccion_envio)
VALUES
(1,1,"2024-09-23","pendiente",250000,"Cra1"),
(2,1,"2024-10-23","enviado",10000,"Cra2"),
(3,3,"2024-01-27","entregado",1000,"Cra3"),
(4,1,"2024-02-23","pendiente",350000,"Cra4"),
(5,5,"2024-05-22","pendiente",750000,"Cra5"),
(6,1,"2024-08-23","enviado",50000,"Cra6"),
(7,7,"2024-03-22","enviado",10000,"Cra7"),
(8,3,"2024-04-25","entregado",20000,"Cra8"),
(9,9,"2024-10-22","pendiente",580000,"Cra9"),
(10,3,"2024-12-12","enviado",28000,"Cra10"),
(11,11,"2024-12-15","pendiente",450000,"Cra11"),
(12,12,"2024-11-17","enviado",10000,"Cra12"),
(13,5,"2024-05-22","pendiente",650000,"Cra13"),
(14,14,"2024-05-05","enviado",40000,"Cra14"),
(15,5,"2024-01-02","entregado",230000,"Cra15"),
(16,16,"2024-09-07","enviado",260000,"Cra16"),
(17,9,"2024-09-05","entregado",670000,"Cra17"),
(18,18,"2024-03-02","pendiente",890000,"Cra18"),
(19,9,"2024-05-28","pendiente",90000,"Cra19"),
(20,20,"2024-01-28","entregado",510000,"Cra20");
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA QUE RELACIONA PEDIDOS CON PRODUCTOS |
---------------------------------------------------------
INSERT INTO productospedidos(id_productospedidos,id_producto,id_pedido)
VALUES
(1,2,1),
(2,2,5),
(3,5,6),
(4,6,2),
(5,7,2),
(6,8,1),
(7,20,7),
(8,16,8),
(9,12,10),
(10,11,12),
(11,10,17),
(12,7,20),
(13,8,12),
(14,1,2),
(15,4,3),
(16,3,5),
(17,3,4),
(18,3,2),
(19,9,1),
(20,9,7);
--#######################################################


---------------------------------------------------------
-- INSECIÓN A TABLA RESEÑAS DE PRODUCTOS                |
---------------------------------------------------------
INSERT INTO resenasprod(id_resena,id_producto,calificación,comentario,fecha_creacion)
VALUES
(1,5,5,"Muy bueno","2024-12-12"),
(2,2,1,"Muy malo","2024-11-01"),
(3,4,4,"La buena Juan","2024-11-15"),
(4,3,3,"La mala Juan","2024-01-26"),
(5,10,5,"Juan Ruiz","2024-10-14"),
(6,20,5,"Muy bueno","2024-11-24"),
(7,16,5,"Buen producto","2024-12-04"),
(8,12,5,"Muy malo","2024-03-30"),
(9,11,1,"Muy bueno","2024-02-07"),
(10,1,2,"Muy bueno","2024-01-05"),
(11,2,5,"Muy malo","2024-06-09"),
(12,6,4,"Muy bueno","2024-05-10"),
(13,4,3,"Muy bueno","2024-10-16"),
(14,5,2,"Muy malo","2024-07-18"),
(15,9,5,"Muy bueno","2024-06-08"),
(16,12,1,"Muy bueno","2024-02-09"),
(17,17,5,"Muy bueno","2024-03-05"),
(18,11,3,"Muy bueno","2024-01-03"),
(19,2,3,"Muy malo","2024-10-01"),
(20,5,5,"Muy bueno","2024-11-15");
--#######################################################
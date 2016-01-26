/*( "ID", "EMAIL", "FOTO", "PASSWORD", "NOMBRE", "ROL", "TELEFONO" )*/
INSERT INTO USUARIO VALUES (1, 'seLoTraga@cuca.com', '1.jpg', '$2a$10$KvdO.kOuL9JRSx4lASzm9e0sUxXQAlql7Kd4mA0ug.wiSlyMoy.zO', 'Jeff', 'admin', '974532165') /*1234*/
INSERT INTO USUARIO VALUES (2, 'topeGuay@home.com', '2.jpg', '$2a$10$1s08.puvsNXIawmhuITYsOey8VwcMe7eSlVsFPZPDJPvlF55UccxO', 'Josemi', 'user','663219078') /*admin*/
INSERT INTO USUARIO VALUES (3, 'loTengoTodoPapi@linux.com', '3.jpg', '$2a$10$wEHh9dnWsbHhzMQ9i2mMQ.KDmBTG9FO6GGNztt/hNymW7iPCxfv9u', 'Dani', 'local', '974511165') /*pass*/
INSERT INTO USUARIO VALUES (4, 'aPorEllo@chacho.com', '4.jpg', '$2a$10$xUXi0fHaSQtPJ2UsNPjcfe1dg6hhfao5XUKxcIxbpywSoy63R2XoW', 'JuanLu', 'local', '974532177') /*5678*/
INSERT INTO USUARIO VALUES (5, 'superIncreible@rubias.com', '5.jpg', '$2a$10$G10MFSXIAnvGkXYBfFS16uhr8dcV3iH9ziCyZhnr7QiAx6ewGGjK.', 'Maria', 'local', '974532177') /*maria*/
INSERT INTO USUARIO VALUES (6, 'user12@fake.com', '6.jpg', '$2a$10$iaoa.4QjDDGiZARLwcNhqe22h2WuoOxsPDpOVmLofCNcu3dQHT2N6', 'Fulano', 'user', '663219222') /*fun123*/
INSERT INTO USUARIO VALUES (7, 'user1234@fake.com', '7.jpg', '$2a$10$R77A6Kx.EPWUOiV4YO6DAucKlEgAm/ZZ9MTGINW/HLCHsxRPEfsHG', 'Mengano', 'user', '663256781') /*men123*/
INSERT INTO USUARIO VALUES (8, 'bach1243@chachi.com', '8.jpg', '$2a$10$oIfHz5GRXI6uJ2yYElGiUuImn1I/rSYniiGj1BPDIalWeC9Fro9ku', 'Rosita', 'user', '655213078') /*pecas34*/
INSERT INTO USUARIO VALUES (9, 'dormirlonSensual@snoopy.com', '9.jpg', '$2a$10$oPtEHhBxHLTYxZD5sgyBP.AvZs7Zv5qr2AeoqEYZBBtFASx4igdx2', 'Pablito', 'user', '676439012') /*pa1234*/
INSERT INTO USUARIO VALUES (10, 'callMeMaybe@tux.com', '10.jpg', '$2a$10$4jlxSkFm/fl2tryEbCAxiuYBEeLTV/dryHzf5XzJnJBVdFl4HURYS', 'Eloisa', 'user', '663214658') /*isaelo96*/

--( "ID", "DIRECCION", "EMAIL", "FOTO", "HORARIO", "NOMBRE", "PUNTUACION", "TAGS", "TELEFONO", "UBICACION", "USUARIO" ) 
INSERT INTO LOCAL VALUES (1, 'Calle concha espina nº10','elmaildeDani@dan.da', '1.jpg', '10-23', 'Bistro', 5, 'comida_mexicana,comida_india','111-111-111','40234242�N 702934820438�S', 3)
INSERT INTO LOCAL VALUES (2, 'Paseo del valle nº43', 'elmaildeTapep@taew.da','2.jpg', '10-23', 'Tapas', 5, 'comida_china', '111-111-111','40232134�N 70293488945�S', 3)
INSERT INTO LOCAL VALUES (3, 'Calle mordor nº123', 'juanluar@cerve.ce','3.jpg', '9-20', 'Cubos y tapas', 5, 'comida_mexicana,comida_americana,comida_espa�ola','222-222-222', '4123142�N 70293324438�S', 4)
INSERT INTO LOCAL VALUES (4, 'Calle alpargata nº21', 'juanluZam@zamap.za','4.jpg', '22-4', 'A zampar!', 5, 'comida_espa�ola,comida_india', '333-333-333','234242�N 123120438�S', 4)
INSERT INTO LOCAL VALUES (5, 'Avenida puerto principe nº21','sabrosito@sabroseo.sa', '5.jpg', '14-22', '100 sabrositos', 5, 'comida_libanesa,comida_espa�ola,comida_mexicana', '444-444-444','78974242�N 7029340438�S', 4)
INSERT INTO LOCAL VALUES (6, 'Calle de la sabrosusa nº3', 'filetonton@ton.to','6.jpg', '9-21', 'Fileton', 5, 'comida_mexicana,comida_china', '555-555-555','123131342�N 7029438�S', 5)

--( "ID", "CAPACIDADACTUAL", "CAPACIDAD_TOTAL", "DESCRIPCION", "FECHA_LIMITE", "FOTO", "NOMBRE", "TAGS, "LOCAL")
INSERT INTO OFERTA VALUES (1, 0, 10, 'Toma todas tus copas por 4 euros', '2015-07-02 06:14:00', '1.jpg', 'Copas a 4eur', 1, 'comida_mexicana,comida_china', 1)
INSERT INTO OFERTA VALUES (2, 0, 11, 'Rico y sabroso. Ven a cenar aqui', '2015-07-02 06:14:00', '2.jpg', 'Riconudo', 0, 'comida_india,comida_china', 1)
INSERT INTO OFERTA VALUES (3, 0, 30, 'Cena 100% romantica', '2015-07-02 06:14:00', '3.jpg', 'Ven con tu pareja', 1, 'plan_romantico', 1)
INSERT INTO OFERTA VALUES (4, 0, 20, 'Chewbacca te cantara el cumpleaños feliz', '2016-07-02 06:14:00', '4.jpg', 'Celebra tu cumple', 0, 'comida_mexicana,comida_rusa', 2)
INSERT INTO OFERTA VALUES (5, 0, 14, 'Vente de fiesta con nosotros', '2015-07-02 06:14:00', '5.jpg', 'Flow non stop', 1, 'comida_china', 2)
INSERT INTO OFERTA VALUES (6, 0, 13, 'Tapeo del bueno y barato', '2015-07-02 06:14:00', '6.jpg', 'Tapas gratis', 1, 'comida_española,comida_mexicana,comida_rusa', 3)
INSERT INTO OFERTA VALUES (7, 0, 18, 'Ponte bien fino, hasta que revientes', '2015-07-02 06:14:00','7.jpg', 'Come lo que quieras', 1, 'comida_china,comida_rusa', 4)
INSERT INTO OFERTA VALUES (8, 0, 22, 'El refill mas molon', '2016-07-02 06:14:00', '8.jpg', 'Rellena tu bebida', 1, 'comida_turca,comida_india', 4)
INSERT INTO OFERTA VALUES (9, 0, 78, 'Qué ricas estas alitas', '2017-07-02 06:14:00', '9.jpg', 'Alitas con tu primera consumicion', 0, 'comida_picante', 5)
INSERT INTO OFERTA VALUES (10, 0, 9, 'Invitate a unas cañas ;)', '2015-07-02 06:14:00', '10.jpg', 'Invitar es facil', 1, 'comida_italiana,comida_francesa', 1)
INSERT INTO OFERTA VALUES (11, 0, 11, 'Gran variedad de vinos de la tierra', '2017-07-02 06:14:00', '11.jpg', 'Nos vamos de potes?', 0, 'comida_turca, comida_española', 3)
INSERT INTO OFERTA VALUES (12, 0, 5, 'El mejor jamon serrano de la ciudad', '2015-07-02 06:14:00', '12.jpg', 'Al jamon lo invito yo', 1, 'comida_italiana', 5)

--( "ID", "CODIGO_QR", "FECHA_RESERVA", "NUM_PERSONAS", "VALIDADO", "OFERTA", "USUARIO" )
INSERT INTO RESERVA VALUES (1, 'QR1', '2015-07-02 06:14:00', 5, 1, 1, 2)
INSERT INTO RESERVA VALUES (2, 'QR2', '2015-07-02 06:14:00', 2, 1, 3, 6)
INSERT INTO RESERVA VALUES (3, 'QR3', '2015-07-02 06:14:00', 12, 0, 8, 2)
INSERT INTO RESERVA VALUES (4, 'QR4', '2015-07-02 06:14:00', 11, 0, 5, 8)
INSERT INTO RESERVA VALUES (5, 'QR5', '2015-07-02 06:14:00', 3, 0, 6, 7)
INSERT INTO RESERVA VALUES (6, 'QR6', '2015-07-02 06:14:00', 21, 1, 4, 9)
INSERT INTO RESERVA VALUES (7, 'QR7', '2015-07-02 06:14:00', 4, 1, 8, 10)
INSERT INTO RESERVA VALUES (8, 'QR8', '2015-07-02 06:14:00', 4, 0, 8, 10)

--( "ID", "FECHA", "TEXTO", "USUARIO", "LOCAL" )
INSERT INTO COMENTARIO VALUES (1, '2015-07-02 06:14:00', 'Estuvo genial. Mis diez', 2, 4)
INSERT INTO COMENTARIO VALUES (2, '2015-07-02 06:14:00', 'Lo recomiendo', 6, 2)
INSERT INTO COMENTARIO VALUES (3, '2015-07-02 06:14:00', 'La calidad es pesima, los camareros geniales', 9, 3)
INSERT INTO COMENTARIO VALUES (4, '2015-07-02 06:14:00', 'La ultima vez que fuimos el trato fue malo', 2, 4)
INSERT INTO COMENTARIO VALUES (5, '2015-07-02 06:14:00', 'Suele estar muy lleno', 8, 1)
INSERT INTO COMENTARIO VALUES (6, '2015-07-02 06:14:00', 'No se parece en nada a la descripcion. Es horrible', 9, 5)
INSERT INTO COMENTARIO VALUES (7, '2015-07-02 06:14:00', 'Fantastico local', 10, 5)
INSERT INTO COMENTARIO VALUES (8, '2015-07-02 06:14:00', 'Aqui conoci a mi mujer. Me trae muy buenos recuerdo cuando voy', 7, 2)

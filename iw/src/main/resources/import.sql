/*( "ID", "EMAIL", "FOTO", "PASSWORD", "NOMBRE", "ROL", "TELEFONO" )*/
INSERT INTO USUARIO VALUES (2, 'seLoTraga@cuca.com', '$2a$10$KvdO.kOuL9JRSx4lASzm9e0sUxXQAlql7Kd4mA0ug.wiSlyMoy.zO', 'Josemi', 'user', '974532165') /*admin*/
INSERT INTO USUARIO VALUES (1, 'topeGuay@home.com',  '$2a$10$1s08.puvsNXIawmhuITYsOey8VwcMe7eSlVsFPZPDJPvlF55UccxO','Jeff','admin','663219078') /*1234*/
INSERT INTO USUARIO VALUES (3, 'loTengoTodoPapi@linux.com', '$2a$10$wEHh9dnWsbHhzMQ9i2mMQ.KDmBTG9FO6GGNztt/hNymW7iPCxfv9u', 'Dani', 'local', '974511165') /*pass*/
INSERT INTO USUARIO VALUES (4, 'aPorEllo@chacho.com', '$2a$10$xUXi0fHaSQtPJ2UsNPjcfe1dg6hhfao5XUKxcIxbpywSoy63R2XoW', 'JuanLu', 'local', '974532177') /*5678*/
INSERT INTO USUARIO VALUES (5, 'superIncreible@rubias.com', '$2a$10$G10MFSXIAnvGkXYBfFS16uhr8dcV3iH9ziCyZhnr7QiAx6ewGGjK.', 'Maria', 'local', '974532177') /*maria*/
INSERT INTO USUARIO VALUES (6, 'user12@fake.com',  '$2a$10$iaoa.4QjDDGiZARLwcNhqe22h2WuoOxsPDpOVmLofCNcu3dQHT2N6', 'Fulano', 'user', '663219222') /*fun123*/
INSERT INTO USUARIO VALUES (7, 'user1234@fake.com', '$2a$10$R77A6Kx.EPWUOiV4YO6DAucKlEgAm/ZZ9MTGINW/HLCHsxRPEfsHG', 'Mengano', 'user', '663256781') /*men123*/
INSERT INTO USUARIO VALUES (8, 'bach1243@chachi.com', '$2a$10$oIfHz5GRXI6uJ2yYElGiUuImn1I/rSYniiGj1BPDIalWeC9Fro9ku', 'Rosita', 'user', '655213078') /*pecas34*/
INSERT INTO USUARIO VALUES (9, 'dormirlonSensual@snoopy.com', '$2a$10$oPtEHhBxHLTYxZD5sgyBP.AvZs7Zv5qr2AeoqEYZBBtFASx4igdx2', 'Pablito', 'user', '676439012') /*pa1234*/
INSERT INTO USUARIO VALUES (10, 'callMeMaybe@tux.com',  '$2a$10$4jlxSkFm/fl2tryEbCAxiuYBEeLTV/dryHzf5XzJnJBVdFl4HURYS', 'Eloisa', 'user', '663214658') /*isaelo96*/

--( "ID", "DIRECCION", "EMAIL", "FOTO", "HORARIO", "NOMBRE", "PUNTUACION", "TELEFONO", "UBICACION", "USUARIO" ) 
INSERT INTO LOCAL VALUES (1, 'Calle concha espina n10','elmaildeDani@dan.da', '10-23', 'Bistro', 5, '111111111',3) --'comida_mexicana,comida_india',
INSERT INTO LOCAL VALUES (2, 'Paseo del valle n43', 'elmaildeTapep@taew.da','10-23', 'Tapas', 5, '111111111',3) --'comida_china', 
INSERT INTO LOCAL VALUES (3, 'Calle mordor n123', 'juanluar@cerve.ce', '9-20', 'Cubos y tapas', 5, '222222222', 4) --'comida_mexicana,comida_americana,comida_espanola',
INSERT INTO LOCAL VALUES (4, 'Calle alpargata n21', 'juanluZam@zamap.za','22-4', 'A zampar!', 5, '333333333',4) --'comida_espanola,comida_india', 
INSERT INTO LOCAL VALUES (5, 'Avenida puerto principe n21','sabrosito@sabroseo.sa', '14-22', '100 sabrositos', 5, '444444444', 4) --'comida_libanesa,comida_espanola,comida_mexicana', 
INSERT INTO LOCAL VALUES (6, 'Calle de la sabrosusa n3', 'filetonton@ton.to','9-21', 'Fileton', 5, '555555555', 5) --'comida_mexicana,comida_china', 

--( "ID", "CAPACIDADACTUAL", "CAPACIDAD_TOTAL", "DESCRIPCION", "FECHA_LIMITE", "FOTO", "NOMBRE", "TAGS, "LOCAL")
INSERT INTO OFERTA VALUES (1, 6, 10, 'Toma todas tus copas por 4 euros', '2015-07-02 06:14:00',  'Copas a 4 euros', 1) 
INSERT INTO OFERTA VALUES (2, 0, 11, 'Rico y sabroso. Ven a cenar aqui', '2015-07-02 06:14:00',  'Riconudo', 1)  
INSERT INTO OFERTA VALUES (3, 17, 30, 'Cena 100% romantica', '2015-07-02 06:14:00', 'Ven con tu pareja', 1) 
INSERT INTO OFERTA VALUES (4, 0, 20, 'Chewbacca te cantara el cumpleanos feliz', '2016-07-02 06:14:00', 'Celebra tu cumple', 2)
INSERT INTO OFERTA VALUES (5, 8, 14, 'Vente de fiesta con nosotros', '2015-07-02 06:14:00', 'Flow non stop', 2) 
INSERT INTO OFERTA VALUES (6, 0, 13, 'Tapeo del bueno y barato', '2015-07-02 06:14:00', 'Tapas gratis', 3) 
INSERT INTO OFERTA VALUES (7, 0, 18, 'Ponte bien fino, hasta que revientes', '2015-07-02 06:14:00','Come lo que quieras',  4) 
INSERT INTO OFERTA VALUES (8, 13, 22, 'El refill mas molon', '2016-07-02 06:14:00', 'Rellena tu bebida', 4) 
INSERT INTO OFERTA VALUES (9, 0, 78, 'Que ricas estas alitas', '2017-07-02 06:14:00', 'Alitas con tu primera consumicion', 5)  
INSERT INTO OFERTA VALUES (10, 3, 9, 'Invitate a unas canas ;)', '2015-07-02 06:14:00', 'Invitar es facil', 1)
INSERT INTO OFERTA VALUES (11, 0, 11, 'Gran variedad de vinos de la tierra', '2017-07-02 06:14:00', 'Nos vamos de potes?', 3)  
INSERT INTO OFERTA VALUES (12, 0, 5, 'El mejor jamon serrano de la ciudad', '2015-07-02 06:14:00', 'Al jamon lo invito yo', 5) 

--( "ID", "CODIGO_QR", "FECHA_RESERVA", "NUM_PERSONAS", "VALIDADO", "OFERTA", "USUARIO" )
INSERT INTO RESERVA VALUES (1, 'Este codigo QR es valido para que 5 personas disfruten de la oferta Copas a 4 euros en el local Bistro a las 12:12 el 01/02/2016. Esta reserva ha sido realizada por Mengano', '2016-02-01 12:12:00', 5, 1, 1, 7)
INSERT INTO RESERVA VALUES (2, 'Este codigo QR es valido para que 2 personas disfruten de la oferta Ven con tu pareja en el local Bistro a las 12:12 el 01/02/2016. Esta reserva ha sido realizada por Fulano', '2016-02-01 12:12:00', 2, 1, 3, 6)
INSERT INTO RESERVA VALUES (3, 'Este codigo QR es valido para que 12 personas disfruten de la oferta Rellena tu bebida en el local A zampar! a las 12:12 el 01/02/2016. Esta reserva ha sido realizada por Rosita', '2016-02-01 12:12:00', 12, 0, 8, 8)
INSERT INTO RESERVA VALUES (4, 'Este codigo QR es valido para que 11 personas disfruten de la oferta Flow non stop en el local Tapas a las 12:12 el 01/02/2016. Esta reserva ha sido realizada por Rosita', '2016-02-01 12:12:00', 11, 0, 5, 8)
INSERT INTO RESERVA VALUES (5, 'Este codigo QR es valido para que 3 personas disfruten de la oferta Tapas gratis en el local Cubos y tapas a las 12:12 el 01/02/2016. Esta reserva ha sido realizada por Mengano', '2016-02-01 12:12:00', 3, 0, 6, 7)
INSERT INTO RESERVA VALUES (6, 'Este codigo QR es valido para que 21 personas disfruten de la oferta Celebra tu cumple en el local Tapas a las 12:12 el 01/02/2016. Esta reserva ha sido realizada por Pablito', '2016-02-01 12:12:00', 21, 1, 4, 9)
INSERT INTO RESERVA VALUES (7, 'Este codigo QR es valido para que 4 personas disfruten de la oferta Rellena tu bebida en el local A zampar! a las 06:14 el 02/12/2015. Esta reserva ha sido realizada por Eloisa', '2015-12-02 06:14:00', 4, 1, 8, 10)

--( "ID", "FECHA", "TEXTO", "LOCAL", "USUARIO")
INSERT INTO COMENTARIO VALUES (1, '2015-07-02 06:14:00', 'Estuvo genial. Mis diez', 4, 2)
INSERT INTO COMENTARIO VALUES (2, '2015-07-02 06:14:00', 'Lo recomiendo', 2, 6)
INSERT INTO COMENTARIO VALUES (3, '2015-07-02 06:14:00', 'La calidad es pesima, los camareros geniales', 3, 9)
INSERT INTO COMENTARIO VALUES (4, '2015-07-02 06:14:00', 'La ultima vez que fuimos el trato fue malo', 4, 2)
INSERT INTO COMENTARIO VALUES (5, '2015-07-02 06:14:00', 'Suele estar muy lleno', 1, 8)
INSERT INTO COMENTARIO VALUES (6, '2015-07-02 06:14:00', 'No se parece en nada a la descripcion. Es horrible', 5, 9)
INSERT INTO COMENTARIO VALUES (7, '2015-07-02 06:14:00', 'Fantastico local', 5, 10)
INSERT INTO COMENTARIO VALUES (8, '2015-07-02 06:14:00', 'Aqui conoci a mi mujer. Me trae muy buenos recuerdo cuando voy', 2, 7)

--( "ID", "TEXTO" )
INSERT INTO TAGS VALUES (1, 'plan_romantico')
INSERT INTO TAGS VALUES (2, 'comida_india')
INSERT INTO TAGS VALUES (3, 'comida_mexicana')
INSERT INTO TAGS VALUES (4, 'comida_china')
INSERT INTO TAGS VALUES (5, 'comida_rusa')
INSERT INTO TAGS VALUES (6, 'comida_espanola')
INSERT INTO TAGS VALUES (7, 'comida_turca')
INSERT INTO TAGS VALUES (8, 'comida_picante')
INSERT INTO TAGS VALUES (9, 'comida_italiana')
INSERT INTO TAGS VALUES (10, 'comida_francesa')

--( "OFERTA", "TAGS" )
INSERT INTO OFERTA_TAGS VALUES (1, 3)
INSERT INTO OFERTA_TAGS VALUES (1, 4)
INSERT INTO OFERTA_TAGS VALUES (2, 9)
INSERT INTO OFERTA_TAGS VALUES (2, 8)
INSERT INTO OFERTA_TAGS VALUES (3, 1)
INSERT INTO OFERTA_TAGS VALUES (4, 5)
INSERT INTO OFERTA_TAGS VALUES (4, 4)
INSERT INTO OFERTA_TAGS VALUES (5, 2)
INSERT INTO OFERTA_TAGS VALUES (6, 5)
INSERT INTO OFERTA_TAGS VALUES (6, 6)
INSERT INTO OFERTA_TAGS VALUES (6, 4)
INSERT INTO OFERTA_TAGS VALUES (7, 3)
INSERT INTO OFERTA_TAGS VALUES (7, 8)
INSERT INTO OFERTA_TAGS VALUES (8, 2)
INSERT INTO OFERTA_TAGS VALUES (8, 7)
INSERT INTO OFERTA_TAGS VALUES (9, 6)
INSERT INTO OFERTA_TAGS VALUES (10, 8)
INSERT INTO OFERTA_TAGS VALUES (10, 10)
INSERT INTO OFERTA_TAGS VALUES (11, 9)
INSERT INTO OFERTA_TAGS VALUES (12, 5)
INSERT INTO OFERTA_TAGS VALUES (12, 7)




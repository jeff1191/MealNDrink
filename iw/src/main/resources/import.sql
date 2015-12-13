/*( "ID", "EMAIL", "FOTO", "NOMBRE", "ROL", "TELEFONO" )*/
INSERT INTO USUARIO VALUES (1, 'seLoTraga@cuca.com', '/img/users/admin_jeff.jpg', 'admin', 'Jeff', 'admin', '974532165')
INSERT INTO USUARIO VALUES (2, 'topeGuay@home.com', '/img/users/user_josemi.jpg', '1234', 'Josemi', 'user','663219078')
INSERT INTO USUARIO VALUES (3, 'loTengoTodoPapi@linux.com', '/img/users/local_dani.jpg', 'pass', 'Dani', 'local', '974511165')
INSERT INTO USUARIO VALUES (4, 'aPorEllo@chacho.com', '/img/users/local_juanlu.jpg', '5678', 'Juan Lu', 'local', '974532177')
INSERT INTO USUARIO VALUES (5, 'superIncreible@rubias.com', '/img/users/local_maria.jpg', 'maria', 'Maria', 'local', '974532177')
INSERT INTO USUARIO VALUES (6, 'user12@fake.com', '/img/users/user_fulano.jpg', 'fun123', 'Fulano', 'user', '663219222')
INSERT INTO USUARIO VALUES (7, 'user1234@fake.com', '/img/users/user_mengano.jpg', 'men123', 'Mengano', 'user', '663256781')
INSERT INTO USUARIO VALUES (8, 'bach1243@chachi.com', '/img/users/user_rosita.jpg', 'pecas34', 'Rosita', 'user', '655213078')
INSERT INTO USUARIO VALUES (9, 'dormirlonSensual@snoopy.com', '/img/users/user_pablito.jpg', 'pa1234', 'Pablito', 'user', '676439012')
INSERT INTO USUARIO VALUES (10, 'callMeMaybe@tux.com', '/img/users/user_eloisa.jpg', 'isaelo96', 'Eloisa', 'user', '663214658')
/*( "ID", "DIRECCION", "FOTO", "HORARIO", "NOMBRE", "PUNTUACION", "TAGS", "UBICACION", "USUARIO" )
 * 
 * Falla con los multivalorados, del controler a la base de datos todo ok pero aqui...
 * 
 */
INSERT INTO LOCAL VALUES ( 1, 'Calle concha espina nº10', '/img/locals/dani_bistro.jpg', '10-23', 'Bistro', 5, {'Comida mexicana', 'Comida india'},'40234242ºN 702934820438ºS', 3)
INSERT INTO LOCAL VALUES ( 2, 'Paseo del valle nº43', '/img/locals/dani_tapas.jpg', '10-23', 'Tapas', 5, {'Comida china'}, '40232134ºN 70293488945ºS', 3)
INSERT INTO LOCAL VALUES ( 3, 'Calle mordor nº123', '/img/locals/juanlu_cubosytapas.jpg', '9-20', 'Cubos y tapas', 5, {'Comida mexicana', 'Comida americana', 'Comida española'}, '4123142ºN 70293324438ºS', 4)
INSERT INTO LOCAL VALUES ( 4, 'Calle alpargata nº21', '/img/locals/juanlu_azampar.jpg', '22-4', 'A zampar!', 5, {'Comida española', 'Comida india'}, '234242ºN 123120438ºS', 4)
INSERT INTO LOCAL VALUES ( 5, 'Avenida puerto principe nº21', '/img/locals/juanlu_100sabrositos.jpg', '14-22', '100 sabrositos', 5, {'Comida libanesa', 'Comida española', 'Comida mexicana'}, '78974242ºN 7029340438ºS', 4)
INSERT INTO LOCAL VALUES ( 6, 'Calle de la sabrosusa nº3', '/img/locals/maria_fileton.jpg', '9-21', 'Fileton', 5, {'Comida mexicana', 'Comida china'}, '123131342ºN 7029438ºS', 5)

/*( "ID", "CAPACIDADACTUAL", "CAPACIDAD_TOTAL", "FECHA_LIMITE", "FOTO", "NOMBRE", "TAGS, "LOCAL")*/
INSERT INTO OFERTA VALUES (1, 0, 10, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/bistro_copas4.jpg', 'Copas a 4€', {'Comida mexicana', 'Comida china'}, 1)
INSERT INTO OFERTA VALUES (2, 0, 11, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/bistro_riconudo.jpg', 'Riconudo', {'Comida india', 'Comida china'}, 1)
INSERT INTO OFERTA VALUES (3, 0, 30, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI:'), '/img/offers/bistro_pareja.jpg', 'Ven con tu pareja', {'Comida romantica'}, 1)
INSERT INTO OFERTA VALUES (4, 0, 20, TO_TIMESTAMP('2016-07-02 06:14', 'YYYY-MM-DD HH24:MI:'), '/img/offers/tapas_cumple.jpg', 'Celebra tu cumple', {'Comida mexicana', 'Comida rusa'}, 2)
INSERT INTO OFERTA VALUES (5, 0, 14, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/tapas_flow.jpg', 'Flow non stop', {'Comida china'}, 2)
INSERT INTO OFERTA VALUES (6, 0, 13, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/cubosytapas_tapasgratis.jpg', 'Tapas gratis', {'Comida española', 'Comida rusa', 'Comida china'}, 3)
INSERT INTO OFERTA VALUES (7, 0, 18, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/azampar_comeloquequieras.jpg', 'Come lo que quieras', {'Comida rusa', 'Comida china'}, 4)
INSERT INTO OFERTA VALUES (8, 0, 22, TO_TIMESTAMP('2016-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/azampar_rellenarbebida.jpg', 'Rellena tu bebida', {'Comida turca', 'Comida inida'}, 4)
INSERT INTO OFERTA VALUES (9, 0, 78, TO_TIMESTAMP('2017-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/100sabrositos_alitasconsumicion.jpg', 'Alitas con tu primera consumicion', {'Comida picante'}, 5)
INSERT INTO OFERTA VALUES (10, 0, 9, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), '/img/offers/bistro_inivitar.jpg', 'Invitar es facil', {'Comida india', 'Comida francesa'}, 1)

/*( "ID", "CODIGO_QR", "FECHA_RESERVA", "NUM_PERSONAS", "OFERTA", "USUARIO" )*/
INSERT INTO RESERVA VALUES (1, '/img/qrcodes/josemi/bistro_copas4_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 5, 1, 2)
INSERT INTO RESERVA VALUES (2, '/img/qrcodes/fulano/bistro_pareja_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 2, 3, 6)
INSERT INTO RESERVA VALUES (3, '/img/qrcodes/josemi/azampar_rellenarbebida_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 12, 8, 2)
INSERT INTO RESERVA VALUES (4, '/img/qrcodes/rosita/tapas_flow_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 11, 5, 8)
INSERT INTO RESERVA VALUES (5, '/img/qrcodes/mengano/cubosytapas_tapasgratis_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 3, 6, 7)
INSERT INTO RESERVA VALUES (6, '/img/qrcodes/pablito/tapas_cumple_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 21, 4, 9)
INSERT INTO RESERVA VALUES (7, '/img/qrcodes/eloisa/azampar_rellenarbebida_0702015.jpg', TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 4, 8, 10)

/*( "ID", "FECHA", "TEXTO", "USUARIO", "LOCAL" )*/
INSERT INTO COMENTARIO VALUES (1, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'Estuvo genial. Mis diez', 2, 4)
INSERT INTO COMENTARIO VALUES (2, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'Lo recomiendo', 6, 2)
INSERT INTO COMENTARIO VALUES (3, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'La calidad es pesima, los camareros geniales', 9, 3)
INSERT INTO COMENTARIO VALUES (4, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'La ultima vez que fuimos el trato fue malo', 2, 4)
INSERT INTO COMENTARIO VALUES (5, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'Suele estar muy lleno', 8, 1)
INSERT INTO COMENTARIO VALUES (6, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'No se parece en nada a la descripcion. Es horrible', 9, 5)
INSERT INTO COMENTARIO VALUES (7, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'Fantastico local', 10, 5)
INSERT INTO COMENTARIO VALUES (8, TO_TIMESTAMP('2015-07-02 06:14', 'YYYY-MM-DD HH24:MI'), 'Aqui conoci a mi mujer. Me trae muy buenos recuerdo cuando voy', 7, 2)
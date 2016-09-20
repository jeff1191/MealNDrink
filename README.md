# MealNDrink
Portal que muestra promociones reducidas a un determinado número de personas en un restaurante o bar
Los participantes son los clientes que se inscriben para comer/beber en un local y los locales usan el sitio para promocionarse de una forma más original. Cada local es el responsable de introducir su información, además modera los comentarios que los usuarios hacen sobre ellos. El administrador controlará todos los perfiles de los participantes.

A la hora de validar las ofertas emplearemos un código qr. Cuando un bar/restaurante cree una promoción, se crearán tantos códigos qr como el máximo de personas para esa promoción; y cada vez que un usuario se inscriba en una oferta se le dará un código.

Como vistas tendríamos: administrador, bares/restaurantes, consumidores (personas registradas en la pagina), visitantes (personas no registradas en la pagina), últimas ofertas y ofertas del mes.

#Modelo de dominio

![Alt text](https://github.com/jeff1191/MealNDrink/blob/master/iw/MealNDrink_BBDD.png?raw=true "Modelo de dominio MealNDrink")


#Tecnologías

JSP/CSS3/HTML5/BOOTSTRAP/jQuery : Se combinan todas estas tecnologías para la parte de front-end (visualización con el usuario)

Java/JPA/Maven: Se combinan estas tecnologias para la parte del backend y acceso a la base de datos

HSQLDB: Motor de bases de datos SQL ligero.

Se usa Spring como framework.

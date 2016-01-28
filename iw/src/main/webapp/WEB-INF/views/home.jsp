<%@ include file="../fragments/header.jspf" %>
<section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
                <li data-target="#main-slider" data-slide-to="3"></li>
                <li data-target="#main-slider" data-slide-to="4"></li>
                <li data-target="#main-slider" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(${prefix}resources/img/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">La mejor comida, al mejor precio</h1>  
                                </div>								
                         						
                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(${prefix}resources/img/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                           
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1"> <br/> Descubre nuevos lugares</h1>
                                </div>								
                         
                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(${prefix}resources/img/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">No hay nada como las cosas bien hechas</h1>                                   
                                </div>							
                         				
                        </div>
                    </div>
                </div><!--/.item-->
                
                <div class="item" style="background-image: url(${prefix}resources/img/slider/bg4.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                          
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Los partidos saben mejor rodeado de tus colegas y con una buena cerveza en la mano</h1>
                                </div>								
                           	
                        </div>
                    </div>
                </div><!--/.item-->
                
                <div class="item" style="background-image: url(${prefix}resources/img/slider/bg5.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Cientos de ofertas y locales te estan esperando</h1>
                                </div>								
                        
                        </div>
                    </div>
                </div><!--/.item-->
                
                 <div class="item" style="background-image: url(${prefix}resources/img/slider/bg6.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Locales más populares</h1>
                                    <c:forEach items="${popularLocals}" var="i">							
						  				<h2 class="animation animated-item-1"><a href="comercio_externo?id=${i.ID}">${i.nombre}</a></h2>		
									</c:forEach>
                                </div>								
                        
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section><!--/#main-slider-->


    <section id="portfolio">
        <div class="container">
            <div class="center">
                <h2>Bienvenidos</h2>
                <h3>Aqui puedes encontrar todas las ofertas disponibles</h3>
            </div>

			<ul class="portfolio-filter text-center">
                 <li><a class="btn btn-default active" href="#" data-filter="*">Todas las ofertas</a></li>
                <c:forEach items="${alltags}" var="i">
                	<li><a class="btn btn-default" href="#" data-filter=".${i}">#${i}</a></li>
                </c:forEach>
            </ul><!--/#portfolio-filter-->
            
            

            <div class="row">            
            	<div class="portfolio-items">            
	            	<c:forEach items="${platos}" var="i">
	               		<div class="portfolio-item ${i.tags} col-xs-12 col-sm-4 col-md-3">
	               		    <div class="recent-work-wrap">
		                        <img class="img-responsive" WIDTH=178 HEIGHT=150 src="ofertasFoto?id=${i.ID}.jpg" alt="">
		                        <div class="overlay">
		                        <div class="recent-work-inner">
		                               <h3><a href="#">${i.nombre}</a></h3>
		                                <p>${i.descripcion}</p>									
										<a class="preview" href="reserva?id=${i.ID}&dondeEstoy=home"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>
										<a class="preview" href="comercio_externo?id=${(i.local).ID}"><i class="fa fa-eye"></i> Ver restaurante</a>	
									</div> 
		                        </div>
		                    </div>
		                </div>   
		            </c:forEach>
            	</div>
            </div><!--/.row-->     
                
             <div class="center">  
             	<br>             
                <h3>Aqui puedes encontrar todas los locales que estan en MealNDrink</h3>
            </div>
            
            	          
        </div><!--/.container-->
    </section><!--/#recent-works-->

<%@ include file="../fragments/footer.jspf" %>

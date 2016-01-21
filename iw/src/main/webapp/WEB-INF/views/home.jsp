<%@ include file="../fragments/header.jspf" %>
<section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
                <li data-target="#main-slider" data-slide-to="3"></li>
                <li data-target="#main-slider" data-slide-to="4"></li>
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
                                    <h1 class="animation animated-item-1">Descubre nuevos lugares</h1>
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
            </div>

			<!-- borrar-->
			
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
	                        <img class="img-responsive" WIDTH=178 HEIGHT=150 src="ofertasFoto?id=${i.foto}" alt="">
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
        </div><!--/.container-->
    </section><!--/#recent-works-->


    <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="skill">
                        <h2>Locales más populares</h2>                       
						<div class="list-group">
						 <c:forEach items="${popularLocals}" var="i">
						  <a href="/iw/comercio_externo?id=${i.ID}" class="list-group-item">${i.nombre}</a>						
						 </c:forEach>
						</div>
						
                    </div>

                </div><!--/.col-sm-6-->

                <div class="col-sm-6">
                    <div class="accordion">
                        <h2>Ultimas reservas</h2>
                        <div class="panel-group" id="accordion1">
                        
                         <c:forEach items="${lastBooks}" var="i">
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                En ${((i.oferta).local).nombre}  a las  ${i.fechaReserva}  
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseOne1" class="panel-collapse collapse">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="${prefix}resources/img/database/offers/toLocals/${(i.oferta).foto}">
                                        </div>
                                        <div class="media-body">
                                             <h4>${(i.oferta).nombre}</h4>
                                             <p>${(i.oferta).descripcion}</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
						</c:forEach>	
							
							
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                  Oferta #4 Restaurante Lorem ipsum
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseTwo1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="${prefix}resources/img/ultimo2.png">
                                        </div>
                                        <div class="media-body">
                                             <h4>Adipisicing elit</h4>
                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                  Oferta #5 Restaurante Lorem ipsum
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="${prefix}resources/img/ultimo3.png">
                                        </div>
                                        <div class="media-body">
                                             <h4>Adipisicing elit</h4>
                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                  Oferta #1 Restaurante Lorem ipsum
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFour1" class="panel-collapse collapse">
                              <div class="panel-body">
                                <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="${prefix}resources/img/ultimo4.png">
                                        </div>
                                        <div class="media-body">
                                             <h4>Adipisicing elit</h4>
                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>
                        </div><!--/#accordion1-->
                    </div>
                </div>

            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#middle-->
<%@ include file="../fragments/footer.jspf" %>

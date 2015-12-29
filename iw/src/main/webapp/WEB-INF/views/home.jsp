<%@ include file="../fragments/header.jspf" %>
<section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(${prefix}resources/img/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">ComerComerComerComer</h1>
                                    <h2 class="animation animated-item-2">ComerComerComer</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read Comer</a>
                                </div>								
                            </div>
							<div class="col-sm-6 hidden-xs animation animated-item-4">
									<div class="slider-img">
										<img src="${prefix}resources/img/slider/img1.png" class="img-responsive">
									</div>
								</div>
                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(${prefix}resources/img/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">LorComerComerComerComerComerComerelComert</h1>
                                    <h2 class="animation animated-item-2">remque laudantium totam rem aperiam, eaComerComerComerComerComerque ipsa...</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read Comer</a>
                                </div>								
                            </div>							
							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="${prefix}resources/img/slider/img2.png" class="img-responsive">
								</div>
							</div>
                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(${prefix}resources/img/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Lorem Comer dolor sit Comer consectetur Comer elit</h1>
                                    <h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, Comer ipsa...</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Comer MoComerre</a>
                                </div>							
                            </div>   
							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="${prefix}resources/img/slider/img3.png" class="img-responsive">
								</div>
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
                <li><a class="btn btn-default" href="#" data-filter=".bootstrap">#comida_china</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".html">#comida_americana</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".wordpress">#comida_mexicana</a></li>
            </ul><!--/#portfolio-filter-->
            
            

            <div class="row">
            
            	<div class="portfolio-items">
            
            
            
            	<c:forEach items="${platos}" var="i">
               		<div class="portfolio-item ${i.tags} col-xs-12 col-sm-4 col-md-3">
               		    <div class="recent-work-wrap">
	                        <img class="img-responsive" src="${prefix}resources/img/portfolio/recent/item${i.id}.png" alt="">
	                        <div class="overlay">
	                        <div class="recent-work-inner">
	                                <h3><a href="#">Oferta </a> </h3>
	                                <p>Esto es una descripci�n de la �ltima oferta</p>
									<!--<a class="preview" href="#" data-toggle="modal" data-target="#reservarModal"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>-->
									<a class="preview" href="/iw/reserva?id=${i.id}&dondeEstoy=home"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>
									<a class="preview" href="comercio_externo.html"><i class="fa fa-eye"></i> Ver restaurante</a>	
								</div> 
	                        </div>
	                    </div>
	                </div>   
	            	</c:forEach>
            	</div>
            </div><!--/.row-->
            
            
            
            <!-- Modal -->
			<div class="modal fade" id="reservarModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="reservarModalLabel">  Reservar para la "oferta"</h4>
			      </div>
			      <div class="modal-body">
					<form class="form-horizontal" role="form" action="/iw/home" method="POST">			  		
						<div class="form-group">
				        	<label class="control-label col-sm-4" for="nReservas"> N�mero de comensales</label>
				        	<input type="number" max="10" value="1" name="capacidad"/>
			            </div>
			            
			            <div class="form-group">
				        	<label class="control-label col-sm-2" for="fecha"> Fecha</label>
							<div class="col-sm-10">
								<div id="datepicker"></div>						
							</div>						        	
			            </div>	
			            
			             <div class="form-group">
				        	<label class="control-label col-sm-4" for="hora"> Hora</label>
				        	<div class="col-sm-14">
								<input type="number" name="hora" title="Hora" min="0" max="23" value=00 size=2 required>					
							</div>	
						</div>					            
			            
								
						<div class="progress">
						    <div class="progress-bar progress-bar-striped active color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						      40%
						    </div>
						  </div>		
						 <div class="modal-footer">							  
							<button type="submit" class="btn btn-primary" value="Submit"> Reservar</button>	 								 
						  </div>
			          </form>
	
	
			      </div>
			      
			    </div>
			  </div>
			</div>
            
            
            
        </div><!--/.container-->
    </section><!--/#recent-works-->


    <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="skill">
                        <h2>Locales m�s populares</h2>                       
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
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                  Oferta #2 Restaurante Lorem ipsum
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>

                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="${prefix}resources/img/ultimo.png">
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

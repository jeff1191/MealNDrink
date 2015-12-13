<%@ include file="../fragments/header.jspf" %>
<section id="portfolio">
        <div class="container">
            <div class="center">
               <h2>Últimas ofertas</h2>
            </div>
        

            <ul class="portfolio-filter text-center">
                <li><a class="btn btn-default active" href="#" data-filter="*">Todas las ofertas</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".bootstrap">#comida_china</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".html">#comida_americana</a></li>
                <li><a class="btn btn-default" href="#" data-filter=".wordpress">#comida_mexicana</a></li>
            </ul><!--/#portfolio-filter-->

            <div class="row">
            
            	<div class="portfolio-items">
            
            	<c:forEach items="${platos}" var="i">
               		<div class="portfolio-item bootstrap col-xs-12 col-sm-4 col-md-3">
               		    <div class="recent-work-wrap">
	                        <img class="img-responsive" src="${prefix}resources/img/portfolio/recent/item1.png" alt="">
	                        <div class="overlay">
	                        <div class="recent-work-inner">
	                                <h3><a href="#">${i[param['get.getNombre']]} </a> </h3>
	                                <p>Esto es una descripción de la última oferta</p>
									<a class="preview" href="#" data-toggle="modal" data-target="#reservarModal"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>
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
			        <h4 class="modal-title" id="reservarModalLabel"> Iniciar sesión</h4>
			      </div>
			      <div class="modal-body">
		
					<form role="form">
					
						<div class="form-group">
				        	<label for="nReservas"> Número de comensales</label>
				        	<input type="number" name="quantity" min="1" max="10" value=1 required>
			            </div>
			            
			            <div class="form-group">
				        	<label for="fecha"> Fecha</label>
							<div id="datepicker"></div>				        	
			            </div>	
			            
			             <div class="form-group">
				        	<label for="hora"> Hora</label>
							<input type="number" name="hora" title="Hora" min="0" max="23" value=00 size=2 required>
							<label for="hora"> :</label>
							<input type="number" name="minutos" title="Minutos" min="0" max="59" value=00 size=2 required>
						</div>					            
			            
								
						<div class="progress">
						    <div class="progress-bar progress-bar-striped active color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						      40%
						    </div>
						  </div>		
								
										
			            
			          </form>
	
	
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary"> Reservar</button>
			      </div>
			    </div>
			  </div>
			</div>
            
        </div>
    </section><!--/#portfolio-item-->
<%@ include file="../fragments/footer.jspf" %>
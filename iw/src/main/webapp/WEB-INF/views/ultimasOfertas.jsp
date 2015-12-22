<%@ include file="../fragments/header.jspf" %>
<section id="portfolio">
        <div class="container">
            <div class="center">
               <h2>Últimas ofertas</h2>
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
	                        <img class="img-responsive" src="${prefix}resources/img/database/offers/${i.foto}" alt="">
	                        <div class="overlay">
	                        <div class="recent-work-inner">
	                                <h3><a href="#">${i.nombre}</a></h3>
	                                <p>${i.descripcion}</p>
									<a class="preview" href="#" data-toggle="modal" data-target="#reservarModal${i.nombre}"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>
									<a class="preview" href="/iw/comercio_externo?id=${(i.local).ID}"><i class="fa fa-eye"></i> Ver restaurante</a>	
								</div> 
	                        </div>
	                    </div>
	                </div>   
	            	</c:forEach>
            	</div>
            </div><!--/.row-->
           
            <!-- Modal -->
			<div class="modal fade" id="reservarModal${i.nombre}" tabindex="-1" role="dialog" aria-labelledby="ModalLabel">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title"> Reservar para ${i.nombre}</h4>
			      </div>
			      <div class="modal-body">
			  		<form class="form-horizontal" role="form" action="/iw/ultimasOfertas" method="POST">			  		
						<div class="form-group">
				        	<label class="control-label col-sm-4" for="nReservas"> Número de comensales</label>
				        	<div class="col-sm-14">
				        		<input type="number" max="10" value="1" name="capacidad"/>
				        	</div>
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
			</div>  <!-- End Modal -->
          
        </div>
    </section><!--/#portfolio-item-->

<%@ include file="../fragments/footer.jspf" %>
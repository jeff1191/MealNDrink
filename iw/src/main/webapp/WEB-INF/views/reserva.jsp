<%@ include file="../fragments/header.jspf" %>
<section id="about-us">
        <div class="container">
			<div class="center">
				<h2>Reservas</h2>
				<br>	
				<p class="lead">
					Estas reservando la oferta <b>${infoOferta.nombre}</b> del local <i>${(infoOferta.local).nombre}</i>
				</p>			
			</div>
			<div class="row">
				 <div class="col-md-6 col-sm-6" align="center">				 	
				 	<img class="img-responsive" src="ofertasFoto?id=${infoOferta.ID}.jpg" alt="">				 		 
				 </div>			
				 <div class="col-md-6 col-sm-6" align="center">
				 	<form id="formBook" class="form-horizontal" role="form" action="nuevaReserva" method="POST">	
				 	<p class="lead"><b>Capacidad actual ${infoOferta.capacidadActual}/${infoOferta.capacidadTotal}</b></p>				 		  		
						<div class="form-group">
				        	<label class="control-label col-lg-4" for="reservas"> Comensales</label>
				        	<div class="col-lg-6">
				        		<input id="capacidad" name="capacidad" class="form-control" required="required" 
				        		type="number" min=1 max="${infoOferta.capacidadTotal}" value="" placeholder="¿Cuantos sois?"/>
			            	</div>
			            </div>			            
			            <div class="form-group">
				        	<label class="control-label col-lg-4" for="datepicker"> Fecha</label>
				        	<div class="col-lg-6">
								<input id="datepicker" name="fecha" class="form-control" required="required" 
								placeholder="Selecciona una fecha (dd/mm/yyyy)" value="" />	
							</div>									        	
			            </div>				            
			             <div class="form-group">
				        	<label class="control-label col-lg-4" for="timepicker"> Hora</label>
				        	<div class="col-lg-6">
				        		<input id="hora" name="hora" class="form-control" required="required" 
				        		type="text" placeholder="Selecciona una hora (hh:mm)" value="" />				        		
				        	</div>						
						</div>		
							<input hidden="submit" id="oferta" name="oferta" value="${infoOferta.ID}" />
							<input hidden="submit" id="dondeEstoy" name="dondeEstoy" value="${paginaVuelta}" />			
					   <div class="form-group">
					  	<button type="submit" class="btn btn-primary" value="Submit" id="botonReserva" name="botonReserva"> Reservar</button>	 								 								
		         	   </div>
			          </form>
				 </div>		 	   
			</div><!-- end row -->
		</div><!--/.container-->
    </section><!--/about-us-->
<%@ include file="../fragments/footer.jspf" %>

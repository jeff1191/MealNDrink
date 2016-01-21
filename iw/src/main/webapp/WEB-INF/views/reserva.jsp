<%@ include file="../fragments/header.jspf" %>
<script type="text/javascript">
	$(function() {
		$("#botonReserva").click(function() {
			alert("Se ha realizado la reserva");
		})
	})
</script>
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
				 	<img class="img-responsive" src="${prefix}resources/img/database/offers/${infoOferta.foto}" alt="">				 		 
				 </div>			
				 <div class="col-md-6 col-sm-6" align="center">
				 	<form class="form-horizontal" role="form" action="reserva" method="POST">	
				 	<p class="lead"><b>Capacidad actual ${infoOferta.capacidadActual}/${infoOferta.capacidadTotal}</b></p>				 		  		
						<div class="form-group">
				        	<label class="control-label col-lg-4" for="reservas"> Comensales</label>
				        	<div class="col-lg-6">
				        		<input id="reservas" class="form-control" type="number" min=1 max="${infoOferta.capacidadTotal}" value="" name="capacidad" placeholder="¿Cuantos sois?"/>
			            	</div>
			            </div>			            
			            <div class="form-group">
				        	<label class="control-label col-lg-4" for="datepicker"> Fecha</label>
				        	<div class="col-lg-6">
								<input id=datepicker class="form-control" type="text" name="fecha" placeholder="Selecciona una fecha" value="" />	
							</div>									        	
			            </div>				            
			             <div class="form-group">
				        	<label class="control-label col-lg-4" for="timepicker"> Hora</label>
				        	<div class="col-lg-6">
				        		<input id=timepicker class="form-control" type="text" name="hora" placeholder="Selecciona una hora" value="" />
				        	</div>						
						</div>		
							<input hidden="submit" name="oferta" value="${infoOferta.ID}" />
							<input hidden="submit" name="dondeEstoy" value="${paginaVuelta}" />			
					   <div class="form-group">
					  	<button type="submit" class="btn btn-primary" value="Submit" id="botonReserva" name="botonReserva"> Reservar</button>	 								 								
		         	   </div>
			          </form>
				 </div>		 	   
			</div><!-- end row -->
		</div><!--/.container-->
    </section><!--/about-us-->
<%@ include file="../fragments/footer.jspf" %>

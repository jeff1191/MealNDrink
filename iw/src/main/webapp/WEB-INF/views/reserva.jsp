<%@ include file="../fragments/header.jspf" %>
<section id="about-us">
        <div class="container">
			<div class="center">
				<h2>Reservas</h2>				
			</div>
			<div class="row">
				 <div class="col-md-6 col-sm-6" align="center">
				 	<img class="img-responsive" src="${prefix}resources/img/database/offers/${infoOferta.foto}" alt="">
				 	<br></br>
				 	<p class="lead">Estas reservando la oferta <b>${infoOferta.nombre}</b> del local <i>${(infoOferta.local).nombre}</i></p>	 
				 </div>			
				 <div class="col-md-6 col-sm-6" align="center">
				 	<p class="lead">Capacidad actual</p>
					<div class="progress">
					    <div class="progress-bar progress-bar-striped active color1" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="${infoOferta.capacidadTotal}" style="width:${infoOferta.capacidadActual}%">
					      ${infoOferta.capacidadActual}/${infoOferta.capacidadTotal}
					    </div>
					</div>
					<br></br>
				 	<form class="form-horizontal" role="form" action="/mealndrink/${paginaVuelta}" method="POST">			  		
						<div class="form-group">
				        	<label class="control-label col-sm-4" for="reservas"> Número de comensales</label>
				        	<input id="reservas" type="number" max="${infoOferta.capacidadTotal}" value=0 name="capacidad" placeholder="¿Cuantos sois?"/>
			            </div>			            
			            <div class="form-group">
				        	<label class="control-label col-sm-4" for="datepicker"> Fecha</label>
							<input id=datepicker class="form-control" type="text" name="fecha" placeholder="Selecciona una fecha" value="" />										        	
			            </div>				            
			             <div class="form-group">
				        	<label class="control-label col-sm-4" for="timepicker"> Hora</label>
				        	<input id=timepicker class="form-control" type="text" name="hora" placeholder="Selecciona una hora" value="" />						
						</div>					
					   <div class="form-group">
					  	<button type="submit" class="btn btn-primary" value="Submit"> Reservar</button>	 								 								
		         	   </div>
			          </form>
				 </div>		 	   
			</div><!-- end row -->
		</div><!--/.container-->
    </section><!--/about-us-->
<%@ include file="../fragments/footer.jspf" %>

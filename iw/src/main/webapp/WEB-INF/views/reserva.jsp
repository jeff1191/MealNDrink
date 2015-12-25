<%@ include file="../fragments/header.jspf" %>
<section id="about-us">
        <div class="container">
			<div class="center">
				<h2>Reservas</h2>
				<p class="lead">Estas reservando la oferta ${infoOferta.nombre} del local ${(infoOferta.local).nombre}</p>
			</div>
			<form class="form-horizontal" role="form" action="/iw/${paginaVuelta}" method="POST">			  		
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
						   <div class="form-group">
						  	<label class="control-label" for="nReservas"> Tambien puedes llamar al ${((infoOferta.local).usuario).telefono} para hacer una reserva</label>					   				  
						   </div>
						   <div class="form-group">
						  	<button type="submit" class="btn btn-primary" value="Submit"> Reservar</button>	 								 								
			         	   </div>
			          </form>

	
		</div><!--/.container-->
    </section><!--/about-us-->
<%@ include file="../fragments/footer.jspf" %>

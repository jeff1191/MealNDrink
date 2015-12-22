<%@ include file="../fragments/header.jspf" %>
   <section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>${infoLocal.nombre}</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">
							<img src="${prefix}resources/img/database/locals/${infoLocal.foto}" height="350" width="350">                                  
							<h3>Dirección</h3>
							<p>${infoLocal.direccion}</p>
														
							<h3>Horario</h3>
							<p>${infoLocal.horario}</p>
																					
							<h3>Contacto</h3>
							<p>${(infoLocal.usuario).email}</p>
							<p>${(infoLocal.usuario).telefono}</p>
							<p>Preguntar por ${(infoLocal.usuario).nombre}</p>

							<h3>Tags</h3>
							<p>${infoLocal.tags}</p>

							<div>
								<h3>Puntuación</h3>
								<h2>${infoLocal.puntuacion}/5</h2>
							</div>
						</div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-8 col-sm-8">
                        <div class="feature-wrap">
		    		<ul class="nav nav-tabs">
				  <li class="active"><a href="#ofertas" data-toggle="tab">Ofertas del restaurante</a></li>
				  <li><a href="#opiniones" data-toggle="tab">Opiniones</a></li>
				</ul>


				<div class="tab-content">
				  <div class="tab-pane fade in active" id="ofertas">
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Oferta #1</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Oferta #2</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Oferta #3</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Oferta #4</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Oferta #5</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>
					<br></br>
					<button type="submit" class="btn btn-default">Anterior</button>
					<button type="submit" class="btn btn-default">Siguiente</button>
				</div>

				<div class="tab-pane fade" id="opiniones">
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/user.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Comentario #1</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>
					<div class="media">
						<div class="pull-left">							
							<img class="media-object" src="${prefix}resources/img/user.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">Comentario #2</h4>
							<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
						</div>
					</div>	
					<br></br>
					<button type="submit" class="btn btn-default">Anterior</button>
					<button type="submit" class="btn btn-default">Siguiente</button>
				</div>
                        </div>
                    </div><!--/.col-md-4-->

                </div><!--/.services-->
            </div><!--/.row--> 
</div>
            <div class="clients-area center">
                <h2>Ubicación</h2>
                <div>
					
				</div>
            </div>
        </section>
<%@ include file="../fragments/footer.jspf" %>

<%@ include file="../fragments/header.jspf" %>
<section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>Nombre de usuario</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">
                            <img src="${prefix}resources/img/user2.jpg" height="275" width="275">                                
							<h3>Mis datos</h3>
							<p>contact@mycuisine.com</p>
							<p>91 441 55 25</p>											
						</div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6">
                       
							<ul class="nav nav-tabs">
								<li class="active"><a href="#reservas" data-toggle="tab">Mis reservas</a></li>
								<li><a href="#opiniones" data-toggle="tab">Mis opiniones</a></li>
								<li><a href="#editar" data-toggle="tab">Editar mis datos</a></li>
							</ul>						
									
							<div class="tab-content">
								<div class="tab-pane fade in active" id="reservas">
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Reserva #1</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Reserva #2</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Reserva #3</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>									
									<br></br>
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>
								</div>						
								<div class="tab-pane fade" id="opiniones">
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/res_op.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Comentario #1</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/res_op.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Comentario #2</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>	
									<br></br>
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>									
								</div>
								<div class="tab-pane fade" id="editar">
									
										<form role="form">
										  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" id="name" placeholder="Introduce un nuevo nombre">
										  </div>
										  <div class="form-group">
											<label for="pwd">Contraseña:</label>
											<input type="password" class="form-control" id="pwd" placeholder="Introduce una nueva contraseña">
										  </div>
										  <div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" id="email" placeholder="Introduce un nuevo email">
										  </div>
										  <div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" id="tel" placeholder="Introduce un nuevo telefono">
										  </div>
										  <div class="form-group">
											<label for="file">Imagen de perfil:</label>
											<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
										  </div>										  
										  <br>
										  <button type="submit" class="btn btn-default">Cancelar</button>
										  <button type="submit" class="btn btn-default">Enviar</button>
										</form>										
																	
								</div>
							</div><!--tab content-->
						
					</div><!--/.services-->
            </div><!--/.row--> 
        </section>
<%@ include file="../fragments/footer.jspf" %>
        
<%@ include file="../fragments/header.jspf" %>
         <section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>Nombre de restaurante</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">							
                            <img src="${prefix}resources/img/restaurant.jpg" height="350" width="300">
                               
							<h3>Dirección</h3>
							<p>1051 Nipomo St San Luis Obispo, CA 93401</p>
														
							<h3>Horario</h3>
							<p><span>MONDAY-FRIDAY: </span>8am-6pm</p>
							<p><span>SATURDAY-SUNDAY: </span>8am-10pm</p>
														
							<h3>Contacto</h3>
							<p>contact@mycuisine.com</p>
							<p>91 441 55 25</a></p>

                        	<h3>Tags</h3>
							<p>#TagUno #TagDos #TagTres #TagCuatro #TagCinco</p>

                            <div>
								<h3>Puntuación</h4>
								<h2>4,5/5</h2>
							</div>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-8 col-sm-8">
                        
							<ul class="nav nav-tabs custom-tab">
							  <li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionar mis ofertas
								<span class="caret"></span></a>
								<ul class="dropdown-menu">
								  <li class="active"><a href="#o_disponibles" data-toggle="tab">Listado</a></li>
										<li><a href="#o_add" data-toggle="tab">Añadir</a></li>
										<li><a href="#o_delete" data-toggle="tab">Eliminar</a></li>
								</ul>
							  </li>
							  <li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">QRs
								<span class="caret"></span></a>
								<ul class="dropdown-menu">
								  <li><a href="#qrpendientes" data-toggle="tab">Pendientes</a></li>
								  <li><a href="#qrvalidados" data-toggle="tab">Validados</a></li>
								</ul>
							  </li>
							  <li><a href="#opiniones" data-toggle="tab">Opiniones</a></li>
							  <li><a href="#editar" data-toggle="tab">Editar mis datos</a></li>							  
							  <li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionar mis tags
								<span class="caret"></span></a>
								<ul class="dropdown-menu">
								  <li><a href="#tags" data-toggle="tab">Listado</a></li>
								  <li><a href="#addTag" data-toggle="tab">Añadir</a></li>
								  <li><a href="#deleteTag" data-toggle="tab">Eliminar</a></li>
								</ul>
							  </li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane fade in active" id="o_disponibles">
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
								<div class="tab-pane fade" id="o_add"> <!--form to add ofert-->
									<form role="form">
										  <div class="form-group">
											<label for="name">Nombre de la oferta:</label>
											<input type="text" class="form-control" id="name" placeholder="Introduzca el nuevo nombre">
										  </div>
										  <div class="form-group">
											<label for="endTime">Fecha límite:</label>
											<input type="time" class="form-control" id="endTime" placeholder="Introduzca el dia límite">
										  </div>
										  <div class="form-group">
											<label for="cap">Capacidad total:</label>
											<input type="number" class="form-control" id="cap" placeholder="Introduzca el numero máximo de beneficiarios">
										  </div>
										  <div class="form-group">
											<label for="descriptcion">Descripción:</label>
											<input type="text" class="form-control" id="descriptcion" placeholder="Introduzca la descripción de la oferta">
										  </div>
										  <div class="form-group">
											<label for="file">Imagen de la oferta:</label>
											<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
										  </div>										  
										  <br>
										  <button type="submit" class="btn btn-default">Cancelar</button>
										  <button type="submit" class="btn btn-default">Enviar</button>
									</form>			
								</div>
								<div class="tab-pane fade" id="o_delete">
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">											
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #1</h4>
											 <button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">										
												<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #2</h4>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
												<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #3</h4>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<a href="#">
												<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
											</a>
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #4</h4>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
												<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #5</h4>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<br></br>
									<button type="submit" class="btn btn-default"> Anterior</button>
									<button type="submit" class="btn btn-default"> Siguiente</button>
								</div>
								<div class="tab-pane fade" id="qrpendientes">
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/qr.png">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Codigo QR #1</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/qr.png">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Codigo QR #2</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/qr.png">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Codigo QR #3</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
										</div>
									</div>		
									<br></br>									
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>
								</div>
								<div class="tab-pane fade" id="qrvalidados">
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/qr.png">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Codigo QR #4</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/qr.png">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Codigo QR #5</h4>
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
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/user.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Comentario #2</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/user.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Comentario #3</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default">Eliminar</button>
										</div>
									</div>									
									<br></br>
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>
								   </div>
								<div class="tab-pane fade" id="editar"><!--form to edit restaurant profile data-->
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
											<label for="timeBusiness">Horario:</label>
											<input type="time" class="form-control" id="timeBusiness" placeholder="Introduce un nuevo horario">
										  </div>
										   <div class="form-group">
											<label for="dir">Dirección:</label>
											<input type="text" class="form-control" id="dir" placeholder="Introduce una nueva direccion">
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
								<div class="tab-pane fade" id="tags"> <!--tags-->
									<h4>Tag #1</h4>
									<h4>Tag #2</h4>
									<h4>Tag #3</h4>
									<h4>Tag #4</h4>
									<h4>Tag #5</h4>
								</div>
								<div class="tab-pane fade" id="addTag"> <!--tags-->
									<form role="form">
									  <div class="form-group">
										<label for="name">Nombre:</label>
										<input type="text" class="form-control" id="name" placeholder="Introduce un tag nuevo">
									  </div>
									  <br></br>
									  <button type="submit" class="btn btn-default">Cancelar</button>
									  <button type="submit" class="btn btn-default">Añadir</button>
									</form>			
								</div>
								<div class="tab-pane fade" id="deleteTag"> <!--tags-->
									<h4>Tag #1</h4> 
									<button type="submit" class="btn btn-default">Eliminar</button>
									<h4>Tag #2</h4> 
									<button type="submit" class="btn btn-default">Eliminar</button>
									<h4>Tag #3</h4> 
									<button type="submit" class="btn btn-default">Eliminar</button>
									<h4>Tag #4</h4> 
									<button type="submit" class="btn btn-default">Eliminar</button>
									<h4>Tag #5</h4>
									<button type="submit" class="btn btn-default">Eliminar</button>
								</div>
							</div><!--tab content-->
                     
                    </div><!--/.col-md-4-->
                </div><!--/.row-->
            </div><!--container--> 
        </section>
<%@ include file="../fragments/footer.jspf" %>

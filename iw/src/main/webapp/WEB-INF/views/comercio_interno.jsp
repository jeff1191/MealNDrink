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
							  <li><a href="#ofertas" data-toggle="tab">Mis ofertas</a></li>
							  <li><a href="#qrs" data-toggle="tab">QRs</a></li>
							  <li><a href="#opiniones" data-toggle="tab">Opiniones</a></li>
							  <li><a href="#editar" data-toggle="tab">Mis datos</a></li>							  
							  <li><a href="#tags" data-toggle="tab">Mis tags</a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane fade in active" id="ofertas">
								 <div class="media">
								  	<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddOffer"><span class="glyphicon glyphicon-plus"></span> Añadir nueva oferta</button>
								  	<br></br>
								  </div>
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">											
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #1</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #2</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #3</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">											
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #4</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">											
											<img class="media-object" src="${prefix}resources/img/pizza120x120.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Oferta #5</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<br></br>
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>
								</div>
								
								<!-- Modal Add Offer-->
								<div class="modal fade" id="ModalAddOffer" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel"> Añadir una nueva oferta</h4>
								      </div>
								      <div class="modal-body">
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
										</form>							
								      </div>
								      <div class="modal-footer">						      	 
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
								      </div>
								    </div>
								  </div>
								</div>     
								<!-- End Modal Add Offer-->
														
								<div class="tab-pane fade" id="qrs">								
									<div class="row">										
									  <div class="col-md-6">
									  	<b><big>Pendientes</big></b>
									  	<br></br>
										<table class="table table-bordered">
										    <thead>
										        <tr>
										            <th>QR</th>
										            <th>Imagen</th>
										            <th>Información</th>										            								            
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td><h4 class="media-heading">#1</h4></td>
										            <td><img class="media-object" src="${prefix}resources/img/qr.png"></td>
										            <td><p>Cras sit amet nibh libero. Nulla vel metus scelerisque ante sollicitudin commodo.</p></td>									            									       
										        </tr>
										        <tr>
										            <td><h4 class="media-heading">#2</h4></td>
										            <td><img class="media-object" src="${prefix}resources/img/qr.png"></td>
										            <td><p>Cras sit amet nibh libero. Nulla vel metus scelerisque ante sollicitudin commodo.</p></td>									            
										        </tr>
										        <tr>									        	
										            <td><h4 class="media-heading">#3</h4></td>
										            <td><img class="media-object" src="${prefix}resources/img/qr.png"></td>
													<td><p>Cras sit amet nibh libero. Nulla vel metus scelerisque ante sollicitudin commodo.</p></td>
										        </tr>
										    </tbody>
										</table>
									  </div>
									  <div class="col-md-6">
									  	<b><big>Validados</big></b>
									  	<br></br>
									  	<table class="table table-bordered">
										    <thead>
										        <tr>
										            <th>QR</th>
										            <th>Imagen</th>
										            <th>Información</th>										            								            
										        </tr>
										    </thead>
										    <tbody>
										         <tr>
										            <td><h4 class="media-heading">#4</h4></td>
										            <td><img class="media-object" src="${prefix}resources/img/qr.png"></td>
										            <td><p>Cras sit amet nibh libero. Nulla vel metus scelerisque ante sollicitudin commodo.</p></td>									            									       
										        </tr>
										        <tr>
										            <td><h4 class="media-heading">#5</h4></td>
										            <td><img class="media-object" src="${prefix}resources/img/qr.png"></td>
										            <td><p>Cras sit amet nibh libero. Nulla vel metus scelerisque ante sollicitudin commodo.</p></td>									            
										        </tr>
										    </tbody>
										</table>								  
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
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/user.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Comentario #2</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>
									<div class="media">
										<div class="pull-left">
											<img class="media-object" src="${prefix}resources/img/user.jpg">
										</div>
										<div class="media-body">
											<h4 class="media-heading">Comentario #3</h4>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
											<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
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
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
									</form>			
								</div>
								<div class="tab-pane fade" id="tags"> <!--tags-->
									<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddTag"><span class="glyphicon glyphicon-plus"></span> Añadir un nuevo tag</button>
								  	<br></br>								
									<h4>Tag #1</h4> 
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
									<h4>Tag #2</h4> 
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
									<h4>Tag #3</h4> 
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
									<h4>Tag #4</h4> 
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
									<h4>Tag #5</h4>
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
								</div>
																	
								<!-- Modal Add Tag-->
								<div class="modal fade" id="ModalAddTag" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="myModalLabel"> Añadir un nuevo tag</h4>
								      </div>
								      <div class="modal-body">
										<form role="form">
									  <div class="form-group">
										<label for="name">Nombre:</label>
										<input type="text" class="form-control" id="name" placeholder="Introduce un tag nuevo">
									  </div>									  
									</form>					
								      </div>
								      <div class="modal-footer">						      	 
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
								      </div>
								    </div>
								  </div>
								</div>     
								<!-- End Modal Add Tag-->
														
							</div><!--tab content-->
                     
                    </div><!--/.col-md-4-->
                </div><!--/.row-->
            </div><!--container--> 
        </section>
<%@ include file="../fragments/footer.jspf" %>

<%@ include file="../fragments/header.jspf" %>
<section id="feature" class="transparent-bg">
        <div class="container">
           <div class="center">
                <h2>Administración</h2>                
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-6 col-sm-6">
						<img src="${prefix}resources/img/tux.jpg" height="175" width="250">  
						<h3>Bienvenido Administrador</h3>
						<p>Esta es una página de administración, Esta es una página de administraciónEsta es una página de administración</p><br/>
						<h3>Esta es una página de administración</h3>
						<p>+6221 888 888 90 <br>
							+6221 888 88891</p>
						<p>info@ucm.es</p>
                    </div><!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6">
					<ul class="nav nav-tabs">
					  <li><a href="#lusuarios" data-toggle="tab">Gestionar usuarios</a></li>
					  <li><a href="#llocales" data-toggle="tab">Gestionar locales</a></li>
					  <li><a href="#editarDatos" data-toggle="tab">Mis datos</a></li>
					</ul>

					<div class="tab-content">
					  <div class="tab-pane fade in active" id="lusuarios">
					  <div class="media">
					  	<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddUser"><span class="glyphicon glyphicon-plus"></span> Añadir nuevo usuario</button>
					  	<br></br>
					  </div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Usuario #1</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Usuario #2</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Usuario #3</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Usuario #4</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Usuario #5</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default">Anterior</button>
						<button type="submit" class="btn btn-default">Siguiente</button>
					</div>

					  <!-- Modal Add User-->
						<div class="modal fade" id="ModalAddUser" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"> Añadir un nuevo usuario</h4>
						      </div>
						      <div class="modal-body">
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
								</form>									
						      </div>
						      <div class="modal-footer">	
								  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
						 		  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
						      </div>
						    </div>
						  </div>
						</div>     
						<!-- End Modal Add User-->
					  
					  
					  <div class="tab-pane fade" id="llocales">
					  	<div class="media">
					  		<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddLocal"><span class="glyphicon glyphicon-plus"></span> Añadir nuevo local</button>
					  		<br></br>
					  	</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Local #1</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Local #2</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Local #3</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Local #4</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Local #5</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
								<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default">Anterior</button>
						<button type="submit" class="btn btn-default">Siguiente</button>
					</div>
        				<!-- Modal Add Local-->
						<div class="modal fade" id="ModalAddLocal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"> Añadir un nuevo local</h4>
						      </div>
						      <div class="modal-body">
								<form>
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
									<label for="tags">Tags iniciales:</label>
									<input type="text" class="form-control" id="tags" placeholder="Introduce unos tags iniciales">
								  </div>
								  <div class="form-group">
									<label for="file">Imagen de perfil:</label>
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
						<!-- End Modal Add Local-->
        					 
					  <div class="tab-pane fade" id="editarDatos">
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
						  <br></br>
						  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
						  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
						</form>	
					  </div>
					</div>

				</div>

                    </div><!--/.col-md-4-->

                   
                </div><!--/.services-->
            </div><!--/.row--> 


           
        </div><!--/.container-->
    </section><!--/#feature-->
    <%@ include file="../fragments/footer.jspf" %>

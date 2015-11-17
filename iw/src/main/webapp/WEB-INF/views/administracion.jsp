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
					  <li class="dropdown">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionar clientes
					    <span class="caret"></span></a>
					    <ul class="dropdown-menu">
					      		<li class="active"><a href="#lclientes" data-toggle="tab">Listado</a></li>
	     				      	<li><a href="#addClient" data-toggle="tab">Añadir</a></li>
	     				      	<li><a href="#editClient" data-toggle="tab">Editar</a></li>
					     		<li><a href="#deleteClient" data-toggle="tab">Eliminar</a></li>
					    </ul>
					  </li>


					  <li class="dropdown">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionar comercios
					    <span class="caret"></span></a>
					    <ul class="dropdown-menu">
						  <li><a href="#lcomercios" data-toggle="tab">Listado</a></li>
					      <li><a href="#addComercios" data-toggle="tab">Añadir</a></li>
					      <li><a href="#editComercios" data-toggle="tab">Editar</a></li>
					      <li><a href="#deleteComercios" data-toggle="tab">Eliminar</a></li>
					    </ul>
					  </li>
					  <li><a href="#editarDatos" data-toggle="tab">Editar mis datos</a></li>
					</ul>


					<div class="tab-content">
					  <div class="tab-pane fade in active" id="lclientes">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #1</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #2</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #3</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #4</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #5</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default">Anterior</button>
						<button type="submit" class="btn btn-default">Siguiente</button>
					</div>

					  <div class="tab-pane fade" id="addClient">
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

					  <div class="tab-pane fade" id="editClient">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #1</h4>
								 <button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #2</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #3</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #4</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #5</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default"> Anterior</button>
						<button type="submit" class="btn btn-default"> Siguiente</button>

					  </div>

					  <div class="tab-pane fade" id="deleteClient">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #1</h4>
								 <button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #2</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #3</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #4</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/user.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Cliente #5</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default"> Anterior</button>
						<button type="submit" class="btn btn-default"> Siguiente</button>
					  </div>
					  
					  <div class="tab-pane fade" id="lcomercios">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #1</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #2</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #3</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #4</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #5</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default">Anterior</button>
						<button type="submit" class="btn btn-default">Siguiente</button>
					</div>
					  <div class="tab-pane fade" id="addComercios">
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
						  <button type="submit" class="btn btn-default">Cancelar</button>
						  <button type="submit" class="btn btn-default">Enviar</button>
						</form>
					</div>
        
       				<div class="tab-pane fade" id="editComercios">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #1</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #2</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #3</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #4</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #5</h4>
								<button type="submit" class="btn btn-default">Editar</button>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default">Anterior</button>
						<button type="submit" class="btn btn-default">Siguiente</button>
					</div>

        			<div class="tab-pane fade" id="deleteComercios">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #1</h4>
								 <button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #2</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #3</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #4</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}resources/img/bar.jpg">
							</div>
							<div class="media-body">
								<h4 class="media-heading">Comercio #5</h4>
								<button type="submit" class="btn btn-default">Eliminar</button>
							</div>
						</div>
						<br></br>
						<button type="submit" class="btn btn-default"> Anterior</button>
						<button type="submit" class="btn btn-default"> Siguiente</button>
					</div>


					 
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
						  <br>
						  <button type="submit" class="btn btn-default">Cancelar</button>
						  <button type="submit" class="btn btn-default">Enviar</button>
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

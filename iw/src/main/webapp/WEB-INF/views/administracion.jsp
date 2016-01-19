<%@ include file="../fragments/header.jspf" %>
<script type="text/javascript">

function activaBotonEliminacionLocal() {	
	var idLocal = $(this).attr("id").substring("delLocal_".length); 
	$.post( "eliminarLocal",{idLocal:idLocal},function(data){
			$('#TodosLocales').load('administracion div#TodosLocales');
	});
}
function activaBotonEliminacionComentario() {	
	var idComentario = $(this).attr("id").substring("delC_".length); 
	var idUsuario=$('#id_usuario').get(0).value;
	$.post( "eliminarComentario",{idUsuario:idUsuario,idComentario:idComentario},function(data){
			$('#TodosComentarios').load('usuario?id='+idUsuario+' div#TodosComentarios');
	});
}

function activaBotonEliminacionUsuario() {	
	var idUsuario = $(this).attr("id").substring("delUsuario_".length); 
	$.post( "eliminarUsuario",{idUsuario:idUsuario},function(data){
			$('#TodosUsuarios').load('administracion div#TodosUsuarios');
	});
}

$(function() {
	
	$("body").on("click", ".eliminaLocal", null, activaBotonEliminacionLocal);	
	$("body").on("click", ".eliminaComentario", null, activaBotonEliminacionComentario);
	$("body").on("click", ".eliminaUsuario", null, activaBotonEliminacionUsuario);
})
</script>

<section id="feature" class="transparent-bg">
        <div class="container">
           <div class="center">
                <h2>Administración</h2>                
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-6 col-sm-6">
						<input hidden="submit" id="id_admin" value="${admin.ID}" />
						<img src="usuariosFoto?id=${admin.foto}" height="175" width="250">  
						<h3>Bienvenido Administrador ${admin.nombre}</h3>
						<p>Esta es una página de administración, aqui podrá hacer todas las gestiones de usuarios y locales, además de editar tus datos personales</p><br/>
						<h3>Mis datos</h3>
						<p>+${admin.telefono}</p>
						<p>${admin.email}</p>
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
						  <div id="TodosUsuarios" class="TodosUsuarios">
							  <c:forEach items="${usuarios }" var="i">
								<div class="media">
									<div class="pull-left">
										<img class="media-object" src="usuariosFoto?id=${i.foto}" height="140" width="140"> 
									</div>
									<div class="media-body">
										<h4 class="media-heading">${i.nombre} #1</h4>
										<p>E-mail: ${i.email}</p>
										<p>Teléfono: ${i.telefono}</p>
										<p>Rol: ${i.rol}</p>
										<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
										<button id="delUsuario_${i.ID}" class="eliminaUsuario"><span class="glyphicon glyphicon-trash"></span>Eliminar</button>
									</div>
								</div>
								</c:forEach>
							</div>
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
									<label for="tag">Rol:</label>
									 <select class="form-control" id="tag">
									  <option value="usuario">Usuario</option>
									  <option value="local">Local</option>
									</select>						
								  </div>
								  <div class="form-group">
									<label for="file">Imagen de perfil:</label>
									<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
								  </div>
								  <div class="modal-footer">						      	 
									  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
									  <button type="submit" class="btn" data-dismiss="modal">Cancel</button>
							      </div>									  						  
								</form>									
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
					  	<div id="TodosLocales" class="TodosLocales">
					  	<c:forEach items="${locales}" var="i">
							<div class="media">
								<div class="pull-left">
									<img src="localesFoto?id=${i.foto}" height="175" width="250"> 
								</div>
								<div class="media-body">
									<h4 class="media-heading">${i.nombre} #1</h4>
									<p>Usuario: ${i.usuario.nombre }</p>
									<p>Dirección:${i.direccion }</p>
									<p>Horario: ${i.horario }</p>								
									<p>Puntuación: ${i.puntuacion }</p>
									<button type="submit" id="edit_${i.ID}" value="${i}" class="btn btn-default" data-toggle="modal" data-target="#ModalEditLocal" ><span class="glyphicon glyphicon-pencil"></span> Editar</button>
									<button id="delLocal_${i.ID}" class="eliminaLocal"><span class="glyphicon glyphicon-trash"></span>Eliminar</button>
								</div>
							</div>
							</c:forEach>
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
								<form role="form" method="POST" enctype="multipart/form-data" action="nuevoLocal">
								<input hidden="submit" name="redireccion" value="administracion" />
								<div class="form-group">								
								<label for="file">Usuario:</label>								
								<select class="form-control" name="id_usuario" id="id_usuario">
									<c:forEach items="${usuarios}" var="i">																	 								
										  <option value="${i.ID}">${i.nombre}</option>																 
									</c:forEach>
								</select>	
								</div>	
								  <div class="form-group">
									<label for="name">Nombre:</label>
									<input type="text" class="form-control" id="name" name="name" placeholder="Introduce un nuevo nombre">
								  </div>
								  <div class="form-group">
									<label for="timeBusiness">Horario:</label>
									<input type="time" class="form-control" id="timeBusiness" name="timeBusiness" placeholder="Introduce un nuevo horario">
								  </div>
								  <div class="form-group">
									<label for="dir">Dirección:</label>
									<input type="text" class="form-control" id="dir" name="dir" placeholder="Introduce una nueva direccion">
								  </div>
								  <div class="form-group">
									<label for="email">Email:</label>
									<input type="email" class="form-control" id="email" name="email" placeholder="Introduce un nuevo email">
								  </div>
								  <div class="form-group">
									<label for="tel">Teléfono:</label>
									<input type="tel" class="form-control" id="tel" name="tel" placeholder="Introduce un nuevo telefono">
								  </div>
								  <div class="form-group">
									<label for="tags">Tags iniciales:</label>
									<input type="text" class="form-control" id="tags" name="tags" placeholder="Introduce unos tags iniciales">
								  </div>
								  <div class="form-group">
									<label for="file">Imagen de perfil:</label>
									<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
								  </div>
								  <div class="modal-footer">						      	 
									  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
									  <button type="submit" class="btn" data-dismiss="modal">Cancel</button>
							      </div>	
							      </form>											
						      </div>
							      
						      
						    </div>
						  </div>
						</div>     
						<!-- End Modal Add Local-->
						        				<!-- Modal Edit Local-->
						<div class="modal fade" id="ModalEditLocal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"> Editar local</h4>
						      </div>
						      <div class="modal-body">
								<form role="form" method="POST" enctype="multipart/form-data" action="nuevoLocal">
								<input hidden="submit" name="redireccion" value="administracion" />
								  <div class="form-group">
									<label for="name">Nombre:</label>
									<input type="text" class="form-control" id="name" name="name" placeholder="Introduce un nuevo nombre">
								  </div>
								  <div class="form-group">
									<label for="timeBusiness">Horario:</label>
									<input type="time" class="form-control" id="timeBusiness" name="timeBusiness" placeholder="Introduce un nuevo horario">
								  </div>
								  <div class="form-group">
									<label for="dir">Dirección:</label>
									<input type="text" class="form-control" id="dir" name="dir" placeholder="Introduce una nueva direccion">
								  </div>
								  <div class="form-group">
									<label for="email">Email:</label>
									<input type="email" class="form-control" id="email" name="email" placeholder="Introduce un nuevo email">
								  </div>
								  <div class="form-group">
									<label for="tel">Teléfono:</label>
									<input type="tel" class="form-control" id="tel" name="tel" placeholder="Introduce un nuevo telefono">
								  </div>
								  <div class="form-group">
									<label for="tags">Tags iniciales:</label>
									<input type="text" class="form-control" id="tags" name="tags" placeholder="Introduce unos tags iniciales">
								  </div>
								  <div class="form-group">
									<label for="file">Imagen de perfil:</label>
									<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
								  </div>
								  <div class="modal-footer">						      	 
									  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
									  <button type="submit" class="btn" data-dismiss="modal">Cancel</button>
							      </div>	
							      </form>											
						      </div>
							      
						      
						    </div>
						  </div>
						</div>     
						<!-- End Modal Edit Local-->	
        					 
					  <div class="tab-pane fade" id="editarDatos">

						<form role="form" method="POST" enctype="multipart/form-data" action="editarUsuario">
						<input hidden="submit" name="id_usuario" value="${admin.ID}" />
						<input hidden="submit" name="redireccion" value="administracion" />
						  <div class="form-group">
							<label for="name">Nombre:</label>
							<input type="text" class="form-control" id="nameUser" name="nameUser" value="${admin.nombre}">
						  </div>
						  <div class="form-group">
							<label for="pwd">Contraseña:</label>
							<input type="password" class="form-control" id="pwd" name="pwd" value="*****">
						  </div>
						  <div class="form-group">
							<label for="email">Email:</label>
							<input type="email" class="form-control" id="email" name="email" value="${admin.email }">
						  </div>
						  <div class="form-group">
							<label for="tel">Teléfono:</label>
							<input type="tel" class="form-control" id="tel" name="tel" value="${admin.telefono }">
						  </div>
						  <div class="form-group">
							<label for="file">Imagen de perfil:</label>
							<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
						  </div>										  
						  <br></br>
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

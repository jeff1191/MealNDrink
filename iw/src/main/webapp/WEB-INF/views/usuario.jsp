<%@ include file="../fragments/header.jspf" %>
<script type="text/javascript">

function activaBotonEliminacionLocal() {	
	var idLocal = $(this).attr("id").substring("del_".length); 
	var idUsuario=$('#id_usuario').get(0).value;
	$.post( "eliminarLocal",{idUsuario:idUsuario,idLocal:idLocal},function(data){
			$('#TodosLocales').load('usuario?id='+idUsuario+' div#TodosLocales');
	});
}

function activaBotonEliminacionComentario() {	
	var idComentario = $(this).attr("id").substring("delC_".length); 
	var idUsuario=$('#id_usuario').get(0).value;
	$.post( "eliminarComentario",{idUsuario:idUsuario,idComentario:idComentario},function(data){
			$('#TodosComentarios').load('usuario?id='+idUsuario+' div#TodosComentarios');
	});
}
$(function() {
	
	$("body").on("click", ".eliminaLocal", null, activaBotonEliminacionLocal);	
	$("body").on("click", ".eliminaComentario", null, activaBotonEliminacionComentario);	
})
</script>
<section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>${usuario.nombre}</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">
                            <img src="usuariosFoto?id=${usuario.ID}.jpg" height="275" width="275">                              
							<input hidden="submit" id="id_usuario" value="${usuario.ID}" /> 
							<h3>Mis datos</h3>
							<p>${usuario.email}</p>
							<p>${usuario.telefono}</p>											
						</div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6">
                       
							<ul class="nav nav-tabs">
								<li class="active"><a href="#reservas" data-toggle="tab">Mis reservas</a></li>
								<li><a href="#locales" data-toggle="tab">Mis locales</a></li>
								<li><a href="#opiniones" data-toggle="tab">Mis opiniones</a></li>
								<li><a href="#editar" data-toggle="tab">Mis datos</a></li>
							</ul>						
									
							<div class="tab-content">
								<div class="tab-pane fade in active" id="reservas">
									
										<c:forEach items="${usuario.reservas}" var="i">
										<div class="media">
											<div class="pull-left">
												<img class="media-object" WIDTH=178 HEIGHT=150 src="ofertasFoto?id=${i.ID}.jpg" >
											</div>										
											<div class="media-body">
												<h4 class="media-heading">Reserva #1</h4>
												<p>${i.oferta.nombre}</p>
												
												
												 <div id="qrcode"></div>
										            
									            <script>															
														$('#qrcode').qrcode({
														    "render": "div",
														    "size": 100,
														    "color": "#3a3",
														    "text": "${i.codigoQr}"
														});
												</script>
												
												
												<button id="delO_${i.oferta.ID}" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
											</div>
										</div>	
										</c:forEach>
										
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>	
									<br></br>
								</div>	
								
								<div class="tab-pane fade" id="locales">
								<div class="media">
								  	<button type="submit" id="AddNuevoLocal"class="btn btn-default" data-toggle="modal" data-target="#ModalAddLocal"><span class="glyphicon glyphicon-plus"></span> Añadir nuevo local</button>
								  	<br></br>
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
								<input hidden="submit" name="id_usuario" value="${usuario.ID}" />	
								<input hidden="submit" name="redireccion" value="usuario" />	
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
								<div id="TodosLocales" class="TodosLocales">
										<c:forEach items="${usuario.locales}" var="i">
										<div class="media">
											<div class="pull-left">
												<img class="media-object" WIDTH=178 HEIGHT=150 src="localesFoto?id=${i.ID}.jpg" >
											</div>										
											<div class="media-body">
												<h4 class="media-heading">${i.nombre} #1</h4>
												<p>Dirección:${i.direccion }</p>
												<p>Horario: ${i.horario }</p>								
												<p>Puntuación: ${i.puntuacion }</p>
												<button type="submit" id="edit_${i.ID}" value="${i}" data-toggle="modal" data-target="#ModalEditLocal" ><span class="glyphicon glyphicon-pencil"></span> Editar</button>
												<button id="del_${i.ID}" class="eliminaLocal"><span class="glyphicon glyphicon-trash"></span>Eliminar</button>
											</div>
										</div>	
										</c:forEach>
									</div>												
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>
									
									<br></br>
								</div>
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
								<input hidden="submit" name="redireccion" value="usuario" />
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
									
												
								<div class="tab-pane fade" id="opiniones">
									<div id="TodosComentarios" class="TodosComentarios">	
											<c:forEach items="${usuario.comentarios}" var="i">
												<div class="media">
												<div class="pull-left">
													<img class="media-object" WIDTH=178 HEIGHT=150 src="localesFoto?id=${i.ID}.jpg" >
												</div>
												<div class="media-body">
													<h4 class="media-heading">Comentario #1</h4>
													<p>${i.texto}</p>
													<button id="delC_${i.ID}" class="eliminaComentario"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
												</div>
												</div>
											</c:forEach>
										
										<button type="submit" class="btn btn-default">Anterior</button>
										<button type="submit" class="btn btn-default">Siguiente</button>									
									</div>
								</div>
								
								<div class="tab-pane fade" id="editar">
									
										<form role="form" method="POST" enctype="multipart/form-data" action="editarUsuario">
										 <input hidden="submit" name="id_usuario" value="${usuario.ID}" />
										  <input hidden="submit" name="redireccion" value="usuario" />
										  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" name="nameUser" id="nameUser" value="${usuario.nombre }">
										  </div>
										  <div class="form-group">
											<label for="pwd">Contraseña:</label>
											<input type="password" class="form-control" name="pwd" id="pwd" value="*****">
										  </div>
										  <div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" name="email" id="email" value="${usuario.email }">
										  </div>
										  <div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" name="tel" id="tel" value="${usuario.telefono }">
										  </div>
										  <div class="form-group">
											<label for="file">Imagen de perfil:</label>
											<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
										  </div>										  
										  <br>
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
										</form>										
																	
								</div>
							</div><!--tab content-->
						
					</div><!--/.services-->
            </div><!--/.row--> 
            </div>
        </section>
<%@ include file="../fragments/footer.jspf" %>
        
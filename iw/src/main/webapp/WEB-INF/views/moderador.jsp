<%@ include file="../fragments/header.jspf" %>
<section id="feature" class="transparent-bg">
        <div class="container">
           <div class="center">
                <h2>Moderacion</h2>                
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-5 col-sm-5">
						<input hidden="submit" id="id_admin" value="${moderador.ID}" />
						<img src="usuariosFoto?id=${moderador.ID}.jpg" height="175" width="250">  
						<h3><b>Bienvenido Administrador ${moderador.nombre}</b></h3>
						<p>Esta es una página de moderacion. </br> Aqui podrá hacer todas las gestiones </br> de usuarios y comentarios, además de editar </br> sus datos personales</p><br/>
						<h3><b>Mis datos</b></h3>
						<p>Telefono: ${moderador.telefono}</p>
						<p>Email: ${moderador.email}</p>
                    </div><!--/.col-md-4-->

                    <div class="col-md-7 col-sm-7">
					<ul class="nav nav-tabs"> 						
					  <li><a href="#lcomments" data-toggle="tab">Gestionar comentarios</a></li>
					  <li><a href="#editarDatos" data-toggle="tab">Mis datos</a></li>				
					</ul>

					<div class="tab-content">
									  
					  <div class="tab-pane fade in active" id="lcomments">
					  	<div class="media">
					  		<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalSendAlert"><span class="glyphicon glyphicon-plus"></span> Mandar aviso a un usuario</button>
					  		<br></br>
					  	</div>
					  	<div id="TodosLocales" class="TodosLocales">
					  	<c:forEach items="${comentarios}" var="i">
							<div class="media">
								<div class="pull-left">
									<div id="imagenMedia" class="imagenMedia">
										<img src="usuariosFoto?id=${i.usuario.ID}.jpg"> 
									</div>
								</div>
								<div class="media-body">
									<h4 class="media-heading">${(i.usuario).nombre}</h4>									
									<c:set var="now" value="${i.fecha}" />
									<p>${i.texto} </br> 
									<small>
									Realizado el <fmt:formatDate value="${now}" pattern="mm/dd/yyyy"/>
									a las <fmt:formatDate value="${now}" pattern="HH:mm"/>
									</small>
									</p>
									<button id="delLocal_${i.ID}" class="eliminaLocal"><span class="glyphicon glyphicon-trash"></span>Eliminar</button>
								</div>
							</div>
							</c:forEach>
						</div>	
						
					</div>
        				<!-- Modal Add Local-->
						<div class="modal fade" id="ModalSendAlert" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"> Mandar un aviso</h4>
						      </div>
						      <div class="modal-body">
								<form id="formAddAlert" role="form" method="POST" enctype="multipart/form-data" action="nuevoAviso">
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
									<label for="name">Causa:</label>
									<input type="text" class="form-control" id="causa" required="required" name="causa" placeholder="Introduca la causa de este aviso">
								  </div>								
								  <div class="form-group">
									<label for="name">Mensaje:</label>											
									<textarea style="resize:none" name="message" id="message" cols="60" rows="7" placeholder="Introduzca el aviso" form="formAddAlert" value= ""></textarea>
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
								<form role="form" method="POST" enctype="multipart/form-data" action="editarLocal">
								<input hidden="submit" id="redireccion" name="redireccion" value="administracion" />
								<input hidden="submit" id="id_editLocal" name="id_editLocal" />
								  <div class="form-group">
									<label for="name">Nombre:</label>
									<input type="text" class="form-control" required="required" id="editNameLocal" name="editNameLocal" placeholder="Introduce un nuevo nombre">
								  </div>
								  <div class="form-group">
									<label for="timeBusiness">Horario:</label>
									<input type="text" class="form-control" required="required" id="editHorarioLocal" name="editHorarioLocal" placeholder="Introduce un nuevo horario">
								 	<span class="help-block">Por ejemplo: 10-18</span>
								  </div>
								  <div class="form-group">
									<label for="dir">Dirección:</label>
									<input type="text" class="form-control" required="required" id="editDirLocal" name="editDirLocal" placeholder="Introduce una nueva direccion">
								  </div>
								  <div class="form-group">
									<label for="email">Email:</label>
									<input type="email" class="form-control" required="required" id="editEmailLocal" name="editEmailLocal" placeholder="Introduce un nuevo email">
								  </div>
								  <div class="form-group">
									<label for="tel">Teléfono:</label>
									<input type="tel" class="form-control" required="required" id="editTelLocal" name="editTelLocal" placeholder="Introduce un nuevo telefono">
								  	<span class="help-block">Por ejemplo: 651651651</span>
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
						<input hidden="submit" name="editRedireccionAdmin" id="editRedireccionAdmin" value="administracion" />
						<input hidden="submit" name="editId_usuarioAdmin" id="editId_usuarioAdmin" value="${moderador.ID}" />
								  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" name="editNameUserAdmin" id="editNameUserAdmin" value="${moderador.nombre}">
										</div>
										<div class="form-group">
											<label for="pwd">Contraseña:</label>
											<input type="password" class="form-control" name="editPwdAdmin" id="editPwdAdmin" value="">
										</div>
										<div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" name="editEmailAdmin" id="editEmailAdmin" value="${moderador.email}">
										</div>
										<div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" name="editTelAdmin" id="editTelAdmin" value="${moderador.telefono}">
											<span class="help-block">Por ejemplo: 651651651</span>
										</div>
										<form id="formEditarFotoAdmin" name="formEditarFotoAdmin" role="form" method="POST" enctype="multipart/form-data" action="editarUsuarioFoto">  
											<div class="form-group">
												<input hidden="submit" name="editId_usuarioAdmin" id="editId_usuarioAdmin">
												<label for="file">Imagen de perfil:</label>
												<input type="file" name="editFileToUploadAdmin" accept="image/*" id="editFileToUploadAdmin">											
											</div>
										</form>										  
						  <br></br>
						  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
						  <button id="editarUsuarioAdmin" name="editarUsuarioAdmin" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
					  </div>
				</div>

				</div>

                    </div><!--/.col-md-4-->

                   
                </div><!--/.services-->
            </div><!--/.row--> 


           
        </div><!--/.container-->
    </section><!--/#feature-->
<%@ include file="../fragments/footer.jspf" %>
        
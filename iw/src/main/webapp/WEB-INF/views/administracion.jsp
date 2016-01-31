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

function activaBotonAddLocal(){
	var fileToUpload=$('#fileToUpload')[0].files[0];
	var id_local=$('#id_local').get(0).value;
	var name=$('#name').get(0).value;
	var endTime=$('#endTime').get(0).value;
	var cap=$('#cap').get(0).value;
	var description=$('#description').get(0).value;
	
	$.post( "nuevaOferta",{fileToUpload:fileToUpload,id_local:id_local,name:name,endTime:endTime,
		cap:cap,description:description},function(data){
			$('#TodasOfertas').load('comercio_interno?id='+idLocal+' div#TodasOfertas');
	});
	
}

function rellenaDatosEditarModalLocal(){
	var idLocal = $(this).attr("id").substring("edit_".length);
	var res = idLocal.split("/,");
	$("#editNameLocal").attr("value" ,res[0]);
	$("#editHorarioLocal").attr("value" ,res[1]);
	$("#editDirLocal").attr("value" ,res[2]);
	$("#editEmailLocal").attr("value" ,res[3]);
	$("#editTelLocal").attr("value" ,res[4]);
	$("#id_editLocal").attr("value" ,res[5]);
}
function rellenaDatosEditarModalUsuario(){
	var idUsuario = $(this).attr("id").substring("edit_".length);
	var res = idUsuario.split("/,");
	$("#editNameUser").attr("value" ,res[0]);
	$("#editEmail").attr("value" ,res[1]);
	$("#editTel").attr("value" ,res[2]);
	$("#editId_usuario").attr("value" ,res[3]);
}
function activaBotonRellenaTag() {
	var nombreTagEdit = $(this).attr("id").substring("editTags_".length); 
	var res = nombreTagEdit.split("/");
	$("#nameEditTag").attr("value" ,res[0]);
	$('input[name="id_tag"]').val(res[1]);
}
function activaBotonEditTag() {
	var nombreTagEdit = $("#nameEditTag").attr("value");
	var nombreViejo =$(this).attr("id").substring("editTags_".length); 
	    //Se verifica que el valor del campo este vacio y se eliminan los espacios
	 
	    if (nombreTagEdit.trim() == ''){
	    	$('#TodosTags').load('administracion div#TodosTags');
	    }
		else{
			$.post("editarTag",{nombreTagEdit:nombreTagEdit,nombreViejo:nombreViejo},function(data){
				$('#TodosTags').load('administracion div#TodosTags');
			});	
			
		}
}
$(function() {	
	$("body").on("click", ".eliminaLocal", null, activaBotonEliminacionLocal);	
	$("body").on("click", ".eliminaComentario", null, activaBotonEliminacionComentario);
	$("body").on("click", ".eliminaUsuario", null, activaBotonEliminacionUsuario);
	$("body").on("click", ".anyadirLocal", null, activaBotonAddLocal);
	$("body").on("click", ".rellenaEditTag", null, activaBotonRellenaTag);
	$("body").on("click", ".editaTag", null, activaBotonEditTag);
	$("body").on("click", ".rellenarEditarLocal", null, rellenaDatosEditarModalLocal);
	$("body").on("click", ".rellenarEditarUsuario", null, rellenaDatosEditarModalUsuario);
	$("#editarUsuario").click(function() {

    	var idUsuario = $("#editId_usuario").val();
    	var redireccion = $("#editRedireccion").val();
    	
    	var nombr = $("#editNameUser").val();
    	var contr = $("#editPwd").val();
    	var e_mail = $("#editEmail").val();
    	var telef = $("#editTel").val();
    	var foto = $("#editfileToUpload").val();
    		
    	$.ajax({
    		url : "${prefix}editarUsuario",
    		type : "POST",
    		data : {
    			editId_usuario : idUsuario,
    			editNameUser : nombr,
    			editPwd : contr,
    			editEmail : e_mail,
    			editTel : telef,
    			editRedireccion : redireccion
    		},
    		error : function() {
    			alert("Ups :(");
    		},
    		success : function(data) {
    			
    			alert(resultadoEditar(data));
    			$("#formEditarFoto").submit();
    			
    			location.href = "${prefix}/iw/administracion";
    			

    		}
    	})
    })
    
    $("#editarUsuarioAdmin").click(function() {

    	var idUsuario = $("#editId_usuarioAdmin").val();
    	var redireccion = $("#editRedireccionAdmin").val();
    	
    	var nombr = $("#editNameUserAdmin").val();
    	var contr = $("#editPwdAdmin").val();
    	var e_mail = $("#editEmailAdmin").val();
    	var telef = $("#editTelAdmin").val();
    	var foto = $("#editfileToUploadAdmin").val();
    		
    	$.ajax({
    		url : "${prefix}editarUsuario",
    		type : "POST",
    		data : {
    			editId_usuario : idUsuario,
    			editNameUser : nombr,
    			editPwd : contr,
    			editEmail : e_mail,
    			editTel : telef,
    			editRedireccion : redireccion
    		},
    		error : function() {
    			alert("Ups :(");
    		},
    		success : function(data) {
    			
    			alert(resultadoEditar(data));
    			$("#formEditarFotoAdmin").submit();
    			
    			location.href = "${prefix}/iw/administracion";
    			

    		}
    	})
    })
})

function resultadoEditar(codigo){
	var respuestaPos = "Se han realizado los siguientes cambios correctamente en: ";
	var respuestaNeg = "Los siguientes cambios no se han podido efectuar: ";
	
    if(codigo.charAt(9) === '1' && codigo.charAt(4) == '0'){  //1era columna si ha habido cambios   //2da columna si ha habido error
    	respuestaPos = respuestaPos + "\n" + "- Apodo";
    }
    else if (codigo.charAt(9) === '0' && codigo.charAt(4) == '1'){
    	respuestaNeg = respuestaNeg + "\n" + "- Apodo (apodo no válido)";
    }
    
    if(codigo.charAt(8) === '1' && codigo.charAt(3) == '0'){
    	respuestaPos = respuestaPos + "\n" + "- Contraseña";
    }
    else if(codigo.charAt(8) === '0' && codigo.charAt(3) == '1'){
    	respuestaNeg = respuestaNeg + "\n" + "- Contraseña (longitud errónea)";
    }
    
    if(codigo.charAt(7) === '1' && codigo.charAt(2) == '0'){
    	respuestaPos = respuestaPos + "\n" + "- Email";
    }
    else if(codigo.charAt(7) === '0' && codigo.charAt(2) == '1'){
    	respuestaNeg = respuestaNeg + "\n"  + "- Email (email con formato no válido)";
    }
    
    if(codigo.charAt(6) === '1' && codigo.charAt(1) == '0'){
    	respuestaPos = respuestaPos + "\n" + "- Teléfono";
    }
    else if(codigo.charAt(6) === '0' && codigo.charAt(1) == '1'){
    	respuestaNeg = respuestaNeg + "\n" + "- Teléfono (teléfono con formato no válido)";
    }
    
    if(codigo === "1000000000"){
    	return "No ha habido cambios";
    }
    else{
    	if(respuestaPos == "Se han realizado los siguientes cambios correctamente en: " && respuestaNeg != "Los siguientes cambios no se han podido efectuar: ")
    		return respuestaNeg;
    	else if(respuestaNeg == "Los siguientes cambios no se han podido efectuar: " && respuestaPos != "Se han realizado los siguientes cambios correctamente en: ")
    		return respuestaPos;
    	else
    		return respuestaPos + "\n" + "\n" + respuestaNeg;
    }
   
}

$("body").on( "keyup", "#editNameUser", null, function(){
	var campo = $("#editNameUser");
	var nombr = $("#editNameUser").val();
	
	$.ajax({
		url : "${prefix}disponibilidadApodo",
		type : "POST",
		data : {
			apodo : nombr
		},
		error : function() {
			alert("Ups :(");
		},
		success : function(data) {
			if(data === "libre"){
				campo.css("border-color", "green");
			}
			else if(data === "ocupado"){
				campo.css("border-color", "red");
			}
	
		}
	})
} )

$("body").on( "keyup", "#editNameUserAdmin", null, function(){
	var campo = $("#editNameUserAdmin");
	var nombr = $("#editNameUserAdmin").val();
	
	$.ajax({
		url : "${prefix}disponibilidadApodo",
		type : "POST",
		data : {
			apodo : nombr
		},
		error : function() {
			alert("Ups :(");
		},
		success : function(data) {
			if(data === "libre"){
				campo.css("border-color", "green");
			}
			else if(data === "ocupado"){
				campo.css("border-color", "red");
			}
	
		}
	})
} )
</script>

<section id="feature" class="transparent-bg">
        <div class="container">
           <div class="center">
                <h2>Administración</h2>                
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-5 col-sm-5">
						<input hidden="submit" id="id_admin" value="${admin.ID}" />
						<img src="usuariosFoto?id=${admin.ID}.jpg" height="175" width="250">  
						<h3><b>Bienvenido Administrador ${admin.nombre}</b></h3>
						<p>Esta es una página de administración. </br> Aqui podrá hacer todas las gestiones </br> de usuarios y locales, además de editar </br> sus datos personales</p><br/>
						<h3><b>Mis datos</b></h3>
						<p>Telefono: ${admin.telefono}</p>
						<p>Email: ${admin.email}</p>
                    </div><!--/.col-md-4-->

                    <div class="col-md-7 col-sm-7">
					<ul class="nav nav-tabs">
					  <li><a href="#lusuarios" data-toggle="tab">Gestionar usuarios</a></li>
					  <li><a href="#llocales" data-toggle="tab">Gestionar locales</a></li>
					  <li><a href="#editarDatos" data-toggle="tab">Mis datos</a></li>
					  <li><a href="#ltags" data-toggle="tab">Mis tags</a></li>
					</ul>

					<div class="tab-content">
						
						 <div class="tab-pane fade in active" id="lusuarios">
						  <div class="media">
						  	<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddUser"><span class="glyphicon glyphicon-plus"></span> Añadir nuevo usuario</button>
						  	<br></br>
						  </div>
						  <div id="TodosUsuarios" class="TodosUsuarios" varStatus="status">
							  <c:forEach items="${usuarios}" var="i">
								<div class="media">
									<div class="pull-left">
										<img class="media-object" src="usuariosFoto?id=${i.ID}.jpg" height="140" width="140"> 
									</div>
									<div class="media-body">
										<h4 class="media-heading">${i.nombre} (${i.rol})</h4>
										<p>E-mail: ${i.email}</p>
										<p>Teléfono: ${i.telefono}</p>																		
										<button type="submit" id="edit_${i.nombre}/,${i.email}/,${i.telefono}/,${i.ID}" value="${i}" class="rellenarEditarUsuario" data-toggle="modal" data-target="#ModalEditUser" ><span class="glyphicon glyphicon-pencil"></span> Editar</button>
										<button id="delUsuario_${i.ID}" class="eliminaUsuario"><span class="glyphicon glyphicon-trash"></span>Eliminar</button>
									</div>
								</div>
								</c:forEach>
							</div>
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
								<form role="form" method="POST" enctype="multipart/form-data" action="nuevoUsuario">
								  <div class="form-group">
									<label for="name">Nombre:</label>
									<input type="text" class="form-control" required="required" id="name" name="name" placeholder="Introduce un nuevo nombre">
								  </div>
								  <div class="form-group">
									<label for="pwd">Contraseña:</label>
									<input type="password" class="form-control" required="required" id="pwd" name="pwd" placeholder="Introduce una nueva contraseña">
								  </div>
								  <div class="form-group">
									<label for="email">Email:</label>
									<input type="email" class="form-control" id="email" required="required" name="email" placeholder="Introduce un nuevo email">
								  </div>
								  <div class="form-group">
									<label for="tel">Teléfono:</label>
									<input type="tel" class="form-control" id="tel" required="required" name="tel" placeholder="Introduce un nuevo telefono">
								  </div>
								  <div class="form-group">
									<label for="rol">Rol:</label>
									 <select class="form-control" id="rol" name="rol">
									  <option value="user">Usuario</option>
									  <option value="local">Usuario con comercio</option>
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
					   
					   <!-- Modal Edit User-->
						<div class="modal fade" id="ModalEditUser" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"> Añadir un nuevo usuario</h4>
						      </div>
						      <div class="modal-body">
								<input hidden="submit" name="editRedireccion" id="editRedireccion" value="administracion" />
								<input hidden="submit" name="editId_usuario" id="editId_usuario" />
								  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" name="editNameUser" id="editNameUser">
										</div>
										<div class="form-group">
											<label for="pwd">Contraseña:</label>
											<input type="password" class="form-control" name="editPwd" id="editPwd" value="">
										</div>
										<div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" name="editEmail" id="editEmail">
										</div>
										<div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" name="editTel" id="editTel">
										</div>
										<form id="formEditarFoto" name="formEditarFoto" role="form" method="POST" enctype="multipart/form-data" action="editarUsuarioFoto">  
											<div class="form-group">
												<input hidden="submit" name="editId_usuario" id="editId_usuario">
												<label for="file">Imagen de perfil:</label>
												<input type="file" name="editFileToUpload" accept="image/*" id="editFileToUpload">											
											</div>
										</form>
								  <div class="modal-footer">						      	 
									  <button id="editarUsuario" name="editarUsuario" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
									  <button type="submit" class="btn" data-dismiss="modal">Cancel</button>
							      </div>									  						  								
						      </div>

						    </div>
						  </div>
						</div>     
					    <!-- End Modal Edit User-->
					  
					  <div class="tab-pane fade" id="llocales">
					  	<div class="media">
					  		<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddLocal"><span class="glyphicon glyphicon-plus"></span> Añadir nuevo local</button>
					  		<br></br>
					  	</div>
					  	<div id="TodosLocales" class="TodosLocales">
					  	<c:forEach items="${locales}" var="i">
							<div class="media">
								<div class="pull-left">
									<img src="localesFoto?id=${i.ID}.jpg" height="175" width="250"> 
								</div>
								<div class="media-body">
									<h4 class="media-heading">${i.nombre}</h4>
									<p>Usuario: ${i.usuario.nombre}</p>																
									<p>Puntuación: ${i.puntuacion}</p>									
									<button type="submit" id="edit_${i.nombre}/,${i.horario}/,${i.direccion}/,${i.email}/,${i.telefono}/,${i.ID}" value="${i}" class="rellenarEditarLocal" data-toggle="modal" data-target="#ModalEditLocal" ><span class="glyphicon glyphicon-pencil"></span> Editar</button>
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
									<input type="text" class="form-control" id="name" required="required" name="name" placeholder="Introduce un nuevo nombre">
								  </div>
								  <div class="form-group">
									<label for="timeBusiness">Horario:</label>
									<input type="text" class="form-control" required="required" id="timeBusiness" name="timeBusiness" placeholder="Introduce un nuevo horario">
								  </div>
								  <div class="form-group">
									<label for="dir">Dirección:</label>
									<input type="text" class="form-control" required="required" id="dir" name="dir" placeholder="Introduce una nueva direccion">
								  </div>
								  <div class="form-group">
									<label for="email">Email:</label>
									<input type="email" class="form-control" required="required" id="email" name="email" placeholder="Introduce un nuevo email">
								  </div>
								  <div class="form-group">
									<label for="tel">Teléfono:</label>
									<input type="tel" class="form-control" required="required" id="tel" name="tel" placeholder="Introduce un nuevo telefono" maxlength="9">
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
        			<!-- tags -->
     				<div class="tab-pane fade" id="ltags"> 							
						<h4>Editar tags disponibles:</h4><br>					
						<div id="TodosTags" class="TodosTags">	
							<c:forEach items="${alltags}" var="i">
								<h4>${i.texto}</h4> 					               				
					         	<button id="editTags_${i.texto}/${i.ID}" value="${i.texto}" class="rellenaEditTag" data-toggle="modal" data-target="#ModalEditTags" >
					         	<span class="glyphicon glyphicon-pencil"></span> Editar</button>	
					         	<HR width=50% align="left">				               				
				            </c:forEach>	
						</div>
					</div>
        			<!--  end tags -->		 
					  <div class="tab-pane fade" id="editarDatos">
						<input hidden="submit" name="editRedireccionAdmin" id="editRedireccionAdmin" value="administracion" />
						<input hidden="submit" name="editId_usuarioAdmin" id="editId_usuarioAdmin" value="${admin.ID}" />
								  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" name="editNameUserAdmin" id="editNameUserAdmin" value="${admin.nombre}">
										</div>
										<div class="form-group">
											<label for="pwd">Contraseña:</label>
											<input type="password" class="form-control" name="editPwdAdmin" id="editPwdAdmin" value="">
										</div>
										<div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" name="editEmailAdmin" id="editEmailAdmin" value="${admin.email}">
										</div>
										<div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" name="editTelAdmin" id="editTelAdmin" value="${admin.telefono}">
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
					  <!-- Modal Edit Tags-->
						<div class="modal fade" id="ModalEditTags" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-sm" role="document">
						    <div class="modal-content">
										    
						    		<div class="modal-header">
						    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        	<h4 class="modal-title" id="editModalLabel"> Editar tag</h4>

									</div>
									<div class="modal-body">									
										<form role="form" method="POST" enctype="multipart/form-data" action="editarTag">										
										<div class="form-group">
											<label for="name">Tag:</label>											
											<input type="text" class="form-control" required="required" value="" id="nameEditTag" name="nameEditTag">
										 	<input hidden="submit" id="id_tag" name="id_tag" value="" />
										  </div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span>Aceptar</button>
												<button type="submit" class="btn" data-dismiss="modal">Cancel</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					<!-- End Modal Edit Tags-->
					</div>

				</div>

                    </div><!--/.col-md-4-->

                   
                </div><!--/.services-->
            </div><!--/.row--> 


           
        </div><!--/.container-->
    </section><!--/#feature-->
    <%@ include file="../fragments/footer.jspf" %>

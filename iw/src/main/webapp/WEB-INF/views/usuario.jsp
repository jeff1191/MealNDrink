<%@ include file="../fragments/header.jspf" %>
<script type="text/javascript">

function activaBotonEliminacionLocal() {	
	var idLocal = $(this).attr("id").substring("del_".length); 
	var idUsuario=$('#id_usuario').get(0).value;
	$.post( "eliminarLocal",{idLocal:idLocal},function(data){
			$('#TodosLocales').load('usuario?id='+idUsuario+' div#TodosLocales');
			$('#localesUsuarioDesplegable').load('usuario?id='+idUsuario+' div#localesUsuarioDesplegable');		
	});
}

function activaBotonEliminacionReserva() {	
	var idReserva = $(this).attr("id").substring("delR_".length); 
	var idUsuario=$('#id_usuario').get(0).value;
	$.post( "eliminarReserva",{idReserva:idReserva},function(data){
			$('#TodasReservas').load('usuario?id='+idUsuario+' div#TodasReservas');
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
	$("body").on("click", ".eliminaReserva", null, activaBotonEliminacionReserva);
	$("body").on("click", ".eliminaComentario", null, activaBotonEliminacionComentario);	
    $('.qrcode').each(function(i, o) {
        $(o).qrcode({
            "render": "div",
            "size": 100,
            "color": "#3a3",
            "text": $(o).text()
        })
    });
   
    
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
    			
    			location.href = "${prefix}/iw/usuario?id=${usuario.ID}";
    			

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

</script>
<section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>${usuario.nombre}</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">
                        	<div class="imagenMediaPerfil">
                           		 <img src="usuariosFoto?id=${usuario.ID}.jpg">  
                            </div>                            
							<input hidden="submit" id="id_usuario" value="${usuario.ID}" /> 
							<h3><b>Mis datos</b></h3>
							<p>Mi email: ${usuario.email}</p>
							<p>Mi telefono: ${usuario.telefono}</p>											
						</div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6">
                       
							<ul class="nav nav-tabs">
								<li class="active"><a href="#reservas" data-toggle="tab">Mis reservas</a></li>
								<c:choose>
									<c:when test="${usuario.rol != 'user'}">
										<li><a href="#locales" data-toggle="tab">Mis locales</a></li>
									</c:when>
								</c:choose>
								<li><a href="#opiniones" data-toggle="tab">Mis opiniones</a></li>
								<li><a href="#editar" data-toggle="tab">Mis datos</a></li>
							</ul>						
									
							<div class="tab-content">
								<div class="tab-pane fade in active" id="reservas">
									<div id="TodasReservas" class="TodasReservas">
											<c:choose>
											<c:when test="${empty usuario.reservas}">	
												<p><b>Aun no has hecho ninguna reserva</b></p>
											</c:when>
											<c:otherwise>
												<c:forEach items="${usuario.reservas}" var="i">
												<div class="media">
													<div class="pull-left">
														<div class="imagenMedia">
															<img class="media-object" src="ofertasFoto?id=${i.oferta.ID}.jpg">
														</div>
													</div>										
													<div class="media-body">														
														<h4 class="media-heading">${i.oferta.nombre}</h4>					
														<div class="qrcode">${i.codigoQr}</div><br>		
														<button id="delR_${i.ID}" class="eliminaReserva"><span class="glyphicon glyphicon-trash"></span>  Eliminar</button>																
												</div>
												</div>	
												<HR width=100% align="left">		
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
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
									<input type="text" class="form-control" id="timeBusiness" name="timeBusiness" placeholder="Introduce un nuevo horario">
								 	<span class="help-block">Por ejemplo: 10-18</span>
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
								<c:choose>
								<c:when test="${empty usuario.locales}">	
									<p><b>Aun no tienes ningun local</b></p>
								</c:when>
								<c:otherwise>
									<c:forEach items="${usuario.locales}" var="i">
									<div class="media">
										<div class="pull-left">
											<div class="imagenMedia">
												<img class="media-object" WIDTH=178 HEIGHT=150 src="localesFoto?id=${i.ID}.jpg" >
											</div>
										</div>										
										<div class="media-body">
											<h4 class="media-heading">${i.nombre}</h4>
											<p>Dirección:${i.direccion }</p>
											<p>Horario: ${i.horario }</p>								
											<p>Puntuación: ${i.puntuacion }</p>											
											<button id="del_${i.ID}" class="eliminaLocal"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
										</div>
									</div>	
									</c:forEach>
								</c:otherwise>
								</c:choose>
								</div>
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
									<label for="file">Imagen de perfil:</label>
									<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
								  </div>
								  <div class="modal-footer">						      	
									  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
									  <button type="submit" class="btn" data-dismiss="modal">Cancelar</button>
							      </div>	
							      </form>											
						      </div>
							      
						      
						    </div>
						  </div>
						</div>     
						<!-- End Modal Edit Local-->								
									
												
								<div class="tab-pane fade" id="opiniones">
									<div id="TodosComentarios" class="TodosComentarios">	
									<c:choose>
									<c:when test="${empty usuario.comentarios}">	
										<p><b>Aun no has hecho ningun comentario</b></p>
									</c:when>
									<c:otherwise>
										<c:forEach items="${usuario.comentarios}" var="i">
											<div class="media">
											<div class="pull-left">
												<img class="media-object" WIDTH=178 HEIGHT=150 src="localesFoto?id=${i.local.ID}.jpg" >
											</div>
											<div class="media-body">
												<br>
												<h4 class="media-heading">${i.local.nombre} </h4>
												<p>${i.texto} </br> <small>Comentario realizado el ${i.fecha}</small></p>
												<button id="delC_${i.ID}" class="eliminaComentario"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
											</div>
											</div>
										</c:forEach>
									</c:otherwise>
									</c:choose>					

									</div>
								</div>
								
								<div class="tab-pane fade" id="editar">
									
										<input hidden="submit" name="editId_usuario" id="editId_usuario" value="${usuario.ID}" />
										<input hidden="submit" name="editRedireccion" id="editRedireccion" value="usuario" />
										<div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" name="editNameUser" id="editNameUser" value="${usuario.nombre }">
										</div>
										<div class="form-group">
											<label for="pwd">Contraseña:</label>
											<input type="password" class="form-control" name="editPwd" id="editPwd"  value="*****">
										</div>
										<div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" name="editEmail" id="editEmail" value="${usuario.email }">
										</div>
										<div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" name="editTel" id="editTel" value="${usuario.telefono }">
											<span class="help-block">Por ejemplo: 651651651</span>
										</div>
										  
										  
										<form id="formEditarFoto" name="formEditarFoto" role="form" method="POST" enctype="multipart/form-data" action="editarUsuarioFoto">
											  
											<div class="form-group">
												<input hidden="submit" name="editId_usuario" id="editId_usuario" value="${usuario.ID}">
												<label for="file">Imagen de perfil:</label>
												<input type="file" name="editFileToUpload" accept="image/*" id="editFileToUpload">											
											</div>
										</form>  										  
										<br>
										 <button id="editarUsuario" name="editarUsuario" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
																				
																	
								</div>
							</div><!--tab content-->
							
						
					</div><!--/.services-->
            </div><!--/.row--> 
            </div>
        </section>
<%@ include file="../fragments/footer.jspf" %>
        
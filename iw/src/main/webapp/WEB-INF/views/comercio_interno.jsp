<%@ include file="../fragments/header.jspf" %>
<script type="text/javascript">

function activaBotonEliminacionOferta() {
	//var idOffer = $(this).attr("id").substring("del_".length); 
	var idOffer=$("#idEliminar").attr("value");
	var idLocal=$('#id_local').get(0).value;
	$.post( "eliminarOferta",{idOferta:idOffer},function(data){ 
			$('#TodasOfertas').load('comercio_interno?id='+idLocal+' div#TodasOfertas');
	});
}

function activaBotonAddOferta() {
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
function activaBotonEditarOferta() {
	var idOffer = $(this).attr("id").substring("edit_".length);
	var datos2;
	var datosO= datosOferta(idOffer, datos2);
	//var datosO={nombre: "Copas a 4", id: 1}
	alert(ojeto.nombre);
	
	//$('#Editname').val(datosO.nombre);
	
}
function datosOferta(id, callback) {
	return $.getJSON("detallesOferta?id=" + id, function(data) { 	
		//var datos2 = data;
	//	alert(data.nombre)
		callback(data); 		
	});
}
function rellenaDatosOferta() {
	var idOffer = $(this).attr("id").substring("del_".length); 
	$("#idEliminar").attr("value" ,idOffer);
}
function rellenaDatosTags() {
	var nombreTag = $(this).attr("id").substring("delTags_".length); 
	$("#idEliminarTags").attr("value" ,nombreTag);
}

function activaBotonEliminacionTag() {
	var nombreTag=$("#idEliminarTags").attr("value");
	var idLocal=$('#id_local').get(0).value;

	$.post( "eliminarTag",{idLocal:idLocal,nombreTag:nombreTag},function(data){ 
			$('#TodosTags').load('comercio_interno?id='+idLocal+' div#TodosTags');
	});
}
function rellenaDatosComentario() {
	var nombreC = $(this).attr("id").substring("delComment_".length); 
	$("#idEliminarComentario").attr("value" ,nombreC);

}
function activaBotonEliminacionComentario() {
	var idComentario=$("#idEliminarComentario").attr("value");
	var idLocal=$('#id_local').get(0).value;

	$.post( "eliminarComentario",{idComentario:idComentario},function(data){ 
			$('#TodosComentarios').load('comercio_interno?id='+idLocal+' div#TodosComentarios');
	});
}
$(function() {
	$("body").on("click", ".eliminaOferta", null, activaBotonEliminacionOferta);	
	$("body").on("click", ".anyadirOferta", null, activaBotonAddOferta);
	$("body").on("click", ".editarOferta", null, activaBotonEditarOferta);
	$("body").on("click", ".rellenaDatos", null, rellenaDatosOferta);
	$("body").on("click", ".rellenaDatosTags", null, rellenaDatosTags);
	$("body").on("click", ".eliminaTag", null, activaBotonEliminacionTag);
	$("body").on("click", ".rellenaDatosComentario", null, rellenaDatosComentario);
	$("body").on("click", ".eliminaComentario", null, activaBotonEliminacionComentario);
})
</script>
      
      
         <section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                    <h2>${local.nombre}</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">							
                            <img src="localesFoto?id=${local.foto}" height="350" width="300">
                            <input hidden="submit" id="id_local" value="${local.ID}" />   
							<h3>Dirección</h3>
							<p>${local.direccion}</p>
														
							<h3>Horario</h3>
							<p>${local.horario}</p>
														
							<h3>Contacto</h3>
							<p>${(local.usuario).email}</p>
							<p>${(local.usuario).telefono}</p>

                        	<h3>Tags</h3>
							<p>${local.tags}</p>

                            <div>
								<h3>Puntuación</h3>
								<h2>${local.puntuacion}</h2>
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
									  <div id="TodasOfertas" class="TodasOfertas">
											<c:forEach items="${local.ofertas}" var="i">
												<div class="media">
													<div class="pull-left">
														<img class="media-object" height="135" width="180" src="ofertasFoto?id=${i.foto}">
												</div>
												<div class="media-body">
													<h4 class="media-heading">${i.nombre}</h4>
												<p>${i.descripcion}</p>											
													<button type="submit" id="edit_${i.ID}" value="${i}" class="editarOferta" data-toggle="modal" data-target="#ModalEditOffer" ><span class="glyphicon glyphicon-pencil"></span> Editar</button>
													<button id="del_${i.ID}" value="${i}"  class="rellenaDatos" data-toggle="modal" data-target="#ModalDelOffer" ><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
												
												</div>
												</div>
											</c:forEach>	
											<br></br>
											<button type="submit" class="btn btn-default">Anterior</button>
											<button type="submit" class="btn btn-default">Siguiente</button>						
										</div>
									<br></br>
									
								</div>
								
								<!-- Modal Add Offer-->
								<div class="modal fade" id="ModalAddOffer" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="addModalLabel"> Añadir una nueva oferta</h4>
								      </div>
								      <div class="modal-body">
										<form id="formAddOferta" role="form" method="POST" enctype="multipart/form-data" action="nuevaOferta">
										<input hidden="submit" name="id_local" value="${local.ID}" />
										  <div class="form-group">
											<label for="name">Nombre de la oferta:</label>
											<input type="text" class="form-control" name="name" id="name" placeholder="Introduzca el nuevo nombre">
										  </div>
										<div class="form-group" name="tag" id="tag ">
										<label for="endTime">Tag:</label>
										<select class="form-control" name="nombreTag" id="nombreTag">
				               				<c:forEach items="${alltags}" var="i">					               				
				               					<option value="${i}"> ${i} </option>					               				
				               				</c:forEach>					               				
					               		</select>
					               		 </div>
										  <div class="form-group">
											<label for="endTime">Fecha límite:</label>
											<input type="time" class="form-control"  name="endTime" id="endTime" placeholder="Introduzca el dia límite">
										  </div>
										  <div class="form-group">
											<label for="cap">Capacidad total:</label>
											<input type="number" class="form-control" name="cap" id="cap" placeholder="Introduzca el numero máximo de beneficiarios">
										  </div>
										  <div class="form-group">
											<label for="descriptcion">Descripción:</label>
											<input type="text" class="form-control" name="description" id="description" placeholder="Introduzca la descripción de la oferta">
										  </div>
										  <div class="form-group">
											<label for="file">Imagen de la oferta:</label>
											<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
										  </div>
											<div class="modal-footer">						      	 
											  	<button type="submit" ><span class="glyphicon glyphicon-send"></span> Enviar</button>
												<button type="submit" class="btn" data-dismiss="modal">Cancel</button>
									     	</div>
										  	
										</form>							
								      </div>

								    </div>
								  </div>
								</div>     
								<!-- End Modal Add Offer-->
								
								<!-- Modal Edit Offer-->
								<div class="modal fade" id="ModalEditOffer" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="editModalLabel"> Editar oferta</h4>
								      </div>
								      <div class="modal-body">
										<form role="form" method="POST" enctype="multipart/form-data" action="editarOferta">
										<input hidden="submit" name="id_local" value="${local.ID}" />
										  <div class="form-group">
											<label for="name">Nombre de la oferta:</label>
											<input type="text" class="form-control" name="Editname" id="Editname" placeholder="Introduzca el nombre">
										  </div>
										  <div class="form-group">
											<label for="endTime">Fecha límite:</label>
											<input type="time" class="form-control"  name="EditendTime" id="EditendTime" placeholder="Introduzca el dia límite">
										  </div>
										  <div class="form-group">
											<label for="cap">Capacidad total:</label>
											<input type="number" class="form-control" name="Editcap" id="Editcap" placeholder="Introduzca el numero máximo de beneficiarios">
										  </div>
										  <div class="form-group">
											<label for="descriptcion">Descripción:</label>
											<input type="text" class="form-control" name="Editdescription" id="Editdescription" placeholder="Introduzca la descripción de la oferta">
										  </div>
										  <div class="form-group">
											<label for="file">Imagen de la oferta:</label>
											<input type="file" name="EditfileToUpload" accept="image/*" id="EditfileToUpload">											
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
								<!-- End Modal edit Offer-->
								
								<!-- Modal Del Offer-->
								<div class="modal fade" id="ModalDelOffer" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
												    
								    		<div class="modal-header">
								    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        	<h4 class="modal-title" id="delModalLabel"> Eliminar una nueva oferta</h4>

											</div>
											<div class="modal-body">
											
											<p>¿Está seguro que quiere eliminar esta oferta?</p>
												<div class="modal-footer">
													<button id="idEliminar" type="submit" class="eliminaOferta" data-dismiss="modal" ><span class="glyphicon glyphicon-send"></span>Aceptar</button>
													<button type="submit" data-dismiss="modal">Cancel</button>
												</div>
		
											</div>
										</div>
									</div>
								</div>
								<!-- End Modal Del Offer-->
								
														
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
									<div id="TodosComentarios" class="TodosComentarios">
										<c:forEach items="${local.comentarios}" var="i">
										<div class="pull-left">
											<img class="media-object" src="localesFoto?id=${i.local.foto}" height="135" width="180"> 
										</div>
										
										<div class="media-body">											
											<h4 class="media-heading">Comentario #1</h4>
											<p>${i.texto}</p>
											<button id="delComment_${i.ID}" value="${i.ID}"  class="rellenaDatosComentario" data-toggle="modal" data-target="#ModalDelComentario" ><span class="glyphicon glyphicon-trash"></span> Eliminar</button>	
										</div>
									</c:forEach>
									</div>
									</div>
									
									<br></br>
									<button type="submit" class="btn btn-default">Anterior</button>
									<button type="submit" class="btn btn-default">Siguiente</button>
									
								</div>
								
								<div class="tab-pane fade" id="editar"><!--form to edit restaurant profile data-->
									<form role="form" method="POST" enctype="multipart/form-data" action="editarLocal">
									<input hidden="submit" name="id_local" value="${local.ID}" />
									<input hidden="submit" name="redireccion" value="comercio_interno" />
										  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" id="name"  name="name" value="${local.nombre}">
										  </div>
										   <div class="form-group">
											<label for="timeBusiness">Horario:</label>
											<input type="time" class="form-control" id="horario"  name="horario" value="${local.horario}">
										  </div>
										   <div class="form-group">
											<label for="dir">Dirección:</label>
											<input type="text" class="form-control" id="dir"  name="dir" value="${local.direccion}">
										  </div>
										  <div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" id="email"  name="email" value="${local.email}">
										  </div>
										  <div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" id="tel"  name="tel" value="${local.telefono}">
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
									<div id="TodosTags" class="TodosTags">	
										<c:forEach items="${alltagsLocal}" var="i">
											<h4>${i}</h4> 					               				
								         	<button id="delTags_${i}" value="${i}"  class="rellenaDatosTags" data-toggle="modal" data-target="#ModalDelTags" ><span class="glyphicon glyphicon-trash"></span> Eliminar</button>					               				
							            </c:forEach>	
									</div>
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
									 <label for="tag">Tags disponibles:</label>
										<select class="form-control" id="tag">
				               				<c:forEach items="${alltags}" var="i">					               				
				               					<option> ${i} </option>					               				
				               				</c:forEach>					               				
					               		</select>
									  </div>
									  								  
									</form>					
								      </div>
								      <div class="modal-footer">						      	 
										  <button type="submit" class="btn" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
										  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-send"></span> Enviar</button>
								      </div>
								    </div>
								  </div>
								</div>     
								<!-- End Modal Add Tag-->
								
								<!-- Modal Del Tags-->
								<div class="modal fade" id="ModalDelTags" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
												    
								    		<div class="modal-header">
								    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        	<h4 class="modal-title" id="delModalLabel"> Eliminar tag</h4>

											</div>
											<div class="modal-body">
											
											<p>¿Está seguro que quiere eliminar este tag?</p>
												<div class="modal-footer">
													<button id="idEliminarTags" value ="" type="submit" class="eliminaTag" data-dismiss="modal" ><span class="glyphicon glyphicon-send"></span>Aceptar</button>
													<button type="submit" data-dismiss="modal">Cancel</button>
												</div>
		
											</div>
										</div>
									</div>
								</div>
								<!-- End Modal Del Tags-->
								
								<!-- Modal Del Comentario-->
								<div class="modal fade" id="ModalDelComentario" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
												    
								    		<div class="modal-header">
								    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        	<h4 class="modal-title" id="delModalLabel"> Eliminar comentario</h4>

											</div>
											<div class="modal-body">
											
											<p>¿Está seguro que quiere eliminar este comentario?</p>
												<div class="modal-footer">
													<button id="idEliminarComentario" value ="" type="submit" class="eliminaComentario" data-dismiss="modal" ><span class="glyphicon glyphicon-send"></span>Aceptar</button>
													<button type="submit" data-dismiss="modal">Cancel</button>
												</div>
		
											</div>
										</div>
									</div>
								</div>
								<!-- End Modal Del Comentario-->														
							</div><!--tab content-->
                     
                    </div><!--/.col-md-4-->
                </div><!--/.row-->
            </div><!--container--> 
        </section>
<%@ include file="../fragments/footer.jspf" %>

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
function rellenarModalEditarOferta() {
	var idOffer = $(this).attr("id").substring("edit_".length);
	var res = idOffer.split("/,");
	$("#editName").attr("value" ,res[0]);
	var fecha = res[1]; 
	var posFe=fecha.split(" ");//quitamos la hora del timestamp
	$("#editFecha" ).datepicker();
	$("#editFecha").attr("value" ,posFe[0].replace(/-/gi,"/"));
	$("#editCap").attr("value" ,res[2]);
	$("#editDescription").attr("value" ,res[3]);
	$("#id_Editoffer").attr("value" ,res[4]);	
}
function rellenaDatosEliminarOferta() {
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

function activaBotonValidarReserva(ob) {
	
	var nombre = ob;
	var ok= false;
	
	$.ajax({
		url : "${prefix}validarReserva",
		type : "POST",
		data : {
			//id_reserva : nombre
		},

		success : function(data) {
			
			if(data === "ok"){
				//$(‘#contenido’).fadeOut(1000);
			//	var r = $("#r"+nombre);
			//	r.remove();
			//	$("#tabla2 tbody").append(r);
				//$(‘#contenido’).fadeIn(1000);
			//	ok = true;
			
				$("#tabla1").load('comercio_interno?id=${local.ID} div#tabla1');
				$("#tabla2").load('comercio_interno?id=${local.ID} div#tabla2');
			
				
				$(window).load(function(){
					$('.qrcode').each(function(i, o) {
			   	        $(o).qrcode({
			   	            "render": "div",
			   	            "size": 100,
			   	            "color": "#3a3",
			   	            "text": $(o).text()
		   	     	    })
		  	 		});
				});
				
			} else if(data === "reserva_no_existe"){
				location.href = "${prefix}/mealndrink";
			} else if(data === "usuario_no_permitido"){
				location.href = "${prefix}/mealndrink";
			}
		}
	})
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
function activaBotonAddTag() {
	var idLocal=$('#id_local').get(0).value;
	var nombreTag=$('#nuevoTag').get(0).value;
	
	$.post( "addNuevoTag",{idLocal:idLocal,nombreTag:nombreTag},function(data){
			$('#TodosTags').load('comercio_interno?id='+idLocal+' div#TodosTags');
	});
}

$(function() {
	$("body").on("click", ".eliminaOferta", null, activaBotonEliminacionOferta);	
	$("body").on("click", ".anyadirOferta", null, activaBotonAddOferta);
	$("body").on("click", ".rellenarEditarOferta", null, rellenarModalEditarOferta);
	$("body").on("click", ".rellenaDatosEliminarOferta", null, rellenaDatosEliminarOferta);
	$("body").on("click", ".rellenaDatosTags", null, rellenaDatosTags);
	$("body").on("click", ".eliminaTag", null, activaBotonEliminacionTag);
	$("body").on("click", ".rellenaDatosComentario", null, rellenaDatosComentario);
	$("body").on("click", ".eliminaComentario", null, activaBotonEliminacionComentario);
	$("body").on("click", ".anyadirTag", null, activaBotonAddTag);
	$('.qrcode').each(function(i, o) {
        $(o).qrcode({
            "render": "div",
            "size": 100,
            "color": "#3a3",
            "text": $(o).text()
        })
    });
	$('.QRvalidar').each(function(i, o) {
		//$("body").on("click", "#" + o.id , null, activaBotonValidarReserva(o.id));
        $("#" + o.id).click( function(){
			activaBotonValidarReserva(o.id);
			/*$('.qrcode').each(function(i, o) {
   	       		$(o).qrcode({
	   	            "render": "div",
	   	            "size": 100,
	   	            "color": "#3a3",
	   	            "text": $(o).text()
   	         	})
  	 		});*/
     	});
    
	});
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
                            <img src="localesFoto?id=${local.ID}.jpg" height="350" width="300">
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
														<img class="media-object" height="135" width="180" src="ofertasFoto?id=${i.ID}.jpg">
												</div>
												<div class="media-body">
													<h4 class="media-heading">${i.nombre}</h4>
													<p>${i.descripcion}</p>	
													<p>Número de personas: ${i.capacidadActual}/${i.capacidadTotal}</p>	
													<p>${i.fechaLimite}</p>												
													<button type="submit" id="edit_${i.nombre}/,${i.fechaLimite}/,${i.capacidadTotal}/,${i.descripcion}/,${i.ID}" value="${i}" class="rellenarEditarOferta" data-toggle="modal" data-target="#ModalEditOffer" ><span class="glyphicon glyphicon-pencil"></span> Editar</button>
													<button id="del_${i.ID}" value="${i}"  class="rellenaDatosEliminarOferta" data-toggle="modal" data-target="#ModalDelOffer" ><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
												
												</div>
												</div>
											</c:forEach>																		
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
											<input type="text" class="form-control" name="name" required="required" id="name" placeholder="Introduzca el nuevo nombre">
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
									     	<label for="datepicker2"> Fecha: </label>									     
												<input id=datepicker class="form-control" type="text" id="fecha" name="fecha" placeholder="Selecciona una fecha" value="" />	
											</div>	
										  <div class="form-group">
											<label for="cap">Capacidad total:</label>
											<input type="number" class="form-control" name="cap" id="cap" required="required" placeholder="Introduzca el numero máximo de beneficiarios">
										  </div>
										  <div class="form-group">
											<label for="descriptcion">Descripción:</label>
											<input type="text" class="form-control" name="description" required="required" id="description" placeholder="Introduzca la descripción de la oferta">
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
										<input hidden="submit" id="id_local" name="id_local" value="${local.ID}" />
										<input hidden="submit" id="id_Editoffer" name="id_Editoffer" />
										  <div class="form-group">
											<label for="name">Nombre de la oferta:</label>
											<input type="text" class="form-control" value="" name="editName" id="editName" placeholder="Introduzca el nombre" >
										  </div>
										  <div class="form-group">
											<label for="endTime">Fecha límite:</label>
											<input class="form-control" type="text" id="editFecha" name="editFecha" placeholder="Selecciona una fecha" />	
										  </div>
										  <div class="form-group">
											<label for="cap">Capacidad total:</label>
											<input type="number" class="form-control" name="editCap" id="editCap" placeholder="Introduzca el numero máximo de beneficiarios">
										  </div>
										  <div class="form-group">
											<label for="descriptcion">Descripción:</label>
											<input type="text" class="form-control" name="editDescription" id="editDescription" placeholder="Introduzca la descripción de la oferta">
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
									  	<div class="tabla1" id="tabla1">
											<table class="table table-bordered">
											    <thead>
											        <tr>
											        	<th>Oferta</th>
											            <th>QR</th>
											        </tr>
											    </thead>
											    <tbody>
											    	<c:forEach items="${local.ofertas}" var="i">
											    	 	<c:forEach items="${i.reservas}" var="j">
												    		<c:if test="${j.validado == false}">
													    		<tr id="r${j.ID}">
														            <td><h4 class="media-heading">${i.nombre}</h4>
	<%-- 														            <button id="ValRes_${j.ID}" value="${j.ID}"  class="ValRes" data-toggle="modal" data-target="#ModalValRes" ><span class="glyphicon glyphicon-ok"></span> Validar</button>	 --%>
															            <button id="valR_${j.ID}" name="valR_${j.ID}" type="submit" class="QRvalidar"><span class="glyphicon glyphicon-ok"></span> Validar</button>
														            </td>
														            <td><div class="qrcode">${j.codigoQr}</div></td>		            									       
														        </tr>	
															</c:if>
									$(window).load(function(){			    	</c:forEach>
											   		</c:forEach>
											    </tbody>
											</table>
										</div>
									  </div>
									  
									  <div class="col-md-6">
									  	<b><big>Validados</big></b>
									  	<br></br>
									  	<div class="tabla2" id="tabla2">
										  	<table class="table table-bordered">
											    <thead>
											        <tr>
											            <th>Oferta</th>
											            <th>QR</th>
											        </tr>
											    </thead>
											    <tbody>
											    	<c:forEach items="${local.ofertas}" var="i">
											    	 	<c:forEach items="${i.reservas}" var="j">
												    		<c:if test="${j.validado == true}">
													    		<tr>
														            <td><h4 class="media-heading">${i.nombre}</h4></td>
																	<td><div class="qrcode">${j.codigoQr}</div></td>
														        </tr>	
															</c:if>
												    	</c:forEach>
											   		</c:forEach>
											    </tbody>
											</table>
										</div>								  
									  </div>
									</div>	
								</div>
								
								<div class="tab-pane fade" id="opiniones">
									
									
									<div id="TodosComentarios" class="TodosComentarios">
									<c:forEach items="${local.comentarios}" var="i">
										<div class="media">
										<div class="pull-left">
											<img class="media-object" src="localesFoto?id=${i.local.ID}.jpg" height="135" width="180"> 
										</div>
										
										<div class="media-body">											
											<h4 class="media-heading">Comentario #1</h4>
											<p>${i.texto}</p>
											<button id="delComment_${i.ID}" value="${i.ID}"  class="rellenaDatosComentario" data-toggle="modal" data-target="#ModalDelComentario" ><span class="glyphicon glyphicon-trash"></span> Eliminar</button>	
										</div>
										</div>
									</c:forEach>
									
									</div>
									
								</div>
								
								<div class="tab-pane fade" id="editar"><!--form to edit restaurant profile data-->
									<form role="form" method="POST" enctype="multipart/form-data" action="editarLocal">
									<input hidden="submit" id="id_editLocal" name="id_editLocal" value="${local.ID}" />
									<input hidden="submit" id="redireccion" name="redireccion" value="comercio_interno" />
										  <div class="form-group">
											<label for="name">Nombre:</label>
											<input type="text" class="form-control" id="editNameLocal" required="required" name="editNameLocal" value="${local.nombre}">
										  </div>
										   <div class="form-group">
											<label for="timeBusiness">Horario:</label>
											<input type="text" class="form-control" id="editHorarioLocal" required="required" name="editHorarioLocal" value="${local.horario}">
										  </div>
										   <div class="form-group">
											<label for="dir">Dirección:</label>
											<input type="text" class="form-control" id="editDirLocal" required="required" name="editDirLocal" value="${local.direccion}">
										  </div>
										  <div class="form-group">
											<label for="email">Email:</label>
											<input type="email" class="form-control" id="editEmailLocal" required="required"  name="editEmailLocal" value="${local.email}">
										  </div>
										  <div class="form-group">
											<label for="tel">Teléfono:</label>
											<input type="tel" class="form-control" id="editTelLocal" required="required"  name="editTelLocal" value="${local.telefono}">
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
								         	<HR width=50% align="left">				               				
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
										  	<select class="form-control" name="nuevoTag" id="nuevoTag">
					               				<c:forEach items="${alltags}" var="i">					               				
					               					<option value="${i}"> ${i} </option>					               				
					               				</c:forEach>					               				
						               		</select>
										  </div>									  								  
										</form>					
								      </div>
								      <div class="modal-footer">						      	 
										  <button type="submit" class="btn" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
										  <button type="submit" class="anyadirTag" data-dismiss="modal"><span class="glyphicon glyphicon-send"></span> Enviar</button>
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

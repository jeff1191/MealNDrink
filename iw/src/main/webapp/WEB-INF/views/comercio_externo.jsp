<%@ include file="../fragments/header.jspf" %>
   <section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>${infoLocal.nombre}</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">
							<img src="${prefix}localesFoto?id=${infoLocal.ID}.jpg" height="350" width="350">                                  
							<h3>Dirección</h3>
							<p>${infoLocal.direccion}</p>
														
							<h3>Horario</h3>
							<p>${infoLocal.horario}</p>
																					
							<h3>Contacto</h3>
							<p>${(infoLocal.usuario).email}</p>
							<p>${(infoLocal.usuario).telefono}</p>
							<p>Preguntar por ${(infoLocal.usuario).nombre}</p>

							<div>
								<h3>Puntuación</h3>
								<h2>${infoLocal.puntuacion}/5</h2>
							</div>
						</div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-8 col-sm-8">
                        <div class="feature-wrap">
		    		<ul class="nav nav-tabs">
				  <li class="active"><a href="#ofertas" data-toggle="tab">Ofertas del restaurante</a></li>
				  <li><a href="#opiniones" data-toggle="tab">Opiniones</a></li>
				</ul>


				<div class="tab-content">
				  <div class="tab-pane fade in active" id="ofertas">
				   <c:choose>
						<c:when test="${empty infoLocal.ofertas}">	
							<p><b>Este local no tiene ninguna oferta</b></p>
						</c:when>
						<c:otherwise>				  
						    <c:forEach items="${infoLocal.ofertas}" var="i">
								<div class="media">
									<div class="pull-left">
										<img class="media-object" src="${prefix}ofertasFoto?id=${infoLocal.ID}.jpg">
									</div>
									<div class="media-body">
										<h4 class="media-heading">${i.nombre}</h4>
										<p>${i.descripcion}</p>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
					<br></br>
				
				   </div>

				   <div class="tab-pane fade" id="opiniones">
				    <div class="media">
				    	<c:choose>
							<c:when test="${not empty user}">	
								<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#ModalAddComment">
								<span class="glyphicon glyphicon-plus"></span> Añadir nuevo comentario</button>
					  		<br></br>
							</c:when>		
							<c:otherwise>
								<p><b>Necesitas estar registrado para realizar comentarios</b></p>
								<br></br>
							</c:otherwise>
						</c:choose>				  		
				    </div>
				    <c:choose>
						<c:when test="${empty infoLocal.comentarios}">	
							<p><b>Este local no tiene ningun comentario</b></p>
						</c:when>
						<c:otherwise>
						    <c:forEach items="${infoLocal.comentarios}" var="i">
							<div class="media">
								<div class="pull-left">
									<img class="media-object" src="usuariosFoto?id=${i.usuario.ID}.jpg" height="135" width="180">
								</div>
								<div class="media-body">
									<h4 class="media-heading">${(i.usuario).nombre}</h4>
									<p>${i.texto} - ${i.fecha}</p>
								</div>
							</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>				
					<br>
					
				</div>
						<!-- Modal Add Comment-->
								<div class="modal fade" id="ModalAddComment" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel">
								  <div class="modal-dialog modal-sm" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="addModalLabel"> Añadir un nuevo comentario</h4>
								      </div>
								      <div class="modal-body">
										<form id="formAddComment" role="form" method="POST" enctype="multipart/form-data" action="nuevoComentario">
										<input hidden="submit" name="idLocal" value="${infoLocal.ID}" />
										  <div class="form-group">											
											<textarea style="resize:none" name="comment" id="comment" cols="60" rows="7" placeholder="Introduzca su comentario" form="formAddComment" value= ""></textarea>
										  </div>									
											<div class="modal-footer">						      	 
											  	<button type="submit" class="btn" value="Submit"><span class="glyphicon glyphicon-send"></span> Enviar</button>
												<button type="submit" class="btn" data-dismiss="modal"><span class="glyphicon glyphicon-trash"></span> Descartar</button>
									     	</div>
										</form>							
								      </div>

								    </div>
								  </div>
								</div>     
								<!-- End Modal Add Comment-->
                        </div>
                    </div><!--/.col-md-4-->

                </div><!--/.services-->
            </div><!--/.row--> 
</div>
           
        </section>
<%@ include file="../fragments/footer.jspf" %>

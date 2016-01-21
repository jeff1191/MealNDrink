<%@ include file="../fragments/header.jspf" %>
   <section id="feature" class="transparent-bg">
            <div class="container">
                <div class="center">
                     <h2>${infoLocal.nombre}</h2>
                </div>
                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-4">
							<img src="${prefix}localesFoto?id=${infoLocal.foto}" height="350" width="350">                                  
							<h3>Dirección</h3>
							<p>${infoLocal.direccion}</p>
														
							<h3>Horario</h3>
							<p>${infoLocal.horario}</p>
																					
							<h3>Contacto</h3>
							<p>${(infoLocal.usuario).email}</p>
							<p>${(infoLocal.usuario).telefono}</p>
							<p>Preguntar por ${(infoLocal.usuario).nombre}</p>

							<h3>Tags</h3>
							<p>${infoLocal.tags}</p>

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
				    <c:forEach items="${infoLocal.ofertas}" var="i">
						<div class="media">
							<div class="pull-left">
								<img class="media-object" src="${prefix}ofertasFoto?id=${infoLocal.foto}">
							</div>
							<div class="media-body">
								<h4 class="media-heading">${i.nombre}</h4>
								<p>${i.descripcion}</p>
							</div>
						</div>
					</c:forEach>
					
					<br></br>
					<button type="submit" class="btn btn-default">Anterior</button>
					<button type="submit" class="btn btn-default">Siguiente</button>
				   </div>

				   <div class="tab-pane fade" id="opiniones">
				    <c:forEach items="${infoLocal.comentarios}" var="i">
					<div class="media">
						<div class="pull-left">
							<img class="media-object" src="${prefix}resources/img/user.jpg">
						</div>
						<div class="media-body">
							<h4 class="media-heading">${(i.usuario).nombre}</h4>
							<p>${i.texto} - ${i.fecha}</p>
						</div>
					</div>
					</c:forEach>				
					<br></br>
					<button type="submit" class="btn btn-default">Anterior</button>
					<button type="submit" class="btn btn-default">Siguiente</button>
				</div>
                        </div>
                    </div><!--/.col-md-4-->

                </div><!--/.services-->
            </div><!--/.row--> 
</div>
            <div class="clients-area center">
                <h2>Ubicación</h2>
                <div>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.289259162295!2d-120.7989351!3d37.5246781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8091042b3386acd7%3A0x3b4a4cedc60363dd!2sMain+St%2C+Denair%2C+CA+95316%2C+Hoa+K%E1%BB%B3!5e0!3m2!1svi!2s!4v1434016649434" width="100%" height="300" frameborder="0" style="border:0"></iframe>
				</div>
                <div>
					
				</div>
            </div>
        </section>
<%@ include file="../fragments/footer.jspf" %>

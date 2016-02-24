<%@ include file="../fragments/header.jspf" %>
<section id="portfolio">
        <div class="container">
            <div class="center">
               <h2>Últimas ofertas</h2>
               <h3>Ofertas que han reservado otros usuarios este mes</h3>
            </div>
        
			
            <ul class="portfolio-filter text-center">
                <li><a class="btn btn-default active" href="#" data-filter="*">Todas las ofertas</a></li>
                <c:forEach items="${alltags}" var="i">
                	<li><a class="btn btn-default" href="#" data-filter=".${r:forHtmlContent(i.texto)}">#${r:forHtmlContent(i.texto)}</a></li>
                </c:forEach>
            </ul><!--/#portfolio-filter-->
           

            <div class="row">
            
            	<div class="portfolio-items">
            
            	<c:forEach items="${platos}" var="i" varStatus="status">						         		
	               		<div class="portfolio-item ${r:forHtmlContent(tagsString[status.index])} col-xs-12 col-sm-4 col-md-3">
               		    <div class="recent-work-wrap">
	                        <img class="img-responsive" WIDTH=178 HEIGHT=150 src="ofertasFoto?id=${i.ID}.jpg" >
	                        <div class="overlay">
	                        <div class="recent-work-inner">
	                                <h3><a href="#">${r:forHtmlContent(i.nombre)}</a></h3>
	                                <p>${r:forHtmlContent(i.descripcion)}</p>	
	                                 <p>Cap: ${r:forHtmlContent(i.capacidadActual)}/${r:forHtmlContent(i.capacidadTotal)}</p>
							<c:choose>
									<c:when test="${not empty user}">	
									<c:if test="${user.rol != 'admin'}">
									<a class="preview" href="reserva?id=${i.ID}&dondeEstoy=ultimasOfertas">
										<i class="glyphicon glyphicon-cutlery"></i> Reservar
									</a>
									</c:if>
									<a class="preview" href="comercio_externo?id=${r:forHtmlContent((i.local).ID)}">
										<i class="fa fa-eye"></i> Ver restaurante
									</a>	
									</c:when>		
									<c:otherwise>
									<a class="preview" href="comercio_externo?id=${r:forHtmlContent((i.local).ID)}">
										<i class="fa fa-eye"></i> Ver restaurante
									</a>
									</c:otherwise>
							</c:choose>
										
								</div> 
	                        </div>
	                    </div>
	                </div>   	                
	            	</c:forEach>
            	</div>
            </div><!--/.row-->          
        </div>
    </section><!--/#portfolio-item-->

<%@ include file="../fragments/footer.jspf" %>
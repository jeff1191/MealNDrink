<%@ include file="../fragments/header.jspf" %>
<section id="portfolio">
        <div class="container">
            <div class="center">
               <h2>Ofertas del mes</h2>
            </div>
        

            <ul class="portfolio-filter text-center">
                <li><a class="btn btn-default active" href="#" data-filter="*">Todas las ofertas</a></li>
                <c:forEach items="${alltags}" var="i">
                	<li><a class="btn btn-default" href="#" data-filter=".${i}">#${i}</a></li>
                </c:forEach>
            </ul><!--/#portfolio-filter-->

            <div class="row">
                <div class="portfolio-items">
                    <c:forEach items="${platos}" var="i">
               		<div class="portfolio-item ${i.tags} col-xs-12 col-sm-4 col-md-3">
               		    <div class="recent-work-wrap">
	                        <img class="img-responsive" WIDTH=178 HEIGHT=150 src="ofertasFoto?id=${i.foto}" alt="">
	                        <div class="overlay">
	                        <div class="recent-work-inner">
	                                <h3><a href="#">${i.nombre}</a></h3>
	                                <p>${i.descripcion}</p>
									 <!--<a class="preview" href="#" data-toggle="modal" data-target="#reservarModal${i.nombre}"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>-->
									<a class="preview" href="/mealndrinl/reserva?id=${i.ID}&dondeEstoy=ofertasMes"><i class="glyphicon glyphicon-cutlery"></i> Reservar</a>
									<a class="preview" href="/mealndrink/comercio_externo?id=${(i.local).ID}"><i class="fa fa-eye"></i> Ver restaurante</a>	
								</div> 
	                        </div>
	                    </div>
	                </div>   
	            	</c:forEach>
                </div>
            </div>           
        </div>
    </section><!--/#portfolio-item-->
<%@ include file="../fragments/footer.jspf" %>
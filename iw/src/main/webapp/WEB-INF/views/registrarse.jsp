<%@ include file="../fragments/header.jspf" %>
<section id="about-us">
        <div class="container">
			<div class="center">
				<h2>Registrarse en MealNDrink</h2>
				<p class="lead">Introduce tus datos para registrarte en MealNDrink</p>
			</div>
			
			
			<div>
				<form role="form">
				  <div class="form-group">
					<label for="name">Nombre:</label>
					<input type="text" class="form-control" id="name" placeholder="Introduce un nuevo nombre">
				  </div>
				  <div class="form-group">
					<label for="pwd">Contraseña:</label>
					<input type="password" class="form-control" id="pwd" placeholder="Introduce una nueva contraseña">
				  </div>
				  <div class="form-group">
					<label for="email">Email:</label>
					<input type="email" class="form-control" id="email" placeholder="Introduce un nuevo email">
				  </div>
				  <div class="form-group">
					<label for="tel">Teléfono:</label>
					<input type="tel" class="form-control" id="tel" placeholder="Introduce un nuevo telefono">
				  </div>
				  <div class="form-group">
					<label for="file">Imagen de perfil:</label>
					<input type="file" name="fileToUpload" accept="image/*" id="fileToUpload">											
				  </div>
				  <div>
				  	<label for="file">Imagen de perfil:</label>
					<select name="Rol">
						<option value="volvo">Cliente</option>
						<option value="saab">Propietario de comercio</option>
					</select>
				  <div>
				  <br>
				  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-floppy-disk"></span> Registrarse</button>
				</form>			
			</div>
			
			
		</div><!--/.container-->
    </section><!--/about-us-->
<%@ include file="../fragments/footer.jspf" %>

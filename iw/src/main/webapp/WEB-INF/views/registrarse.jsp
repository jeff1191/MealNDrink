<%@ include file="../fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	
	 <script type="text/javascript"> //javascript aqui es solo de prueba BORRAR
		
			$(document).keypress(function(e) {
				if (e.which == 13) {
					validacion();
				}
			});

			$(function() {
				$("#regis").click(function() {
					validacion();
				})
			})

			function validacion() {
				var val = validacionRegistrarse();  //se hace una segunda validación en el lado del servidor para evitar daños

				if (val === true) {
					var nombr = $("#regname").val();
					var contr = $("#regpwd").val();
					var e_mail = $("#regemail").val();
					var telef = $("#regtel").val();
					var rool = $("#regRol").val();

					$.ajax({
						url : "${prefix}registroUsuario",
						type : "POST",
						data : {
							name : nombr,
							pwd : contr,
							email : e_mail,
							tel : telef,
							Rol : rool
						},
						error : function() {
							apodoOcupado()
						},
						success : function() {
							$("#formRegis").submit();
							location.href = "${prefix}/mealndrink";

						}
					})
				}
			};
		</script>
</head>
<body>
<section id="about-us">
        <div class="container">
			<div class="center">
				<h2>Registrarse en MealNDrink</h2>
				<p class="lead">Introduce tus datos para registrarte en MealNDrink</p>
			</div>
				
				<div>
				  <div class="form-group">
					<label for="name">Apodo:</label>
					<input required type="text" class="form-control" id="regname" name="regname" placeholder="Introduce un nuevo nombre(4-12 caracteres)">
				  </div>
				  <div class="form-group">
					<label for="pwd">Contraseña:</label>
					<input required type="password" class="form-control" id="regpwd" name="regpwd" placeholder="Introduce una nueva contraseña(6-12 caracteres)">
				  </div>
				  <div class="form-group">
					<label for="email">Email:</label>
					<input required type="email" class="form-control" id="regemail" name="regemail" placeholder="Introduce un nuevo email">
				  </div>
				  <div class="form-group">
					<label for="tel">Teléfono:</label>
					<input required type="tel" class="form-control" id="regtel" name="regtel" placeholder="Introduce un nuevo telefono">
				  </div>
				  <div class="form-group">
					<form id="formRegis" action="${prefix}registroUsuarioFoto" method="post" name="formRegis" enctype="multipart/form-data">
						<label for="file">Imagen de perfil:</label>
						<input required type="file" id="regfileToUpload" name="regfileToUpload" accept="image/*" id="fileToUpload">											
				  	</form>	
				  </div>
				  <div>
				  	<label for="file">¿Qué tipo de actividad tendrá en MealNDrink?:</label>
					<select required id="regRol" name="regRol">
						<option value="cliente">Cliente</option>
						<option value="propietario_comercio">Propietario de comercio</option>
					</select>
				  </div>
				  <br>	
				<button  class="btn btn-default" id="regis" name="regis"><span class="glyphicon glyphicon-floppy-disk"></span>Registrarse</button>
				
						
			</div>
		</div><!--/.container-->
</section><!--/about-us-->
</body>
</html>
<%@ include file="../fragments/footer.jspf" %>


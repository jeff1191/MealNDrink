<%@ include file="../fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<!-- <script src="${prefix}resources/js/validacionFormReg.js"></script>
	 -->
	 <script type="text/javascript"> //javascript aqui es solo de prueba BORRAR
	 $(function() {
			$("#regis").click(function() {
				validacion();	
			})	
		})
	
		
		
		function validacion(){
			var val = validacionRegistrarse();
			
			if(val === true){
				var nombr = $("#regname").val();
				var contr = $("#regpwd").val();
				var e_mail = $("#regemail").val();
				var telef = $("#regtel").val();
				var rool = $("#regRol").val();
				
				$.ajax({
					url: "${prefix}registroUsuario",
					type: "POST",
					data: {
						name: nombr,  
						pwd: contr,
						email: e_mail,
						tel: telef,
						Rol: rool
					},
					error: function(){
						apodoOcupado()
					},
					success: function(){
						$("#formRegis").submit();
						location.href = "${prefix}/iw";
						
					}			
				})
			}
		};


		function validacionRegistrarse(){
			var nombr = $("#regname");
			var contr = $("#regpwd");
			var e_mail = $("#regemail");
			var telef = $("#regtel");
			var foto = $("#regfileToUpload");
			var rool = $("#regRol");
			
			var error = true;
			
			recargarElementos(); //si al volver a dar a registrar se corrigen errores pero siguen habiendo otros esto quita el rojo a los corregidos
			
			
			//validar email
			if( !(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(e_mail.val())) ) {
				e_mail.css("background", "red");
				e_mail.css("color", "white");
				
				error = false;
			}
			
			//validar telefono
			if( !(/^\d{9}$/.test(telef.val()))) {
				telef.css("background", "red");
				telef.css("color", "white");
				
				error = false;
			}
			
			//validad nombre
			if(nombr.val().length < 4 || nombr.val().length > 12) {
				nombr.css("background", "red");
				nombr.css("color", "white");
				
				error = false;
			}
			
			//validar contra
			if(contr.val().length < 6 || contr.val().length > 12) {
				contr.css("background", "red");
				contr.css("color", "white");
				
				error = false;
			}
			
			//validar foto
			if(foto.val() === "") {
				foto.css("background", "red");
				foto.css("color", "white");
				
				error = false;
			}
			
			if(error === false)
				alert("Los campos en rojo son erróneos")
			
			return error;
		};

		function recargarElementos(){
			var nombr = $("#regname");
			var contr = $("#regpwd");
			var e_mail = $("#regemail");
			var telef = $("#regtel");
			var foto = $("#regfileToUpload");
			var rool = $("#regRol");
			
			e_mail.css("background", "white");
			e_mail.css("color", "grey");
			telef.css("background", "white");
			telef.css("color", "grey");
			nombr.css("background", "white");
			nombr.css("color", "grey");
			contr.css("background", "white");
			contr.css("color", "grey");
			foto.css("background", "white");
			foto.css("color", "black");
		};

		function apodoOcupado(){
			var nombr = $("#regname");
			
			nombr.css("background", "yellow");
			nombr.css("color", "white");
			
			alert("El apodo está ocupado. Elija otro (campo amarillo)")
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
					<label for="file">Imagen de perfil:</label>
					<input required type="file" id="regfileToUpload" name="regfileToUpload" accept="image/*" id="fileToUpload">											
				  </div>
				  <div>
				<form id="formRegis" action="registroUsuarioFoto" method="post" name="formRegis" enctype="multipart/form-data">
				  	<label for="file">¿Qué tipo de actividad tendrá en MealNDrink?:</label>
				</form>	
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

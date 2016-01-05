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
				var formularioRegistro = document.formRegis;
				
				var nombr = document.formRegis.name;
				var contr = formularioRegistro.pwd;
				var e_mail = formularioRegistro.email;
				var telef = formularioRegistro.tel;
				var foto = formularioRegistro.fileToUpload;
				var rool = formularioRegistro.Rol;
				
				$.ajax({
					dataType: "json",
					url: "${prefix}registroUsuario",
					type: "POST",
					data: {
						nombre: nombr,
						password: contr,
						email: e_mail,
						telefono: telef,
						photo: foto,
						rol: rool
					},
					success: function(){
						alert("Apodo libre");
					},
					error: function(){
						alert("Apodo libre") //apodoOcupado()
					}
				})
			}
		};


		function validacionRegistrarse(){
			
			var formularioRegistro = document.formRegis;
			
			var nombre = document.formRegis.name;
			var  contr = formularioRegistro.pwd;
			var  email = formularioRegistro.email;
			var  telef = formularioRegistro.tel;
			var   foto = formularioRegistro.fileToUpload;
			
			var error = true;
			
			recargarElementos(); //si al volver a dar a registrar se corrigen errores pero siguen habiend otros esto quita el rojo a los corregidos
			
			
			//validar email
			if( !(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email.value)) ) {
				email.style.background = "red";
				email.style.color = "white";
				
				error = false;
			}
			
			//validar telefono
			if( !(/^\d{9}$/.test(telef.value)) ) {
				telef.style.background = "red";
				telef.style.color = "white";
				
				error = false;
			}
			
			//validad nombre
			if(nombre.value.length < 4 || nombre.value.length > 12) {
				nombre.style.background = "red";
				nombre.style.color = "white";
				
				error = false;
			}
			
			//validar contra
			if(contr.value.length < 6 || contr.value.length > 12) {
				contr.style.background = "red";
				contr.style.color = "white";
				
				error = false;
			}
			
			if(error === false)
				alert("Los campos en rojo son erróneos")
			
			return error;
		};

		function recargarElementos(){
			var formularioRegistro = document.formRegis;
			
			var nombre = document.formRegis.name;
			var  contr = formularioRegistro.pwd;
			var  email = formularioRegistro.email;
			var  telef = formularioRegistro.tel;
			var   foto = formularioRegistro.fileToUpload;
			
			email.style.background = "white";
			email.style.color = "grey";
			telef.style.background = "white";
			telef.style.color = "grey";
			nombre.style.background = "white";
			nombre.style.color = "grey";
			contr.style.background = "white";
			contr.style.color = "grey";
		};

		function apodoOcupado(){
			nombre.style.background = "yellow";
			nombre.style.color = "red";
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
				<form id="formRegis" name="formRegis" enctype="multipart/form-data">
				  <div class="form-group">
					<label for="name">Apodo:</label>
					<input required type="text" class="form-control" id="name" name="name" placeholder="Introduce un nuevo nombre(4-12 caracteres)">
				  </div>
				  <div class="form-group">
					<label for="pwd">Contraseña:</label>
					<input required type="password" class="form-control" id="pwd" name="pwd" placeholder="Introduce una nueva contraseña(6-12 caracteres)">
				  </div>
				  <div class="form-group">
					<label for="email">Email:</label>
					<input required type="email" class="form-control" id="email" name="email" placeholder="Introduce un nuevo email">
				  </div>
				  <div class="form-group">
					<label for="tel">Teléfono:</label>
					<input required type="tel" class="form-control" id="tel" name="tel" placeholder="Introduce un nuevo telefono">
				  </div>
				  <div class="form-group">
					<label for="file">Imagen de perfil:</label>
					<input required type="file" id="fileToUpload" name="fileToUpload" accept="image/*" id="fileToUpload">											
				  </div>
				  <div>
				  	<label for="file">¿Qué tipo de actividad tendrá en MealNDrink?:</label>
					<select required id="Rol" name="Rol">
						<option value="cliente">Cliente</option>
						<option value="propietario_comercio">Propietario de comercio</option>
					</select>
				  </div>
				  <br>
				  <button  class="btn btn-default" id="registroUsuario" name="registroUsuario"><span class="glyphicon glyphicon-floppy-disk"></span>Registrarse</button>
				</form>	
				<button  class="btn btn-default" id="regis" name="regis"><span class="glyphicon glyphicon-floppy-disk"></span>Registrarse</button>
				
						
			</div>
		</div><!--/.container-->
</section><!--/about-us-->
</body>
</html>
<%@ include file="../fragments/footer.jspf" %>

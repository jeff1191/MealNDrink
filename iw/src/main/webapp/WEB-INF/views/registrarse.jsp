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
				var foto = $("#regfileToUpload").val();
				var rool = $("#regRol").val();
				
				$.ajax({                                      //no me entra nunca en el servlet ¬¬
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
						location.href = "${prefix}home/";
					},
					error: function(){
						apodoOcupado()
					}
				})
				
				/*$.post( "registroUsuario",{nombre: nombr, password: contr, email: e_mail, telefono: telef, photo: foto, rol: rool},function(data){
					alert("MEC");
						
				});*/
			}
		};


		function validacionRegistrarse(){
			
			var formularioRegistro = document.formRegis;
			
			var nombre = document.formRegis.regname;
			var  contr = formularioRegistro.regpwd;
			var  email = formularioRegistro.regemail;
			var  telef = formularioRegistro.regtel;
			var   foto = formularioRegistro.regfileToUpload;
			
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
			
			var nombre = document.formRegis.regname;
			var  contr = formularioRegistro.regpwd;
			var  email = formularioRegistro.regemail;
			var  telef = formularioRegistro.regtel;
			var   foto = formularioRegistro.regfileToUpload;
			
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
			var formularioRegistro = document.formRegis;
			
			var nombre = document.formRegis.regname;
			
			nombre.style.background = "yellow";
			nombre.style.color = "red";
			
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
				<form id="formRegis" name="formRegis" enctype="multipart/form-data">
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
				  	<label for="file">¿Qué tipo de actividad tendrá en MealNDrink?:</label>
					<select required id="regRol" name="regRol">
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

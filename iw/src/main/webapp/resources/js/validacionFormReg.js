	function validacionRegistrarse(){
			var nombr = $("#regname");
			var contr = $("#regpwd");
			var e_mail = $("#regemail");
			var telef = $("#regtel");
			var foto = $("#regfileToUpload");
			var rool = $("#regRol");
			
			var seguro;
			var error = true;
			
			recargarElementos(); //si al volver a dar a registrar se corrigen errores pero siguen habiendo otros esto quita el rojo a los corregidos
			
			seguro = textoSeguro(e_mail.val()) && textoSeguro(telef.val()) && textoSeguro(nombr.val()) && textoSeguro(contr.val());
			
			//validar email
			if(false === textoSeguro(e_mail.val()) || false === (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(e_mail.val())) ) {
				
				e_mail.css("background", "red");
				e_mail.css("color", "white");
				
				error = false;
			}
			
			//validar telefono
			if(!textoSeguro(telef.val()) ||  !(/^\d{9}$/.test(telef.val()))) {
				telef.css("background", "red");
				telef.css("color", "white");
				
				error = false;
			}
			
			//validad nombre
			if(!textoSeguro(nombr.val()) || nombr.val().length < 4 || nombr.val().length > 12) {
				nombr.css("background", "red");
				nombr.css("color", "white");
				
				error = false;
			}
			
			//validar contra
			if(!textoSeguro(contr.val()) || contr.val().length < 6 || contr.val().length > 12) {
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
				
			if(seguro === false)
				alert("Alguno de los campos incluye simbolos no permitidos: <>$.")
			
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
			nombr.css("color", "red");
			
			alert("El apodo está ocupado. Elija otro (campo amarillo)")
		};
		

	function validacionReserva(){
			var cap = $("#reservas").val();
			var date = $("#datepicker").val();
			var hour = $("#timepicker").val();			
			var datelimit = ${fechaLimite};			
			var dateNow = ${fechaActual};
			var capMax = ${infoOferta.capacidadTotal};
						
			var error = true;
			
			recargarElementos(); //si al volver a dar a registrar se corrigen errores pero siguen habiendo otros esto quita el rojo a los corregidos
			
			
			//validar fecha
			if(date.val() > datelimit || date.val() < dateNow) {
				date.css("background", "red");
				date.css("color", "white");
				
				error = false;
			}
			
			//validar hora formato hh:mm
			if(!(/^([0-9]{2})+\:([0-9]{2})+$/.test(hour.val()))) {
				hour.css("background", "red");
				hour.css("color", "white");
				
				error = false;
			}
			
			//validad capacidad
			if(cap.val() > capMax || cap.val() < 1) {
				cap.css("background", "red");
				cap.css("color", "white");
				
				error = false;
			}
						
			if(error === false)
				alert("Los campos en rojo son erróneos")
			
			return error;
		};
		function recargarElementos(){
			var cap = $("#reservas").val();
			var date = $("#datepicker").val();
			var hour = $("#timepicker").val();	
			
			cap.css("background", "white");
			cap.css("color", "grey");
			date.css("background", "white");
			date.css("color", "grey");
			hour.css("background", "white");
			hour.css("color", "grey");			
		};
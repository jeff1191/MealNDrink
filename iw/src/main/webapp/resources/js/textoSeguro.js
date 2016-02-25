	function palabraSeguro(palabra) {
		//return palabra.match("^[a-zA-Z0-9_ ]*$");
		return /^[a-zA-Z0-9_ ]*$/.test(palabra);
	};

	function descripcionSeguro (descripcion) {
		//return descripcion.match("^[a-zA-Z0-9-_,._ ]*$");
		return /^[a-zA-Z0-9-_,._ ]*$/.test(descripcion);
	};

	function direccionSeguro (direccion) {
		//return direccion.match("^[a-zA-Z0-9-_,._ ]*$");
		return /^[a-zA-Z0-9-_,._ ]*$/.test(direccion);
	};

	function horarioSeguro (horario) {
		//return direccion.match("^[0-9-]*$");
		return /^[0-9-]*$/.test(horario);
	};

	function telefonoSeguro (telefono) {
		//return telefono.match("^[0-9]{9}$");
		return /^[0-9]{9}$/.test(telefono);
	};

	function fechaSeguro (fecha) {
		//return fecha.match("^[0-9 -:]*$");
		return /^[0-9 -:]*$/.test(fecha);
	};

	function emailSeguro(email) {
		//return email.match("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		return /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email);
	};

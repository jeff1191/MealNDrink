	function palabraSeguro(palabra) {
		return palabra.matches("^[a-zA-Z0-9_ ]*$");
	};

	function descripcionSeguro (descripcion) {
		return descripcion.matches("^[a-zA-Z0-9-_,._ ]*$");
	};

	function direccionSeguro (direccion) {
		return direccion.matches("^[a-zA-Z0-9-_,._ ]*$");
	};

	function horarioSeguro (direccion) {
		return direccion.matches("^[0-9-]*$");
	};

	function telefonoSeguro (telefono) {
		return telefono.matches("^[0-9]{9}$");
	};

	function fechaSeguro (fecha) {
		return fecha.matches("^[0-9 -:]*$");
	};

	function emailSeguro(email) {
		return email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	};

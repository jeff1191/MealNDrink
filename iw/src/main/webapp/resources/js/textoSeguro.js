	function textoSeguro(str){
			
		var seguro = !(/^[^<>$]/.test(str));
	
		return seguro;
	};
		

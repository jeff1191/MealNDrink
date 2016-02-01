	function textoSeguro(str){
			
		var seguro = (/^[^<>$]/.test(str)); //var seguro = !(/^[^<>$]/.test(str)); con ! decia lo contrario
	
		return seguro;
	};
		

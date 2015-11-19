/**
 * 
 */
package Presentacion.controlador.comandos.plataforma;

import Negocio.factoria.SAFactoria;
import Negocio.plataforma.SAPlataforma;
import Negocio.plataforma.TransferPlataforma;
import Presentacion.controlador.comandos.Command;
import Presentacion.controlador.comandos.exceptions.commandException;


/** 
 * <!-- begin-UML-doc -->
 * <!-- end-UML-doc -->
 * @author H�ctor
 * @generated "UML a Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class CommandEliminarPlataforma implements Command {

	@Override
	public Object execute(Object datos) throws commandException {
		// TODO Auto-generated method stub
		SAPlataforma service = SAFactoria.getInstancia().nuevoServicioPlataforma();

		service.eliminarPlataforma((TransferPlataforma)datos);
		
		return (TransferPlataforma)datos; 
	}

}
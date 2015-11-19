package Presentacion.plataforma;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

import Negocio.plataforma.TransferPlataforma;
import Negocio.programa.TransferPrograma;
import Presentacion.biblioteca.JPanelBiblioteca;
import Presentacion.controlador.ControladorAplicacion;
import Presentacion.controlador.Eventos;
import Presentacion.programa.JPanelPrograma;

public class JDialogAnadirProgramaPlataforma extends JDialog {
	JTable jTableProgramaPlataforma = new javax.swing.JTable();

	public JDialogAnadirProgramaPlataforma(){
		initComponents();	
	}

	private void initComponents() {


		// TODO Auto-generated method stub

		JButton jButtonAnadir = new javax.swing.JButton();
		JScrollPane jScrollPane1 = new javax.swing.JScrollPane();
		JButton jButtonCancel = new javax.swing.JButton();
		JLabel peso = new JLabel("Tamano: ");
		final JTextField tamano=new JTextField();
		setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
		setTitle("Anadir Programa de plataforma");

		jButtonAnadir.setText("Anadir");

		//////RELLENO DE TABLA///////
		TransferPlataforma proPla = (TransferPlataforma) JPanelPlataforma.getModel().getItem(JPanelPlataforma.getTablePlataforma().getSelectedRow());

		ControladorAplicacion.getInstance().accionCommand(Eventos.MOSTRAR_PROGRAMA_PLATAFORMA, proPla);
		//////////////////////////

		///AnADO EL MODELO /////
		jTableProgramaPlataforma.setModel(JPanelPrograma.getTableModel());
		jScrollPane1.setViewportView(jTableProgramaPlataforma);
		/////////////////////////////

		jButtonCancel.setText("Cancel");

		javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
		getContentPane().setLayout(layout);
		layout.setHorizontalGroup(
				layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addGroup(layout.createSequentialGroup()
						.addContainerGap()
						.addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 436, javax.swing.GroupLayout.PREFERRED_SIZE)
						.addGap(0, 12, Short.MAX_VALUE))
						.addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
								.addGap(48, 48, 48)
								.addComponent(peso)
								.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
								.addComponent(tamano, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
								.addComponent(jButtonAnadir)
								.addGap(7, 7, 7)
								.addComponent(jButtonCancel)
								.addContainerGap())
				);
		layout.setVerticalGroup(
				layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addGroup(layout.createSequentialGroup()
						.addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 179, javax.swing.GroupLayout.PREFERRED_SIZE)
						.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
						.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
								.addComponent(jButtonAnadir)
								.addComponent(jButtonCancel)
								.addComponent(tamano, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
								.addComponent(peso))
								.addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
				);
		/////////////////ACTION LISTENER /////////////////////
		jButtonAnadir.addActionListener(new ActionListener() {			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				//seleccionados
				if(jTableProgramaPlataforma.getSelectedRow() != -1){
					try{
						Integer tam =Integer.parseInt(tamano.getText());
						TransferPlataforma addPlataforma = (TransferPlataforma) JPanelPlataforma.getModel().getItem(JPanelPlataforma.getTablePlataforma().getSelectedRow());
						TransferPrograma addPrograma = (TransferPrograma) JPanelPlataforma.getModeloProgramaPlataforma().getItem(jTableProgramaPlataforma.getSelectedRow());

						//Para poder pasar dos transfers creo un array que lo tratare en el determinado comando
						ArrayList<Object> transfers= new ArrayList<>();
						transfers.add(addPlataforma);
						transfers.add(addPrograma);
						transfers.add(tam);
						ControladorAplicacion.getInstance().accionCommand(Eventos.ANADIR_PROGRAMA_PLATAFORMA, transfers);
						setVisible(false);
					}catch(IllegalArgumentException e) {
						JOptionPane.showMessageDialog(null, "Tamano no es un numero");
					}
				}else
					JOptionPane.showMessageDialog(null, "No ha seleccionado ninguna plataforma");
			}
		});

		jButtonCancel.addActionListener(new ActionListener() {			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				setVisible(false);
			}
		});

		//////////////////////////////////////////////////////

		this.setVisible(true);
		setLocationRelativeTo(null);
		pack();
	}
}

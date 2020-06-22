
import java.awt.Color;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Carlos Nuila
 */
public class main extends javax.swing.JFrame {

    /**
     * Creates new form main
     */
    public main() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jt_ndbO = new javax.swing.JTextField();
        jt_portO = new javax.swing.JTextField();
        jt_userO = new javax.swing.JTextField();
        jt_psswdO = new javax.swing.JTextField();
        jt_nInstanciaO = new javax.swing.JTextField();
        jb_probarO = new javax.swing.JButton();
        jl_conexionEstadoO = new javax.swing.JLabel();
        jb_probarD = new javax.swing.JButton();
        jl_conexionEstadoD = new javax.swing.JLabel();
        jt_psswdD = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jt_userD = new javax.swing.JTextField();
        jt_portD = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jt_ndbD = new javax.swing.JTextField();
        jt_nInstanciaD = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jb_guardar = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jLabel14 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jl_tablasReplicar = new javax.swing.JList<>();
        jb_moverAdestino = new javax.swing.JButton();
        jb_moverAOrigen = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jl_tablasO = new javax.swing.JList<>();
        jb_realizarCambios = new javax.swing.JButton();
        jb_cancelar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel1.setText("Configuración de Base de Datos");
        jPanel2.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 20, -1, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel2.setText("Base de Datos de Origen");
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 60, -1, -1));

        jLabel3.setText("Nombre Instancia:");
        jPanel2.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, -1, -1));

        jLabel4.setText("Nombre Base Datos:");
        jPanel2.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 160, -1, -1));

        jLabel5.setText("Puerto:");
        jPanel2.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 200, -1, -1));

        jLabel6.setText("Password:");
        jPanel2.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 280, -1, -1));

        jLabel7.setText("Nombre Usuario:");
        jPanel2.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 240, -1, -1));

        jt_ndbO.setText("proyecto");
        jPanel2.add(jt_ndbO, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 160, 170, -1));

        jt_portO.setText("5432");
        jPanel2.add(jt_portO, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 200, 90, -1));

        jt_userO.setText("postgres");
        jPanel2.add(jt_userO, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 240, 140, -1));

        jt_psswdO.setText("12345678");
        jPanel2.add(jt_psswdO, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 280, 170, -1));

        jt_nInstanciaO.setText("postgredb.ccet05tt3mp2.us-east-1.rds.amazonaws.com");
        jPanel2.add(jt_nInstanciaO, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 110, 170, -1));

        jb_probarO.setText("Probar");
        jb_probarO.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_probarOMouseClicked(evt);
            }
        });
        jPanel2.add(jb_probarO, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 330, 80, 30));

        jl_conexionEstadoO.setForeground(new java.awt.Color(0, 255, 0));
        jPanel2.add(jl_conexionEstadoO, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 380, 110, 20));

        jb_probarD.setText("Probar");
        jb_probarD.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_probarDMouseClicked(evt);
            }
        });
        jPanel2.add(jb_probarD, new org.netbeans.lib.awtextra.AbsoluteConstraints(460, 330, 80, 30));

        jl_conexionEstadoD.setForeground(new java.awt.Color(0, 255, 0));
        jPanel2.add(jl_conexionEstadoD, new org.netbeans.lib.awtextra.AbsoluteConstraints(570, 380, 110, 20));

        jt_psswdD.setText("12345678");
        jPanel2.add(jt_psswdD, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 280, 170, -1));

        jLabel8.setText("Password:");
        jPanel2.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(380, 280, -1, -1));

        jLabel9.setText("Nombre Usuario:");
        jPanel2.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 240, -1, -1));

        jt_userD.setText("admin");
        jPanel2.add(jt_userD, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 240, 140, -1));

        jt_portD.setText("1521");
        jPanel2.add(jt_portD, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 200, 90, -1));

        jLabel10.setText("Puerto:");
        jPanel2.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 200, -1, -1));

        jLabel11.setText("Nombre Base Datos:");
        jPanel2.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 160, -1, -1));

        jt_ndbD.setText("PROYECTO");
        jPanel2.add(jt_ndbD, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 160, 170, -1));

        jt_nInstanciaD.setText("oracledb.ccet05tt3mp2.us-east-1.rds.amazonaws.com");
        jPanel2.add(jt_nInstanciaD, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 110, 170, -1));

        jLabel12.setText("Nombre Instancia:");
        jPanel2.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 110, -1, -1));

        jLabel13.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel13.setText("Base de Datos de Destino");
        jPanel2.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 60, -1, -1));

        jb_guardar.setText("Guardar");
        jb_guardar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_guardarMouseClicked(evt);
            }
        });
        jPanel2.add(jb_guardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 380, -1, -1));

        jTabbedPane1.addTab("Configuración", jPanel2);

        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel14.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel14.setText("Tablas DB Origen");
        jPanel3.add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 20, -1, -1));

        jl_tablasReplicar.setModel(new DefaultListModel());
        jScrollPane1.setViewportView(jl_tablasReplicar);

        jPanel3.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 70, 150, 250));

        jb_moverAdestino.setText("---->");
        jb_moverAdestino.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_moverAdestinoMouseClicked(evt);
            }
        });
        jPanel3.add(jb_moverAdestino, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 160, 90, -1));

        jb_moverAOrigen.setText("<----");
        jb_moverAOrigen.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_moverAOrigenMouseClicked(evt);
            }
        });
        jPanel3.add(jb_moverAOrigen, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 200, 90, -1));

        jl_tablasO.setModel(new DefaultListModel());
        jScrollPane2.setViewportView(jl_tablasO);

        jPanel3.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 70, 150, 250));

        jb_realizarCambios.setText("Realizar Cambios");
        jb_realizarCambios.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_realizarCambiosMouseClicked(evt);
            }
        });
        jPanel3.add(jb_realizarCambios, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 370, -1, -1));

        jb_cancelar.setText("Cancelar");
        jb_cancelar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jb_cancelarMouseClicked(evt);
            }
        });
        jPanel3.add(jb_cancelar, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 370, -1, -1));

        jTabbedPane1.addTab("Replicación", jPanel3);

        jPanel1.add(jTabbedPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 700, 460));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 463, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jb_probarOMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_probarOMouseClicked
        // TODO add your handling code here:
        if (jt_nInstanciaO.getText().equals("") || jt_ndbO.getText().equals("") || jt_portO.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "Debe llenar los campos", "Error", JOptionPane.ERROR_MESSAGE);
        } else {
            String nombreInstanciaO = jt_nInstanciaO.getText();
            String nombreDBO = jt_ndbO.getText();
            String port = jt_portO.getText();
            String user = jt_userO.getText();
            String passwd = jt_psswdO.getText();
            Conexion pruebaO = new Conexion(false, nombreInstanciaO, nombreDBO, port, user, passwd);
            pruebaO.getConnection();
            if (pruebaO.getConn() != null) {
                urlO = pruebaO.getUrl();
                jl_conexionEstadoO.setForeground(Color.green);
                jl_conexionEstadoO.setText("Conexión Correcta");
            } else {
                jl_conexionEstadoO.setForeground(Color.red);
                jl_conexionEstadoO.setText("Conexión Incorrecta");
            }
            pruebaO.desconexion();
            pruebaO = null;
        }
    }//GEN-LAST:event_jb_probarOMouseClicked

    private void jb_probarDMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_probarDMouseClicked
        // TODO add your handling code here:
        if (jt_nInstanciaD.getText().equals("") || jt_ndbD.getText().equals("") || jt_portD.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "Debe llenar los campos", "Error", JOptionPane.ERROR_MESSAGE);
        } else {
            String nombreInstanciaD = jt_nInstanciaD.getText();
            String nombreDBD = jt_ndbD.getText();
            String port = jt_portD.getText();
            String user = jt_userD.getText();
            String passwd = jt_psswdD.getText();
            Conexion pruebaD = new Conexion(true, nombreInstanciaD, nombreDBD, port, user, passwd);
            pruebaD.getConnection();
            if (pruebaD.getConn() != null) {
                urlD = pruebaD.getUrl();
                jl_conexionEstadoD.setForeground(Color.green);
                jl_conexionEstadoD.setText("Conexión Correcta");
            } else {
                jl_conexionEstadoD.setForeground(Color.red);
                jl_conexionEstadoD.setText("Conexión Incorrecta");
            }
            pruebaD.desconexion();
            pruebaD = null;
        }
    }//GEN-LAST:event_jb_probarDMouseClicked

    private void jb_guardarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_guardarMouseClicked
        // TODO add your handling code here:
        if (jl_conexionEstadoO.getText().equals("Conexión Correcta") && jl_conexionEstadoD.getText().equals("Conexión Correcta")) {

            DefaultListModel modelo = (DefaultListModel) jl_tablasO.getModel();
            modelo.addElement("Countries");
            modelo.addElement("Departments");
            modelo.addElement("Employees");
            modelo.addElement("Job_History");
            modelo.addElement("Jobs");
            modelo.addElement("Locations");
            modelo.addElement("Regions");

            jl_tablasO.setModel(modelo);
            JOptionPane.showMessageDialog(this, "Se guardaron las conexiones", "Información", JOptionPane.INFORMATION_MESSAGE);
        } else {
            JOptionPane.showMessageDialog(this, "Ambas conexiones deben ser correctas", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jb_guardarMouseClicked

    private void jb_moverAdestinoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_moverAdestinoMouseClicked
        // TODO add your handling code here:
        if (jl_tablasO.getSelectedIndex() != -1) {
            DefaultListModel modeloListaO = (DefaultListModel) jl_tablasO.getModel();
            DefaultListModel modeloListaR = (DefaultListModel) jl_tablasReplicar.getModel();

            modeloListaR.addElement(modeloListaO.getElementAt(jl_tablasO.getSelectedIndex()));
            modeloListaO.remove(jl_tablasO.getSelectedIndex());

            jl_tablasO.setModel(modeloListaO);
            jl_tablasO.setSelectedIndex(-1);
            jl_tablasReplicar.setModel(modeloListaR);
            jl_tablasReplicar.setSelectedIndex(-1);
        } else {
            JOptionPane.showMessageDialog(this, "Debe seleccionar un item en la lista de tablas", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jb_moverAdestinoMouseClicked

    private void jb_moverAOrigenMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_moverAOrigenMouseClicked
        // TODO add your handling code here:
        if (jl_tablasReplicar.getSelectedIndex() != -1) {
            DefaultListModel modeloListaO = (DefaultListModel) jl_tablasO.getModel();
            DefaultListModel modeloListaR = (DefaultListModel) jl_tablasReplicar.getModel();

            modeloListaO.addElement(modeloListaR.getElementAt(jl_tablasReplicar.getSelectedIndex()));
            modeloListaR.remove(jl_tablasReplicar.getSelectedIndex());

            jl_tablasO.setModel(modeloListaO);
            jl_tablasO.setSelectedIndex(-1);
            jl_tablasReplicar.setModel(modeloListaR);
            jl_tablasReplicar.setSelectedIndex(-1);
        } else {
            JOptionPane.showMessageDialog(this, "Debe seleccionar un item en la lista de replicar", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jb_moverAOrigenMouseClicked

    private void jb_cancelarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_cancelarMouseClicked
        // TODO add your handling code here:
        jl_tablasReplicar.setModel(new DefaultListModel<>());
        jl_tablasO.setModel(new DefaultListModel<>());

        DefaultListModel modelo = (DefaultListModel) jl_tablasO.getModel();
        modelo.addElement("Countries");
        modelo.addElement("Departments");
        modelo.addElement("Employees");
        modelo.addElement("Job_History");
        modelo.addElement("Jobs");
        modelo.addElement("Locations");
        modelo.addElement("Regions");

        jl_tablasO.setModel(modelo);

    }//GEN-LAST:event_jb_cancelarMouseClicked

    private void jb_realizarCambiosMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jb_realizarCambiosMouseClicked
        try {
            // TODO add your handling code here:
            insertar();
        } catch (SQLException ex) {
            Logger.getLogger(main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jb_realizarCambiosMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new main().setVisible(true);
            }
        });
    }

    public void insertar() throws SQLException {
        Conexion connOrigen = new Conexion(urlO, false);
        Conexion connDestino = new Conexion(urlD, true);
        connOrigen.getConnection();

        String row[] = new String[3];

        String sql = "SELECT tablaReferencia, datos, \"idOperacion\" FROM bitacora WHERE replicado = false AND operacion = 'Insert'";
        Statement st = connOrigen.getConn().createStatement();
        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            for (int i = 0; i < row.length; i++) {
                row[i] = rs.getString(i + 1);
            }

            String tabla = row[0];
            
            PreparedStatement ps = null;
            String actuaBitacora = "UPDATE bitacora SET replicado = true WHERE \"idOperacion\"= ?";
            ps = connOrigen.getConn().prepareStatement(actuaBitacora);
            ps.setInt(1, Integer.parseInt(row[2]));
            ps.execute();

            String insertarSQL = "";
            String campos[] = row[1].split("|");
            PreparedStatement ps2 = null;

            if (tabla.equals("Countries")) {
                insertarSQL = "INSERT INTO Countries VALUES (?,?,?)";
                ps2 = connDestino.getConnection().prepareStatement(insertarSQL);
                ps2.setString(1, campos[0]);
                if (campos[1].equals("0")){
                    ps2.setNull(2, java.sql.Types.NULL);
                } else {
                    ps2.setString(2, campos[1]);
                }
                if (campos[2].equals("0")){
                    ps2.setNull(3, java.sql.Types.NULL);
                }
            }
            
            if (tabla.equals("Departments")) {
                insertarSQL = "INSERT INTO Departments VALUES (?,?,?,?)";
                ps2 = connDestino.getConn().prepareStatement(insertarSQL);
                ps2.setInt(1, Integer.parseInt(campos[0]));
                if (campos[1].equals("0")){
                    ps2.setNull(2, java.sql.Types.NULL);
                } else {
                    ps2.setString(2, campos[1]);
                }
                if (campos[2].equals("0")){
                    ps2.setNull(3, java.sql.Types.NULL);    
                } else {
                    ps2.setInt(3, Integer.parseInt(campos[2]));
                }
                if (campos[3].equals("0")){
                    ps2.setNull(4, java.sql.Types.NULL);
                } else {
                    ps2.setInt(4, Integer.parseInt(campos[3]));
                }
            }
            
            if (tabla.equals("Employees")) {
                insertarSQL = "INSERT INTO Employees VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                ps2 = connDestino.getConn().prepareStatement(insertarSQL);
                ps2.setInt(1, Integer.parseInt(campos[0]));
                if (campos[1].equals("0")){
                    ps2.setNull(2, java.sql.Types.NULL);
                } else {
                    ps2.setString(2, campos[1]);
                }
                if (campos[2].equals("0")){
                    ps2.setNull(3, java.sql.Types.NULL);
                } else {
                    ps2.setString(3, campos[2]);
                }
                if (campos[3].equals("0")){
                    ps2.setNull(4, java.sql.Types.NULL);
                } else {
                    ps2.setString(4, campos[3]);
                }
                if (campos[4].equals("0")){
                    ps2.setNull(5, java.sql.Types.NULL);
                } else {
                    ps2.setString(5, campos[4]);
                }
                if (campos[5].equals("0")){
                    ps2.setNull(6, java.sql.Types.NULL);
                } else {
                    ps2.setDate(6, Date.valueOf(campos[5]));
                }
                if (campos[6].equals("0")){
                    ps2.setNull(7, java.sql.Types.NULL);
                } else {
                    ps2.setString(7, campos[6]);
                }
                if (campos[7].equals("0")){
                    ps2.setNull(8, java.sql.Types.NULL);
                } else {
                    ps2.setDouble(8, Double.parseDouble(campos[7]));
                }
                if (campos[8].equals("0")){
                    ps2.setNull(9, java.sql.Types.NULL);
                } else {
                    ps2.setDouble(9, Double.parseDouble(campos[8]));
                }
                if (campos[9].equals("0")){
                    ps2.setNull(10, java.sql.Types.NULL);
                } else {
                    ps2.setInt(10, Integer.parseInt(campos[9]));
                }
                if (campos[10].equals("0")){
                    ps2.setNull(11, java.sql.Types.NULL);
                } else {
                    ps2.setInt(11, Integer.parseInt(campos[10]));
                }
            }
            
            if (tabla.equals("Job_History")){
                insertarSQL = "INSERT INTO Job_History VALUES (?,?,?,?,?)";
                ps2 = connDestino.getConn().prepareStatement(insertarSQL);
                ps2.setInt(1, Integer.parseInt(campos[0]));
                ps2.setDate(2, Date.valueOf(campos[1]));
                if (campos[2].equals("0")){
                    ps2.setNull(3, java.sql.Types.NULL);
                } else {
                    ps2.setDate(3, Date.valueOf(campos[2]));
                }
                if (campos[3].equals("0")){
                    ps2.setNull(4, java.sql.Types.NULL);
                } else {
                    ps2.setString(4, campos[3]);
                }
                if (campos[4].equals("0")){
                    ps2.setNull(5, java.sql.Types.NULL);
                } else {
                    ps2.setInt(5, Integer.parseInt(campos[4]));
                }
            }
            
            if (tabla.equals("Jobs")){
                insertarSQL = "INSERT INTO Jobs VALUES (?,?,?,?)";
                ps2 = connDestino.getConn().prepareStatement(insertarSQL);
                ps2.setString(1, campos[0]);
                if (campos[1].equals("0")){
                    ps2.setNull(2, java.sql.Types.NULL);
                } else {
                    ps2.setString(2, campos[1]);
                }
                if (campos[2].equals("0")){
                    ps2.setNull(3, java.sql.Types.NULL);
                } else {
                    ps2.setInt(3, Integer.parseInt(campos[2]));
                }
                if (campos[3].equals("0")){
                    ps2.setNull(4, java.sql.Types.NULL);
                } else {
                    ps2.setInt(4, Integer.parseInt(campos[3]));
                }
            }
            
            if (tabla.equals("Locations")){
                insertarSQL = "INSERT INTO Jobs VALUES (?,?,?,?,?,?)";
                ps2 = connDestino.getConn().prepareStatement(insertarSQL);
                ps2.setInt(1, Integer.parseInt(campos[0]));
                for (int i = 1; i < campos.length;i++){
                    if (campos[i].equals("0")){
                        ps2.setNull(i+1, java.sql.Types.NULL);
                    } else {
                        ps2.setString(i+1, campos[i]);
                    }
                }
            }
            
            if (tabla.equals("Regions")){
                insertarSQL = "INSERT INTO Regions VALUES (?,?)";
                ps2 = connDestino.getConn().prepareStatement(insertarSQL);
                ps2.setInt(1, Integer.parseInt(campos[0]));
                if (campos[1].equals("0")){
                    ps2.setNull(2, java.sql.Types.NULL);
                } else {
                    ps2.setString(2, campos[1]);
                }
            }
            
            ps2.execute();
            connDestino.desconexion();
            System.out.println(Arrays.toString(row));
        }

        connOrigen.desconexion();
    }

    String urlO = "";
    String urlD = "";
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JButton jb_cancelar;
    private javax.swing.JButton jb_guardar;
    private javax.swing.JButton jb_moverAOrigen;
    private javax.swing.JButton jb_moverAdestino;
    private javax.swing.JButton jb_probarD;
    private javax.swing.JButton jb_probarO;
    private javax.swing.JButton jb_realizarCambios;
    private javax.swing.JLabel jl_conexionEstadoD;
    private javax.swing.JLabel jl_conexionEstadoO;
    private javax.swing.JList<String> jl_tablasO;
    private javax.swing.JList<String> jl_tablasReplicar;
    private javax.swing.JTextField jt_nInstanciaD;
    private javax.swing.JTextField jt_nInstanciaO;
    private javax.swing.JTextField jt_ndbD;
    private javax.swing.JTextField jt_ndbO;
    private javax.swing.JTextField jt_portD;
    private javax.swing.JTextField jt_portO;
    private javax.swing.JTextField jt_psswdD;
    private javax.swing.JTextField jt_psswdO;
    private javax.swing.JTextField jt_userD;
    private javax.swing.JTextField jt_userO;
    // End of variables declaration//GEN-END:variables
}


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Carlos Nuila
 */
public class Conexion {

    private Connection conn = null;
    private String className;
    private String nombreInstancia;
    private String nombreDB;
    private String puerto;
    private String user;
    private String clave;
    private String url;

    public Conexion(boolean oracle, String nombreInstancia, String nombreDB, String puerto, String user, String clave) {
        this.url = "jdbc:postgresql://";
        this.className = "org.postgresql.Driver";
        if (oracle) {
            this.url = "jdbc:oracle:thin:@";
            this.className = "oracle.jdbc.driver.OracleDriver";
        }
        this.nombreInstancia = nombreInstancia;
        this.puerto = puerto;
        this.nombreDB = nombreDB;
        this.user = user;
        this.clave = clave;
        this.url += this.nombreInstancia+":"+this.puerto+"/"+this.nombreDB+"?user="+this.user+"&password="+this.clave;
    }
    
    public Conexion(String url, boolean oracle){
        this.className = "org.postgresql.Driver";
        if (oracle){
            this.className = "oracle.jdbc.driver.OracleDriver";
        }
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public String getClassName() {
        return className;
    }

    public Connection getConnection() {
        try {
            Class.forName(className);
            conn = DriverManager.getConnection(url);
            conn.setAutoCommit(true);
            if (conn != null) {
                System.out.println("Conexion Exitosa");
            } else {
                System.out.println("Conexion Erronea");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Conexion erronea " + e.getMessage());
            return null;
        }
        return conn;
    }

    public Connection getConn() {
        return conn;
    }

    public void desconexion() {
        try {
            conn.close();
        } catch (Exception e) {

        }
    }

}

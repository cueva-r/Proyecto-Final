//En que paquete se encuentra la Clase
package utilitarios;
//1. Importar las librerias de JDBC
import java.sql.*;

//Nombre del Archivo(La Clase)
public class ConexionMysql {    
     //2. Crear un procedimiento que retorne la conexion
    //Creando un programa "retornaConexion"
    public  static Connection retornaConexion(){
            //a. Variables
            //String bd="Biblioteca.accdb";
            String user="root";
            String clave="1234";
            //b. Ruta de ubicación de la base de datos
            //String  ruta="jdbc:ucanaccess://H:\\"+bd;
            Connection cn=null;
            try {//código a evaluar
                //Identificar a los driver instalados
                //Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                Class.forName("com.mysql.cj.jdbc.Driver");
                //Conexion a la base de datos
                //cn=DriverManager.getConnection(ruta);
                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tedbel",user,clave);
                System.out.println("Conexion satisfactoria");
            } catch (Exception e) {//Muestra el error?
                System.out.println(e);
            }
                //Si todo marcha bien, retornar la conexion
            return cn;
    }  
    
}

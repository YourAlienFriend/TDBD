
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kalantax;
import java.sql.*;
/**
 *
 * @author Manolis
 */


public class Oracle {
    static String     driverClassName = "oracle.jdbc.OracleDriver" ;
    static String     url = "jdbc:oracle:thin:@192.168.6.21:1521:dblabs" ;
    static Connection dbConnection = null;
    static String     username = "iee2019019";
    static String     passwd = "Kalantax";
    static Statement  statement       = null;
    static ResultSet rs		      = null;
    
    public static void addArtist(int aid, String name,String s_b) throws Exception{
        Class.forName (driverClassName);
         dbConnection = DriverManager.getConnection (url, username, passwd);

        statement    = dbConnection.createStatement();
        statement.executeUpdate("insert INTO ARTISTS (id,name,sb) VALUES ('1', 'Ghost', 'band')");
        
        
    }
}

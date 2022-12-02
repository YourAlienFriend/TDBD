
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kalantax;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleTypes;
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
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName (driverClassName);
         dbConnection = DriverManager.getConnection (url, username, passwd);
         return dbConnection;
        
    }
    public static ResultSet songsbyAlbum(String album) throws SQLException, ClassNotFoundException{
        
        Connection dbcon =getConnection();
        PreparedStatement  ps  = dbcon.prepareStatement("{?=CALL SONGSBYALBUM(?,?)}");
        ps.setString(2,album);
        ResultSet rs= ps.executeQuery();
        return rs;
        
        
        
    }
    public static ResultSet songsbyGenre(String genre) throws SQLException, ClassNotFoundException{
        
        Connection dbcon =getConnection();
        CallableStatement  cs  = dbcon.prepareCall("{CALL SONGSBYGENRE(?,?)}");
        cs.registerOutParameter(1, OracleTypes.CURSOR);
        cs.setString(2,genre);
        
        
        cs.executeQuery();
        ResultSet rs= (ResultSet)cs.getObject(1);
       
        return rs;
    }
    
    public static void addArtists(int id,String name,String sb) throws ClassNotFoundException, SQLException{
        
        
            Connection dbcon=getConnection();
            CallableStatement cs=dbcon.prepareCall("{CALL ADDARTISTS(?,?,?)}");
            cs.setInt(1,id);
            cs.setString(2,name);
            cs.setString(3,sb);
            cs.executeQuery();
            cs.close();
            dbcon.close();
     
        
        
    }
    public static void deleteArtist(int id) throws SQLException, ClassNotFoundException{
        Connection dbcon=getConnection();
        CallableStatement cs=dbcon.prepareCall("{CALL DELETEARTIST(?)}");
        cs.setInt(1, id);
        cs.executeQuery();
        cs.close();
        
    }
    
    public static void addDisco(int id,String name,String city){
        try {
            Connection dbcon=getConnection();
            CallableStatement cs=dbcon.prepareCall("{CALL ADDDISCO(?,?,?)}");
            cs.setInt(1,id);
            cs.setString(2, name);
            cs.setString(3, city);
            cs.executeQuery();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Oracle.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Oracle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

   public static void deleteDisco(int id){
            Connection dbcon=getConnection();
            CallableStatement cs=dbcon.prepareCall("{CALL DELETEDISCO(?)}");
            cs.setInt(1,id);
            
}

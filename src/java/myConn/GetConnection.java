
package myConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class GetConnection {
    private final static String DName ="com.mysql.jdbc.Driver";
   // private final static String URL = "jdbc:mysql://gitaguide5.c5v7dbt06cqn.ap-south-1.rds.amazonaws.com:3306/gitaguide";
    private final static String URL = "jdbc:mysql://localhost:3306/gitaguide";
    private final static String User = "root";
    //private final static String Pass = "gitaguide2021";
    private final static String Pass = "root";
    public static Connection getConnect() 
    {
        Connection con = null;
        try
        {
            Class.forName(DName);
            con = DriverManager.getConnection(URL, User, Pass);
            if(con!=null)
            {
                System.out.println("connection Done !!");
            }
            
            
        }
        catch(SQLException | ClassNotFoundException | ClassCastException e )
        {
            System.out.println("error while having connection "+e);
            //e.printStackTrace();
           // System.out.println();
            
        }
        return con;
    }
    
}

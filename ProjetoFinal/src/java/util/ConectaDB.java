package util;

import java.sql.*;

public class ConectaDB {

    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");                
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/projetobd","root","");
            return conexao;
        }catch( SQLException ex){
            System.out.println("error: " + ex);
        }
        return conexao;
    }
}

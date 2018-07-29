/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author umesh patil
 */
@WebServlet(urlPatterns = {"/query"})
public class query extends HttpServlet {
Connection con;
Statement st;
public void init()
{
  try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/IntegratedLibrarySystem","root" ,"1111");
        st=con.createStatement();
        
    }catch(Exception ex)
    {
        System.out.println(ex);
    }   
   
}
public void service(HttpServletRequest request , HttpServletResponse response)
{
    String enrollno = request.getParameter("enrollno");
 String name = request.getParameter("name");
 String email = request.getParameter("email");
 String subject = request.getParameter("subject");
 String message = request.getParameter("message");
 
    try {
        st.executeUpdate("insert into adminnotification values('"+enrollno+"','"+name+"','"+email+"','"+subject+"','"+message+"')");
    } catch (SQLException ex) {
        System.out.println(ex);
    }
    
}
    
    
}

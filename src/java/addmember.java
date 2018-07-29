/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author umesh patil
 */
@WebServlet(urlPatterns = {"/addmember"})
public class addmember extends HttpServlet {

        Connection con;
    Statement st;
    
    public void init()
    { try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/IntegratedLibrarySystem","root" ,"1111");
        st=con.createStatement();
        
    }catch(Exception ex)
    {
        System.out.println(ex);
    }
    }

public void service(HttpServletRequest request,HttpServletResponse response)
{PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException ex) {
            ex.getMessage();
            }
    HttpSession session = request.getSession();
    String enroll = (String)session.getAttribute("username");
        String pass = (String)session.getAttribute("password");
        if((enroll==null) || (pass==null))
        {
            out.println("<script>alert('please login');</script>");
    try {
        response.sendRedirect("login2.html");
    } catch (IOException ex) {
        System.out.println(ex);
    }
        }else{
    
String enrollno = request.getParameter("enrollno");
String password = request.getParameter("password");
String name = request.getParameter("name");
String year = request.getParameter("year");
String course = request.getParameter("course");
String dob = request.getParameter("dob");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String address = request.getParameter("address");
            try {
                String q="insert into studentprofile(enrollno,name,year,course,DOB,phone_no,Email,address) values('"+enrollno+"','"+name+"','"+year+"','"+course+"','"+dob+"',"+phone+",'"+email+"','"+address+"');";
                System.out.println(q);
                st.executeUpdate(q);
                st.executeUpdate("insert into studentlogin(enrollno, passval) values('"+enrollno+"','"+password+"');");
            } catch (SQLException ex) {
                ex.getMessage();
            }String role = (String)session.getAttribute("role");
            switch(role)
            {
                case "admin" : out.println("<script>alert('Successfully Student Added');document.location.href='admin/addmember.jsp';</script>");
                break;
                case "librarian" :out.println("<script>alert('Successfully Student Added');document.location.href='librarian/addmember.jsp';</script>");
            }
            }

        }
}

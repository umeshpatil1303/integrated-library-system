/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author umesh patil
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
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

public void service(HttpServletRequest req,HttpServletResponse resp)
{
   
    String uname=req.getParameter("username");
    String pass = req.getParameter("password");
    String role = req.getParameter("person-login");
     HttpSession session=req.getSession();
try{
    PrintWriter out = resp.getWriter();
    ResultSet rs;
    switch(role)
    {
        case "student" :
           rs= st.executeQuery(" select * from studentlogin where enrollno ='"+uname+"' and passval='"+pass+"'; "); 
        if(rs.next())
        {
             session.setAttribute("username",uname);
             session.setAttribute("password",pass);
             session.setAttribute("role",role);
            resp.sendRedirect("student/studenthome.jsp");
        }
        else
        {
            out.println("<script>alert('invalid username or password'); document.location.href='login2.html'</script>");
        }
            break;    
        case "admin" :
           rs= st.executeQuery(" select * from adminlogin where userval ='"+uname+"' and passval='"+pass+"' "); 
        if(rs.next())
        {
             session.setAttribute("username",uname);
             session.setAttribute("password",pass);
              session.setAttribute("role",role);
            resp.sendRedirect("admin/adminhome.jsp");
        }
        else
        {
            out.println("<script>alert('invalid username or password');document.location.href='login2.html'</script>");
        }
        
        break;     
        case "librarian" :
            rs= st.executeQuery(" select * from librarianlogin where userval ='"+uname+"' and passval='"+pass+"' "); 
        if(rs.next())
        {
             session.setAttribute("username",uname);
             session.setAttribute("password",pass);
              session.setAttribute("role",role);
            resp.sendRedirect("librarian/librarianhome.jsp");
        }
        else
        {
            out.println("<script>alert('invalid username or password');document.location.href='login2.html'</script>");
        }
        break;   
        
    }
    }catch(Exception ex)
    {
        System.out.println(ex);
    }
    
    
}
public void destroy()
{
    try{
           //5.Close the statement and connection
          st.close();
         con.close();
        }catch(Exception ex)
        {
            System.out.println("Problem" +ex);
        }
}
}

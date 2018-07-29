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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author umesh patil
 */
@WebServlet(urlPatterns = {"/addbook"})
public class addbook extends HttpServlet {

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
        Logger.getLogger(addbook.class.getName()).log(Level.SEVERE, null, ex);
    }
        }else{
    
String bookid = request.getParameter("bookid");
String isbn = request.getParameter("isbn");
String title = request.getParameter("title");
String author = request.getParameter("author");
String edition = request.getParameter("edition");
int eyear = Integer.parseInt(request.getParameter("editionyear"));
String publisher = request.getParameter("publisher");
int pyear = Integer.parseInt(request.getParameter("publicationyear"));

            try {
                String q4 = "insert into books(book_id,ISBN,title,author,edition,edition_year,publisher,publication_year) values('"+bookid+"','"+isbn+"','"+title+"','"+author+"','"+edition+"',"+eyear+",'"+publisher+"',"+pyear+");";
                System.out.println(q4);
                st.executeUpdate(q4);
            } catch (SQLException ex) {
                ex.getMessage();
            }
            String role = (String)session.getAttribute("role");
            switch(role)
            {
                case "admin" : out.println("<script>alert('Successfully Added Book');document.location.href='admin/addbooks.jsp';</script>");
                break;
                case "librarian" :out.println("<script>alert('Successfully Added Book');document.location.href='librarian/addbooks.jsp';</script>");
            }
        
            }

        }
}

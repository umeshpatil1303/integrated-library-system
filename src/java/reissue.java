/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author umesh patil
 */
@WebServlet(urlPatterns = {"/reissue"})
public class reissue extends HttpServlet {

Connection con;
    Statement st;
    ResultSet rs;
    public void init()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/IntegratedLibrarySystem","root" ,"1111");
        
        st=con.createStatement();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
       
    }
public void service(HttpServletRequest request , HttpServletResponse response)
{PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            System.out.println(ex);
        }
    String sid = request.getParameter("entersid");
    String bid = request.getParameter("enterbid");
    String reissuedate = request.getParameter("reissuedate");
    String newexpiry = request.getParameter("enterexdate");
        try {
            rs = st.executeQuery("select issue_date,expiry_date from borrower where enrollno ='"+sid+"' and book_id = '"+bid+"';");
    if(rs.next())
    {
    String issue = rs.getString("issue_date");
    String expiry = rs.getString("expiry_date");
    
    st.executeUpdate("insert into returned(enrollno, book_id, issue_date, expiry_date, return_date) values('"+sid+"','"+bid+"','"+issue+"','"+expiry+"','"+reissuedate+"')");
    st.executeUpdate("update borrower set issue_date ='"+reissuedate+"',expiry_date='"+newexpiry+"' where enrollno='"+sid+"' and book_id='"+bid+"';");
        out.println("<script>alert('successfully reissued');document.location.href='librarian/reissue.jsp';</script>");
            }
    else{
       //error there is no book issued on this sid
        out.println("<script>alert('there is no record with this book id and student id');document.location.href='librarian/reissue.jsp';</script>");
    }
    } catch (SQLException ex) {
            System.out.println(ex);
        }
    
        
        
    
    
    
}



}

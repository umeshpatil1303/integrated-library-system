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
@WebServlet(urlPatterns = {"/generatefine"})
public class generatefine extends HttpServlet {
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
    

    public void service(HttpServletRequest request, HttpServletResponse response)
    {
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(generatefine.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession s2 = request.getSession();
         HttpSession mailsession = request.getSession();
        String enrollno = (String)s2.getAttribute("sid");
        String bid = (String)s2.getAttribute("bid");
        String returndate = (String)s2.getAttribute("returndate");
        String issued = (String)s2.getAttribute("issuedate");
        String expiryd = (String)s2.getAttribute("expirydate");
        System.out.println("value of "+issued);
        int cfine =  Integer.parseInt(request.getParameter("collectedfine"));
        int leavefine =  Integer.parseInt(request.getParameter("leavefine"));
        int totalfine =  Integer.parseInt(request.getParameter("tfine"));
                      int takenfine = cfine + leavefine;
                      int fine = totalfine - takenfine;
                      if(fine>=0)
                      {
                          try{
                          st.executeUpdate("update studentprofile set fine ='"+fine+"' where enrollno = '"+enrollno+"';");
                      st.executeUpdate("insert into returned(enrollno, book_id, issue_date, expiry_date, return_date) values('"+enrollno+"','"+bid+"','"+issued+"','"+expiryd+"','"+returndate+"');");
                      st.executeUpdate("delete from borrower where enrollno = '"+enrollno+"' and book_id ='"+bid+"';");
                     ResultSet rs4 = st.executeQuery("select Email from studentprofile where enrollno ='"+enrollno+"';");
            if(rs4.next())
            {
               String email = rs4.getString("Email");

            mailsession.setAttribute("mailid",email );
            String subject = "Book Returned";
            mailsession.setAttribute("subject",subject);
            String message ="Book with Book ID : "+bid+" is Returned by you. Fine Paid: "+cfine+" Fine Due : "+fine+" ";
            mailsession.setAttribute("mess",message);
            st.executeUpdate("insert into notification(enrollno,subject,message) values('"+enrollno+"','"+subject+"','"+message+"');");
                              try {
                                  response.sendRedirect("librarian/mail.jsp");
                              } catch (IOException ex) {
                                  Logger.getLogger(generatefine.class.getName()).log(Level.SEVERE, null, ex);
                              }
            }
                              
                          }catch(SQLException ex)
                          {
                              System.out.println(ex);
                          }
                          
                          }
    }
    
    
}

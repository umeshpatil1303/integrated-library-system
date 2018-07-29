<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Issue</title>
    <link rel="shortcut icon" type="image/png" href="logo.png"/>
    <link rel="shortcut icon" type="image/png" href="logo.png"/>
    <%!
    Connection con;
    Statement st;
    ResultSet rs, rs1, rs2, rs3, rs4 ;
    int count;
    int days ;
    int bookset ;
    %>
    <%
        
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/IntegratedLibrarySystem","root" ,"1111");
        st=con.createStatement();
        
    }catch(Exception ex)
    {
        System.out.println(ex);
    }
    
    String enroll = (String)session.getAttribute("username");
        String pass = (String)session.getAttribute("password");
        if((enroll==null) || (pass==null))
        {
            out.println("<script>alert('please login');</script>");
    try {
        response.sendRedirect("../login2.html");
    } catch (IOException ex) {
        ex.getMessage();
    }
        }else{
try{
 rs2 =st.executeQuery("select days from settings where sno ='1';");
 if(rs2.next())
 {
    days = rs2.getInt("days");
 }
}catch(SQLException exx)
{
    System.out.println(exx);
}

            HttpSession mailsession = request.getSession();
            
%>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
     <link href="../css/input.css" rel="stylesheet" type="text/css">
     <link href="../css/header.css" rel="stylesheet" type="text/css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<header><i class="glyphicon glyphicon-user" style="font-size: 20px"></i>
    <span style="color: whitesmoke;
    font-size: 20px;
    padding: 5px;
    font-family: comic sans-serif;">
               <%out.println("Librarian");%>
           </span>
           
    <form action="../logout" method="post" style="display: inline; float: right">
    <button style="
            background: whitesmoke;" type="submit" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-log-out"></span> Log out
    </button>
    </form>
    
           
</header>

    <ul>
  <li><a class="active" href="librarianhome.jsp">Issue</a></li>
  
  <li><a href="return.jsp">Return</a></li>
  <li><a href="books.jsp">Books</a></li>
  <li><a href="circulation_details.jsp">Circulation Details</a></li>
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a>Students</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a href="member_info.jsp">Student Details</a>
        <a href="addmember.jsp">Add Student</a>
    </div>
  </li>         
  <li><a href="addbooks.jsp">Add Books</a></li>
  <li><a href="report.jsp">Reports</a></li>
    </ul> 
           <section>
               <form class="forms" action="librarianhome.jsp" method="post">
                   <h2 style="font-family: comic sans; text-align: center ; color: #666666">Issue Books</h2>
                   <br>
                   <br>
                   <label class="addbook">Enter Student Id :</label>
                   <input type="text" class="forms_fields" placeholder="enter student id"  name="entersid" required>
  
                   <br><br>
                   <label class="addbook">Enter Book Id :</label>
                   <input type="text" class="forms_fields" placeholder="Enter Book ID" name="enterbid"  required>
                   <br><br>
                   <label class="addbook">Issue Date :</label>
                   <input type="date" class="forms_fields" id="currentDate" name="enteridate" readonly>
                   <script>
                       var dat = new Date();
                       document.getElementById('currentDate').value = dat.toJSON().slice(0,10);</script>
                   <br><br>
                   <label class="addbook">Expiry Date :</label>
                   <input type="date" class="forms_fields" id="expirydate" name="enterdate" readonly>
                   <script> var dat = new Date();
                       dat.setDate(dat.getDate()+ <%out.println(days);%>);
                       document.getElementById('expirydate').value = dat.toJSON().slice(0,10);</script>
                   <br><br>
                   <input type="submit" class="butn" name = "btn" value="Issue" >
               </form>
           </section>
                 
    
    
    
    
<%
   
if(request.getParameter("btn")!= null) {
            String enrollno = request.getParameter("entersid");
        String book = request.getParameter("enterbid");
        String issuedate = request.getParameter("enteridate");
        String expirydate = request.getParameter("enterdate");
        try {
            
        rs3 = st.executeQuery("select books from settings where sno ='1';");
        if(rs3.next())
        {
           bookset = rs3.getInt("books");
        }
        
    
        rs1 = st.executeQuery("select count(enrollno) as count from borrower where enrollno='"+enrollno+"';");
        
        if(rs1.next())
        {
            count = rs1.getInt("count");
        }
        
        
        rs = st.executeQuery("select * from borrower where book_id='"+book+"';");
        if(rs.next())
        {
            out.println("<script>");
            out.println("alert('Book Not Available'); document.location.href='librarianhome.jsp';");
            out.println("</script>");
             //alert for book already present
        }else if(count >= bookset)
        {
            out.println("<script>");
        out.println("alert('Issue limit exceed');document.location.href='librarianhome.jsp';");
        out.println("</script>");
        
                }else
        {
            
            st.executeUpdate("insert into borrower(enrollno,book_id,issue_date,expiry_date) values('"+enrollno+"','"+book+"','"+issuedate+"','"+expirydate+"')");
            rs4 = st.executeQuery("select Email from studentprofile where enrollno ='"+enrollno+"';");
            if(rs4.next())
            {
               String email = rs4.getString("Email");
            mailsession.setAttribute("mailid",email );
            String subject = "Book Issued";
            mailsession.setAttribute("subject",subject);
            String message ="Book with Book ID : "+book +" is issued on your card. Return Date of this Book is : "+expirydate+"";
            mailsession.setAttribute("mess",message);
            st.executeUpdate("insert into notification(enrollno,subject,message) values('"+enrollno+"','"+subject+"','"+message+"');");
            response.sendRedirect("mail.jsp");
            }
        }
    } catch (Exception ex) {
        System.out.println("sql exception"+ ex);
    }
 }
 }
%>




</body>
</html>
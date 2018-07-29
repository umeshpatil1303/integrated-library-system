
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Add Books</title>
    <%! 
    Connection con ;
    Statement st;
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
               <%out.println("Admin");%>
           </span>
           
    <form action="../logout" method="post" style="display: inline; float: right">
    <button style="
            background: whitesmoke;" type="submit" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-log-out"></span> Log out
    </button>
    </form>
    
           
</header>

    <ul>
  <li><a href="adminhome.jsp">DashBoard</a></li>
  <li><a href="books.jsp">Books</a></li>
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a>Circulation</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a href="circulation_details.jsp">Circulation  Details</a>
        <a href="circulation_settings.jsp">Circulation Settings</a>
    </div>
  </li>      
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a>Students</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a href="member_info.jsp">Students  Details</a>
        <a href="addmember.jsp">Add Student</a>
    </div>
  </li>
  <li><a class="active" href="addbooks.jsp">Add Books</a></li>
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a>Notifications</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a href="sendnotifi.jsp">Send Notifications</a>
        <a href="notification.jsp">View Notifications</a>
        <a href="updatenotifi.jsp">Update Notification</a>
        
    </div>
  </li>
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a>Suppliers</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a href="addsupplier.jsp">Add Supplier</a>
        <a href="suppliers.jsp">Supplier Details</a>
    </div>
  </li>
    </ul>     
            <section>
               <div>
                   <form action="../addbook" method="post" class="forms"  >
                       <h2 style="font-family: comic sans; text-align: center ; color: #666666">Add Books</h2>
                       <br>
                       <label class="addbook">Book Id  :</label>
                   <input type ="text" class="forms_fields" placeholder="Book ID" name="bookid" required>
                   <br>
                   <br><label class="addbook">ISBN Number  :</label>
                   <input type ="text" class="forms_fields" placeholder="ISBN" name="isbn" required>
                   <br>
                   <br><label class="addbook">Book Title  :</label>
                   <input type ="text" class="forms_fields" placeholder="Title" name="title" required>
                   <br>
                   <br><label class="addbook">Author Name  :</label>
                   <input type ="text" class="forms_fields" placeholder="Author" name="author" required>
                   <br>
                   <br><label class="addbook">Book Edition  :</label>
                   <input type ="text" class="forms_fields" placeholder="Edition" name="edition" required>
                   <br>
                   <br><label class="addbook">Edition Year  :</label>
                   <input type ="number" class="forms_fields" placeholder="Edition Year" name="editionyear" required>
                   <br>
                   <br><label class="addbook">Book Publisher  :</label>
                   <input type ="text" class="forms_fields" placeholder="Publisher" name="publisher" required>
                   <br>
                   <br><label class="addbook">Publication Year  :</label>
                   <input type ="number" class="forms_fields" placeholder="Publication Year" name="publicationyear" required>
                   <br><br>
                   <input type="submit" value="Add Books" class="butn">
               </form>
               </div>
           </section>
           
<% } %>
</body>
</html>
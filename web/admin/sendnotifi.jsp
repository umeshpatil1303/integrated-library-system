
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Send Notification</title>
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
     <link href="../css/query.css" rel="stylesheet" type="text/css">
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
  <li><a href="addbooks.jsp">Add Books</a></li>
  
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a class="active">Notifications</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a class="active" href="sendnotifi.jsp">Send Notifications</a>
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
               
               <form action="mail.jsp" method="post">
                   <input type="submit" value="Notify Delayed Students" class="butn">
               </form>
               <button type="button" onclick="asd(1)" class="butn" value="send mail">Send Mail</button>
               
               <form id="asd" action="mail1.jsp" class="forms" style="margin-top: 30px">
                   <h1>&bull; Send Mail &bull;</h1>
                   <br>
                   <div class="underline">
  </div>
  <div class="icon_wrapper">
    <img src="Mail.png" class="icon">
  </div><br>
                  <div class="telephone">
      <label for="name"></label>
      <input type="email" placeholder="Enter Email Id ...." name="email"  required>
    </div>
                   <div class="subject">
      <label for="subject"></label>
      <input type="text" placeholder="Subject is..... " name="subject" required>
    </div>
                   <div class="message">
      <label for="message"></label>
      <textarea name="message" placeholder="I'd like to chat about" cols="30" rows="5" required></textarea>
    </div>
      <br>
    <div class="submit">
        <input type="submit" value="Send Mail" id="form_button" />
    </div>
            </form>
<script type="text/javascript">

  window.onload = function() {

    document.getElementById("asd").style.display = "none";

  };

  function asd(a) {
  
    if (a == 1) {
      document.getElementById("asd").style.display = "block";
    } else {
      document.getElementById("asd").style.display = "none";
    }
      
  }
</script>
           
           </section>
<% } %>
</body>
</html>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Add Student</title>
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
  <li><a href="addbooks.jsp">Add Books</a></li>
 
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
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a class="active">Suppliers</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a class="active" href="addsupplier.jsp">Add Supplier</a>
        <a  href="suppliers.jsp">Supplier Details</a>
    </div>
  </li>
    </ul> 
           <section>
               <div>
                   <form action="addsupplier.jsp" method="post" class="forms"  >
                       <h2 style="font-family: comic sans; text-align: center ; color: #666666">Add Student</h2>
                       <br>
                       <label class="addbook">Supplier ID  :</label>
                   <input type ="text" class="forms_fields" placeholder="Enter Supplier IDr" name="suppid" required>
                   <br>
                   <br>
                   <label class="addbook">Name  :</label>
                   <input type ="text" class="forms_fields" placeholder="Enter Name:" name="name" required>
                   <br>
                   <br>
                   <label class="addbook">Phone Number  :</label>
                   <input type ="number" class="forms_fields" placeholder="Contact Number" name="phone" required>
                   <br>
                   <br>
                   <label class="addbook">Email ID  :</label>
                   <input type ="email" class="forms_fields" placeholder="Enter Email ID" name="email" required>
                   <br>
                   <br><label class="addbook">Address  :</label>
                   <input type ="text" class="forms_fields" placeholder="Enter Address" name="address" required>
                   <br><br>
                   <input type="submit" value="Add Supplier" class="butn" name="supp">
               </form>
               </div>
               <%!
               String suppid;
               String name;
               String number;
               String email;
               String address ;
               %>
               <%
               if(request.getParameter("supp")!=null)
               {
                   suppid = request.getParameter("suppid");
                   name = request.getParameter("name");
                   number = request.getParameter("phone");
                   email = request.getParameter("email");
                   address = request.getParameter("address");
                   
                   try
                   {
                   
                       st.executeUpdate("insert into supplier values('"+suppid+"','"+name+"','"+number+"','"+email+"','"+address+"');");
                       
                   } catch(Exception ex)
                   {
                      System.out.println(ex); 
                   }
                   %>
               
                   <script>alert('Supplier Details Added'); document.location.href='suppliers.jsp';</script>
               <%
               }
               %>
               
               
           </section>
<% } %>
</body>
</html>
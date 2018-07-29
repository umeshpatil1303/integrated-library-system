<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>DashBoard</title>
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
     <link href="../css/card.css" rel="stylesheet" type="text/css">
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
  <li><a class="active" href="adminhome.jsp">DashBoard</a></li>
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
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a>Suppliers</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a href="addsupplier.jsp">Add Supplier</a>
        <a href="suppliers.jsp">Supplier Details</a>
    </div>
  </li>
    </ul> 
           


                        
    <%!
    ResultSet rs, rs1, rs2, rs3, rs4, rs5, rs6, rs7, rs8 ;
    int todayissuebooks;
    int todayreturnbooks;
    int todayaddbooks;
    int totalissued ;
    int totalbooks ;
    int totalstudents ;
    int monthissuebooks;
    int monthreturnbooks;
    int monthaddbooks ;
    %>
               <%
                   try{
                  rs= st.executeQuery("select count(book_id) as todayissue from borrower where issue_date = current_date;");
                  if(rs.next())
                  todayissuebooks = rs.getInt("todayissue");
                  rs1 = st.executeQuery("select count(book_id) as totalissued from borrower;");
                  if(rs1.next())
                  totalissued = rs1.getInt("totalissued");
                  rs2 = st.executeQuery("select count(book_id) as totalbooks from books;");
                  if(rs2.next())
                  totalbooks = rs2.getInt("totalbooks");
                  rs3 = st.executeQuery("select count(enrollno) as totalstudents from studentprofile;");
                  if(rs3.next())
                  totalstudents = rs3.getInt("totalstudents");
                  rs4= st.executeQuery("select count(book_id) as todayreturned from returned where return_date = current_date;");
                  if(rs4.next())
                  todayreturnbooks = rs4.getInt("todayreturned");
                  rs5= st.executeQuery("select count(book_id) as todaybook from books where date(bookadded) = date(current_date);");
                  if(rs5.next())
                  todayaddbooks = rs5.getInt("todaybook");
                  
                  rs6 = st.executeQuery("select count(book_id) as monthbook from books where month(bookadded) = month(current_date);");
                  if(rs6.next())
                  monthaddbooks = rs6.getInt("monthbook");
                  rs7= st.executeQuery("select count(book_id) as monthissue from borrower where month(issue_date) = month(current_date);");
                  if(rs7.next())
                  monthissuebooks = rs7.getInt("monthissue");
                  rs8= st.executeQuery("select count(book_id) as monthreturn from returned where month(return_date) = month(current_date);");
                  if(rs8.next())
                 monthreturnbooks = rs8.getInt("monthreturn");

                   %>
           
           
           <section>
               <!-- total -->
               <div><h1 style="text-align: center;">Overall Report</h1></div>
               <!-- 1st -->
               <div class="row">
               <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/1.jpg);
    background-repeat: no-repeat;
    background-size: 100%;">
  <div class="card-img-overlay">
      <img src="../image/bookicon.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.6;">
      <h1 class="card-title"><% out.println(totalbooks); %></h1>
      
    <p class="card-text">Total Books</p>
   
  </div>
</div>
         <!-- 2nd -->
         <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/2.jpg);
    background-repeat: no-repeat;
    background-size: 100%; margin-left: 50px;">
  <div class="card-img-overlay">
      <img src="../image/bookicon2.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.7;">
    <h1 class="card-title"><% out.println(totalissued); %></h1>
    <p class="card-text">Total Issued Books</p>
  </div>
</div>   
         
          <!-- 3nd -->
         <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/3.jpg);
    background-repeat: no-repeat;
    background-size: 100%;margin-left: 50px;">
  <div class="card-img-overlay">
      <img src="../image/studenticon.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.7;">
    <h1 class="card-title"><% out.println(totalstudents); %></h1>
    <p class="card-text">Total Students</p>
  </div>
</div>   
               </div>
    <hr>
    <!-- today -->
    <div><h1 style="text-align: center;">Today's Report</h1></div><br>
    <!-- 1st -->
    <div class="row">
               <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/1.jpg);
    background-repeat: no-repeat;
    background-size: 100%;">
  <div class="card-img-overlay">
      <img src="../image/bookicon3.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.78;">
      <h1 class="card-title"><% out.println(todayissuebooks); %></h1>
    <p class="card-text">Today Issued Books</p>
  </div>
</div>
         <!-- 2nd -->
         <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/2.jpg);
    background-repeat: no-repeat;
    background-size: 100%; margin-left: 50px;">
  <div class="card-img-overlay">
      <img src="../image/bookicon4.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.78;">
    <h1 class="card-title"><% out.println(todayreturnbooks); %></h1>
    <p class="card-text">Today Returned Books</p>
  </div>
</div>   
         
          <!-- 3nd -->
         <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/3.jpg);
    background-repeat: no-repeat;
    background-size: 100%; margin-left: 50px;">
  <div class="card-img-overlay">
      <img src="../image/bookicon5.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.78;">
    <h1 class="card-title"><% out.println(todayaddbooks); %></h1>
    <p class="card-text">Today Added Books</p>
  </div>
</div>   
               </div>
    <hr>
   
    <!-- month -->
    <div><h1 style="text-align: center;">Current Month Report</h1></div><br>
    <!-- 1st -->
    <div class="row">
               <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/1.jpg);
    background-repeat: no-repeat;
    background-size: 100%;">
  <div class="card-img-overlay">
      <img src="../image/bookicon6.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.6;">
      <h1 class="card-title"><% out.println(monthissuebooks); %></h1>
    <p class="card-text">Current Month Issued Books</p>
  </div>
</div>
         <!-- 2nd -->
         <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/2.jpg);
    background-repeat: no-repeat;
    background-size: 100%; margin-left: 50px;">
  <div class="card-img-overlay">
      <img src="../image/bookicon7.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.78;">
    <h1 class="card-title"><% out.println(monthreturnbooks); %></h1>
    <p class="card-text">Current Month Returned Books</p>
  </div>
</div>   
         
          <!-- 3nd -->
         <div class="card bg-dark text-white col-sm-3" style="height: 120px;
    width: 260px;
    background: url(../image/3.jpg);
    background-repeat: no-repeat;
    background-size: 100%; margin-left: 50px;">
  <div class="card-img-overlay">
      <img src="../image/bookicon8.png" style="float: right;
    width: 100px;
    margin-top: -6px;
    opacity: 0.78;">
    <h1 class="card-title"><% out.println(monthaddbooks); %></h1>
    <p class="card-text">Current Month Added Books</p>
  </div>
</div>   
               </div>
    
    
           </section>
<% } catch(Exception ex)
{
System.out.println(ex);
}

}
%>
</body>
</html>
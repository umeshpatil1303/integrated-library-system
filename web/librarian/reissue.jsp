<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Reissue</title>
    <link rel="shortcut icon" type="image/png" href="logo.png"/>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
     <link href="../css/header.css" rel="stylesheet" type="text/css">
     <link href="../css/input.css" rel="stylesheet" type="text/css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></head>
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
  <li><a href="librarianhome.jsp">Issue</a></li>
  
  <li><a  href="return.jsp">Return</a></li>
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
               <form class="forms" action="../reissue" method="post">
                   <h2 style="font-family: comic sans; text-align: center ; color: #666666">Re-Issue</h2>
                   <br>
                   <br>
                   <label class="addbook">Enter Student Id :</label>
                   <input type="text" class="forms_fields" placeholder="Enter Student ID" name="entersid">
                   <br><br>
                   <label class="addbook">Enter Book Id :</label>
                   <input type="text" class="forms_fields" placeholder="Enter Book ID" name="enterbid">
                   <br><br>
                   <label class="addbook">Reissue Date :</label>
                   <input type="date" class="forms_fields" id="redate"  name="reissuedate" readonly>
                   <script>
                       var dat = new Date();
                       document.getElementById('redate').value = dat.toJSON().slice(0,10);</script>
                   <br><br>
                   <label class="addbook">New Expiry Date :</label>
                   <input type="date" class="forms_fields" id="newexpiry" name="enterexdate" readonly>
                   <script> var dat = new Date();
                       dat.setDate(dat.getDate()+ 20)
                       document.getElementById('newexpiry').value = dat.toJSON().slice(0,10);</script>
                                      <br><br>

                   <input type="submit" class="butn" value="Re-Issue">
                   
                      
           </section>
</body>
</html>
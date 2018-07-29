<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Add Student</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link rel="shortcut icon" type="image/png" href="logo.png"/>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
    <link href="../css/input.css" rel="stylesheet" type="text/css">
     <link href="../css/header.css" rel="stylesheet" type="text/css">
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
  
  <li><a href="return.jsp">Return</a></li>
  <li><a href="books.jsp">Books</a></li>
  <li><a  href="circulation_details.jsp">Circulation Details</a></li>
  <li>
      <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: none;
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a class="active">Students</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
          <a  href="member_info.jsp">Student Details</a>
        <a class="active" href="addmember.jsp">Add Student</a>
    </div>
  </li>  
  <li><a href="addbooks.jsp">Add Books</a></li>
  <li><a href="report.jsp">Reports</a></li>
    </ul>  
           
           <section>
               <div>
                   <form action="../addmember" method="post" class="forms"  >
                       <h2 style="font-family: comic sans; text-align: center ; color: #666666">Add Student</h2>
                       <br>
                       <label class="addbook">Enroll no.  :</label>
                   <input type ="text" class="forms_fields" placeholder="Enter Enrollment Number" name="enrollno" required>
                   <br>
                   <br><label class="addbook">Create Password  :</label>
                   <input type ="password" class="forms_fields" placeholder="Create Password" name="password" required>
                   <br>
                   <br>
                   <label class="addbook">Name  :</label>
                   <input type ="text" class="forms_fields" placeholder="Enter Name:" name="name" required>
                   <br>
                   <br><label class="addbook">year  :</label>
                   <input type ="number" class="forms_fields" placeholder="year of course" name="year" required>
                   <br>
                   <br><label class="addbook">course  :</label>
                   <input type ="text" class="forms_fields" placeholder="ex:BE(CSE)" name="course" required>
                   <br>
                   <br><label class="addbook">Date of Birth  :</label>
                   <input type ="date" class="forms_fields" placeholder="Enter DOB" name="dob" required>
                   <br>
                   <br><label class="addbook">Phone Number  :</label>
                   <input type ="number" class="forms_fields" placeholder="Enter Phone Number" name="phone" required>
                   <br>
                   <br><label class="addbook">Email ID  :</label>
                   <input type ="email" class="forms_fields" placeholder="Enter Email ID" name="email" required>
                   <br>
                   <br><label class="addbook">Address  :</label>
                   <input type ="text" class="forms_fields" placeholder="Enter Address" name="address" required>
                   <br><br>
                   <input type="submit" value="Add Student" class="butn">
               </form>
               </div>
           </section>
           
           
</body>
</html>
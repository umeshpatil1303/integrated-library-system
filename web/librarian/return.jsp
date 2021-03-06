<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Return</title>
    <link rel="shortcut icon" type="image/png" href="logo.png"/>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
     <link href="../css/header.css" rel="stylesheet" type="text/css">
     <link href="../css/input.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <%! 
    Connection con;
    Statement st;
    ResultSet rs;
    String issue;
    String expiry; String sid;String bid; String returndate;
    %>
    <% 
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
       
    %>
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
  
  <li><a class="active" href="return.jsp">Return</a></li>
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
               <form class="forms" action="return.jsp" method="post">
                   <h2 style="font-family: comic sans; text-align: center ; color: #666666">Return Books</h2>
                   <br>
                   <br>
                   <label class="addbook">Enter Student Id :</label>
                   <input type="text" class="forms_fields" placeholder="Enter Student ID" name="entersid" required>
                   <br><br>
                   <label class="addbook">Enter Book Id :</label>
                   <input type="text" class="forms_fields" placeholder="Enter Book ID" name="enterbid" required>
                   <br><br>
                   <label class="addbook"> Return Date :</label>
                   <input type="date" class="forms_fields" id="rdate" name="returndate" readonly>
                   <script>
                       var dat = new Date();
                       document.getElementById('rdate').value = dat.toJSON().slice(0,10);</script>
                   <br><br>
                   <input type="submit" class="butn" name="return" value="Return" >
             <%  
                if(request.getParameter("return")!=null)
                {
                    HttpSession s2 = request.getSession();
    sid = request.getParameter("entersid");
    bid = request.getParameter("enterbid");
    returndate = request.getParameter("returndate");
        try {
            rs = st.executeQuery("select issue_date,expiry_date from borrower where enrollno ='"+sid+"' and book_id = '"+bid+"';");
            if(rs.next())
    {
    issue = rs.getString("issue_date");
    expiry = rs.getString("expiry_date");
    s2.setAttribute("sid", sid);
    s2.setAttribute("bid", bid);
    s2.setAttribute("returndate", returndate);
    s2.setAttribute("issuedate", issue);
    s2.setAttribute("expirydate", expiry);
    response.sendRedirect("fine.jsp");
            }
    else{
       //error there is no book issued on this sid
        out.println("<script>alert('there is no record with this book id and student id');document.location.href='return.jsp';</script>");
    }
    } catch (SQLException ex) {
            System.out.println(ex);
        }
                }
        %>

  
   </form> 
</section>
       
</body>
</html>

<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head><title>Circulation Details</title>
    <%! 
    Connection con ;
    Statement st;
    ResultSet rs;
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
    <link href="../css/table.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
    <link href="../css/header.css" rel="stylesheet" type="text/css">
    <link href="../css/input.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></head>
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
    background-color: inherit;min-width: -webkit-fill-available; text-align: left"><a class="active">Circulation</a></button>
      <div class="dropdown-menu" style="top:auto;min-width: -webkit-fill-available;
    background: currentColor; font:inherit">
        <a class="active" href="circulation_details.jsp">Circulation  Details</a>
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
           <section>
    <h2 style="font-family: comic sans; text-align: center ; color: #666666">Circulation Details</h2>
     <br><br>
     <select class="table-fields" >
         <option value="issue">Issued</option>
         <option value="return">Returned</option>
     </select>
     <br><br>
     <div class="table-responsive" style="height: 300px">
            
       <table id="issue" class="table table-hover" style="max-width: inherit; width: 140%; ">
           <thead>
            <th>Enroll NO.</th>
            <th>Name</th>
            <th>Student Phone NO.</th>
            <th>Book No.</th>
            <th>Issue Date</th>
            <th>Expiry Date</th>
       </thead>
    <%
        String q ="select studentprofile.enrollno,studentprofile.name,studentprofile.phone_no,book_id,issue_date,expiry_date from borrower inner join studentprofile on borrower.enrollno = studentprofile.enrollno;"; 
        rs = st.executeQuery(q);
        while(rs.next())
        {
            %>
            <tr>
                
                <td><% out.println(rs.getString("enrollno")); %></td>
                <td><% out.println(rs.getString("name")); %></td>
                <td><% out.println(rs.getString("phone_no")); %></td>
                <td> <%out.println(rs.getString("book_id"));%></td>
                <td><% out.println(rs.getString("issue_date")); %></td>
                <td><% out.println(rs.getString("expiry_date")); %></td>
            </tr>
            <%
        }
    %>
            
        </table>
    
        
       <table id="return" class="table table-hover" style="max-width: inherit; width: 140%; display: none;">
           <thead>
            <th>Enroll NO.</th>
            <th>Name</th>
            <th>Student Phone NO.</th>
            <th>Book No.</th>
            <th>Issue Date</th>
            <th>Expiry Date</th>
            <th>Return Date</th>
       </thead>
    <%
        String q1 ="select studentprofile.enrollno,studentprofile.name,studentprofile.phone_no,book_id,issue_date,expiry_date, return_date from returned inner join studentprofile on returned.enrollno = studentprofile.enrollno;"; 
        rs = st.executeQuery(q1);
        while(rs.next())
        {
            %>
            <tr>
                
                <td><% out.println(rs.getString("enrollno")); %></td>
                <td><% out.println(rs.getString("name")); %></td>
                <td><% out.println(rs.getString("phone_no")); %></td>
                <td> <%out.println(rs.getString("book_id"));%></td>
                <td><% out.println(rs.getString("issue_date")); %></td>
                <td><% out.println(rs.getString("expiry_date")); %></td>
                <td><% out.println(rs.getString("return_date")); %></td>
            </tr>
            <%
        }
    %>
            
        </table>
    </div>    
    </section>
<% } %>
<script>
        $('select').change(function(){
    if($(this).val() != "-1")
    {
    $('table.table').hide();
    $('table#'+$(this).val()).show();
    }
})    
    </script>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>My Notifications</title>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
    <link href="../css/header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div>
    <header><i class="glyphicon glyphicon-user" style="font-size: 20px"></i>
    <%!
        Connection con;
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
        }else{
       rs= st.executeQuery("select name from studentprofile where enrollno='"+enroll+"';");
       if(rs.next())
       {
           %>
           <span style="color: whitesmoke;
    font-size: 20px;
    padding: 5px;
    font-family: comic sans-serif;">
               <%out.println(rs.getString("name"));%>
           </span>
          <% }
        }
    %>
    <form action="../logout" method="post" style="display: inline; float: right">
    <button style="
            background: whitesmoke;" type="submit" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-log-out"></span> Log out
    </button>
    </form>
    </header></div>
    <ul>
  <li><a href="studenthome.jsp">New Arrivals</a></li>
  <li><a href="books.jsp">Books</a></li>
  <li><a href="circulation.jsp">Circulation List</a></li>
  <li><a class="active" href="notifications.jsp">My Notifications</a></li>
    <li><a href="query.jsp">Query</a></li>
    </ul> 
    
    
    <section>
        <h2 style="font-family: comic sans; text-align: center ; color: #666666">Notifications</h2>
        <br><br>
        <div class="table-responsive">
            
       <table id="myTable" class="table table-hover" style="max-width: inherit; width: 140%">
           <thead>
           <th>Date</th>
           <th>Subject</th>
           <th>Message</th>
       </thead>
    <%
        rs = st.executeQuery("select * from notification;");
        while(rs.next())
        {
            %>
            <tr class="header">
                
                <td><% out.println(rs.getString("currentdate")); %></td>
                <td><% out.println(rs.getString("subject")); %></td>
                <td><% out.println(rs.getString("message")); %></td>
               
            </tr>
            <%
        }
    %>
            
        </table>
    </div>    
    </section>
    
    
</body>
</html>
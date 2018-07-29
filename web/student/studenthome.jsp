<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>New Arrivals</title>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
    <link href="../css/header.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div>
    <header><i class="glyphicon glyphicon-user" style="font-size: 20px"></i>
   
    <%!
        Connection con;
        Statement st;
        ResultSet rs, rs1;
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
            response.sendRedirect("login2.html");
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
  <li><a class="active" href="studenthome.jsp">New Arrivals</a></li>
  <li><a href="books.jsp">Books</a></li>
  <li><a href="circulation.jsp">Circulation List</a></li>
  <li><a href="notifications.jsp">My Notifications</a></li>
  <li><a href="query.jsp">Query</a></li>
    </ul>
    <section><div class="container-fluid">
            <div class="row col-sm-12">
        <%
        rs1 = st.executeQuery("select * from books order by bookadded desc limit 3;");
        while(rs1.next())
        {
         
        %>
        
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="book.png" alt="...">
                        <div class="caption">
                            <h3><b><% out.println(rs1.getString("title")) ; %></b></h3>
                            <p>Book Id : <% out.println(rs1.getString("book_id")) ; %></p>
                            <p>Author : <% out.println(rs1.getString("author")) ; %></p>
                            <p>Edition : <% out.println(rs1.getString("edition")) ; %></p>
                            <p>Publisher : <% out.println(rs1.getString("publisher")) ; %></p>
                        </div>
                    </div>
                </div>
            
        <% } %>
        </div>
</div>
    </section>
    
</body>
</html>
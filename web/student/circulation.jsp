<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head><title>Circulation list </title>
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/table.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
    <link href="../css/header.css" rel="stylesheet" type="text/css">
    <link href="../css/input.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body><div>
<header><i class="glyphicon glyphicon-user" style="font-size: 20px"></i>
     
    <%!
        Connection con;
        Statement st;
        ResultSet rs;
        String enroll ;
        String pass ;
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
        enroll = (String)session.getAttribute("username");
        pass = (String)session.getAttribute("password");
        if((enroll==null) || (pass==null))
        {
            out.println("<script>alert('please login');document.location.href='login2.html'</script>");
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
  <li><a class="active" href="circulation.jsp">Circulation List</a></li>
  <li><a href="notifications.jsp">My Notifications</a></li>
  <li><a href="query.jsp">Query</a></li>
    </ul>
    <section>
     <h2 style="font-family: comic sans; text-align: center ; color: #666666">Circulation Details</h2>
     <br><br>
     <select class="table-fields">
         <option value="issue">Issued</option>
         <option value="return">Returned</option>
     </select>
       <br><br>
        <div class="table-responsive">
            
       <table id="issue" class="table table-hover" style="max-width: inherit; width: 140%;">
           <thead>
            <th>Book ID</th>
            <th>Book Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Issue Date</th>
            <th>Expiry Date</th></thead>
    <%
        String q ="select borrower.book_id , books.title, books.author, books.publisher, issue_date, expiry_date from borrower inner join books on borrower.book_id = books.book_id where enrollno='"+enroll+"';"; 
        rs = st.executeQuery(q);
        while(rs.next())
        {
            %>
            <tr>
                <td><% out.println(rs.getString("book_id")); %></td>
                <td><% out.println(rs.getString("title")); %></td>
                <td><% out.println(rs.getString("author")); %></td>
                <td><% out.println(rs.getString("publisher")); %></td>
                <td><% out.println(rs.getString("issue_date")); %></td>
                <td><% out.println(rs.getString("expiry_date")); %></td>
            </tr>
            <%
        }
    %>
            
        </table>
    <table id="return" class="table table-hover" style="max-width: inherit; width: 140%; display: none; margin-bottom: -500px">
           <thead>
            <th>Book ID</th>
            <th>Book Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Issue Date</th>
            <th>Expiry Date</th>
            <th>Return Date</th>
    </thead>
    <%
        String q1 ="select returned.book_id , books.title, books.author, books.publisher, issue_date, expiry_date, return_date from returned inner join books on returned.book_id = books.book_id where enrollno='"+enroll+"';"; 
        rs = st.executeQuery(q1);
        while(rs.next())
        {
            %>
            <tr>
                <td><% out.println(rs.getString("book_id")); %></td>
                <td><% out.println(rs.getString("title")); %></td>
                <td><% out.println(rs.getString("author")); %></td>
                <td><% out.println(rs.getString("publisher")); %></td>
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
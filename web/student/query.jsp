<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Query form</title>
    <link href="../css/navbar.css" rel="stylesheet" type="text/css">
    <link href="../css/section.css" rel="stylesheet" type="text/css">
     <link href="../css/header.css" rel="stylesheet" type="text/css">
      <link href="../css/query.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body><div>
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
  <li><a  href="studenthome.jsp">New Arrivals</a></li>
  <li><a  href="books.jsp">Books</a></li>
  <li><a href="circulation.jsp">Circulation List</a></li>
  <li><a href="notifications.jsp">My Notifications</a></li>
  <li><a class="active" href="query.jsp">Query</a></li>
    </ul> 
    
    
                            
<section>
<div id="container">
    <br>
  <h1>&bull; Contact Library &bull;</h1>
  <div class="underline">
  </div>
  <div class="icon_wrapper">
    <img src="query.png" class="icon">
  </div>
  <form action="query.jsp" method="post" id="contact_form" class="form1">
    <div class="name">
      <label for="enrollno"></label>
      <input type="text" placeholder="My Enrollment No. is" name="enrollno" value="<% out.println(enroll); %>" readonly>
    </div>
    <div class="email">
      <label for="name"></label>
      <input type="text" placeholder="My Name is" name="name" required>
    </div>
    <div class="telephone">
      <label for="name"></label>
      <input type="email" placeholder="My Email Id is" name="email"  required>
    </div>
    <div class="subject">
      <label for="subject"></label>
      <input type="text" placeholder="Subject is " name="subject" required>
    </div>
    <div class="message">
      <label for="message"></label>
      <textarea name="message" placeholder="I'd like to chat about" cols="30" rows="5" required></textarea>
    </div>
      <br>
    <div class="submit">
        <input type="submit" value="Send Message" name="subbutton" id="form_button" />
    </div>
  </form><!-- // End form -->
</div><!-- // End #container -->

</section>
<!--Section: Contact v.2-->
<%!
String enrollno;
String name;
String email;
String subject;
String message;

%>   
<%
    if(request.getParameter("subbutton")!= null)
    {
   enrollno = request.getParameter("enrollno");
  name = request.getParameter("name");
  email = request.getParameter("email");
  subject = request.getParameter("subject");
  message = request.getParameter("message");
 
    try {
        st.executeUpdate("insert into adminnotification(enrollno,name,email,subject,message) values('"+enrollno+"','"+name+"','"+email+"','"+subject+"','"+message+"')");
    } catch (SQLException ex) {
        System.out.println(ex);
    }
    %>
    <script>alert('Query Submitted'); document.location.href='query.jsp';</script>
<%
    
    
    }
    
    %>
</body>
</html>
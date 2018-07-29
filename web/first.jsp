<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<html>
<head>
<title>Integrated library system</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="shortcut icon" type="image/png" href="logo.png"/>
  <link rel="shortcut icon" type="image/png" href="logo.png"/>
<script type="text/javascript">
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
</script>
<style>
    .modal1{
        float: right; margin-left: 575px; margin-top: 60px
    }
    
</style>
</head>
<%!
    Connection con;
    Statement st;
    ResultSet rs ;
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
    %>
<body style='background-image: url("welcomeimg.jpeg");background-repeat: no-repeat;background-size: 100%;'>
    <div id="myModal" class="modal fade modal1">
    <div class="modal-dialog">
        <div class="modal-content" style="background: beige;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Library Latest News</h4>
            </div>
            <div class="modal-body">
                <table>
                    <% 
                        try{
                     rs = st.executeQuery("select notiwall from notificationwall;");
                     while(rs.next())
                     {%>
                       <tr>
                           <td style="padding: 15px"><span class="glyphicon glyphicon-chevron-right"></span> <%out.println(rs.getString("notiwall"));%></td>
                      </tr>
                               <%
                     }
                    } catch(Exception ex)
                    {
                        System.out.println(ex);
                    }
                    %>
                    </table>
            </div>
        </div>
    </div>
</div>
<div style="color: beige;
    margin: auto;
    width: 900px;
    padding: 220px;
    float: left;
    font-size: 25px;
    font-family: serif;"
    >
    <h1 style="
    font-size: 50px;
    ">Welcome to library System</h1>
    <a href="login2.html"><button style="font-size: 18px" type="button" class ="btn btn-success">Login</button></a>
</div>

</body>
</html>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><title>Fine</title>
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
    ResultSet rs, rs1;
    int finedue = 0;
    int diffdays;
    int currentfine = 0;
    int totalfine ;
    int fine ;
    int fineset ;
    String enrollno ;
    String returndate ;
    String expiry ;
    DateFormat date ;
    Date return_date ;
    Date expirydate ;
  
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
    <header style=" filter :blur(3px);"><i class="glyphicon glyphicon-user" style="font-size: 20px"></i>
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
           <ul style=" filter :blur(3px);">
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
               <form class="forms" action="..\generatefine" method="post">
                    <h2 style="font-family: comic sans; text-align: center ; color: #666666">fines</h2>
                   <br>
                   <br>
                   <% try{
                       HttpSession s2 = request.getSession();
                        enrollno = (String)s2.getAttribute("sid");
                        returndate = (String)s2.getAttribute("returndate");
                        expiry = (String)s2.getAttribute("expirydate");
                        date = new SimpleDateFormat("yyyy-MM-dd");
                        return_date = date.parse(returndate);  
                        expirydate =  date.parse(expiry);
                     rs =  st.executeQuery("select fine from studentprofile where enrollno='"+enrollno+"';");
                   if(rs.next())
                   {
                       finedue = rs.getInt("fine");
                   }
                   rs1 = st.executeQuery("select fine from settings where sno ='1';");
                   if(rs1.next())
                   {
                       fineset = rs1.getInt("fine");
                   }
                       
                       diffdays = (int) ((return_date.getTime() - expirydate.getTime())/(1000*60*60*24));
                       if(diffdays>=0)
                      currentfine = diffdays * fineset; 
                      totalfine = currentfine + finedue;
                      }catch(Exception ex)
                       {
                           System.out.println(ex);
                       }
                   %>
                   <label class="addbook">fine Due : <span style="margin: 230px;"><% out.println(finedue); %> </span></label>
                   <br>
                   <label class="addbook">Current fine : <span style="margin: 207px;"><% out.println(currentfine); %> </span></label>
                   <br>
                   <label class="addbook">Total Fine :<span style="margin: 225px;"><% out.println(totalfine); %> </span></label>
                   <br>
                   <label class="addbook"> fine Collected :</label>
                   <input type="number" class="forms_fields" name="collectedfine" value="0">
                    <br><br>
                    <label class="addbook"> Leave fine :</label>
                    <input type="number" class="forms_fields" name="leavefine" value="0">
                    <br><br>
                   <input type="submit" class="butn" name="collect" value="collect fine" >
                   <input type="text" value="<% out.println(totalfine); %>" name="tfine" hidden>
                   </form> 
                   
</section>
</body>
</html>
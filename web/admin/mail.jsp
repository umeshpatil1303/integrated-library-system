<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

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
        
    
    
    rs= st.executeQuery("select book_id,expiry_date,studentprofile.Email from borrower inner join studentprofile on borrower.enrollno=studentprofile.enrollno where current_date <= expiry_date;");
    
    while(rs.next())
    {
       final String to = rs.getString("Email");
       
       String book = rs.getString("book_id");
       String expiry = rs.getString("expiry_date");

    final String subject = " Delay in book return ";
    
    String mess = "You have to return the Book with Book Id : "+book+" and it's return date was "+expiry+". Fine will be taken if more delayed. ";

    final String messg = mess;
 
    // Sender's email ID and password needs to be mentioned

    final String from = "iist.library.minor@gmail.com";
    final String pass = "0818cs151219";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));

        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);

        // Send message

        Transport.send(message);
%>
<script>alert('Successful');document.location.href='sendnotifi.jsp';</script>
<%
    } catch (MessagingException mex) {

        mex.printStackTrace();
%>
       <script>alert('email is not sent due to error');document.location.href='sendnotifi.jsp';</script>
<%
    }
}
%>
<script>alert('There are no Delayed Students');document.location.href='sendnotifi.jsp';</script>
       <%

}catch(Exception ex)
    {
        System.out.println(ex);
    }
%>